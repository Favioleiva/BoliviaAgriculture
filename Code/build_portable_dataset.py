"""Build a lossless, bilingual municipal Parquet release from preserved aggregates.

No REDATAM execution, imputation, source rewriting or network access.
Run the included copy with --sources <package> --output <new-directory>.
"""
from pathlib import Path
from decimal import Decimal
from collections import Counter, defaultdict
import argparse, csv, hashlib, html, json, re, shutil, sys, time
import pyarrow as pa
import pyarrow.csv as pacsv
import pyarrow.parquet as pq
import pyarrow.compute as pc

sys.stdout.reconfigure(encoding='utf-8')

def read_csv(path):
    with Path(path).open(encoding='utf-8-sig', newline='') as f:
        return list(csv.DictReader(f))

def digest(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for b in iter(lambda: f.read(8*1024*1024), b''): h.update(b)
    return h.hexdigest()

def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')

def write_csv(path, rows):
    with path.open('w', encoding='utf-8-sig', newline='') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)

def number_array(values, factor=1):
    nums = [None if v is None or str(v) == '' else Decimal(str(v))*factor for v in values]
    assert all(v is None or v.is_finite() for v in nums)
    if all(v is None or v == v.to_integral_value() for v in nums):
        return pa.array([None if v is None else int(v) for v in nums], type=pa.int64())
    return pa.array(nums)

def same(a, b):
    if a.type == b.type: return a.equals(b)
    return a.to_pylist() == b.to_pylist()

def load_wide(path, keys):
    with path.open(encoding='utf-8-sig') as f: names = next(csv.reader(f))
    table = pacsv.read_csv(path, convert_options=pacsv.ConvertOptions(
        column_types={n: pa.string() for n in names}, strings_can_be_null=True, null_values=['']))
    key = next(x for x in ['municipio_id', 'codmun', 'reference_code'] if x in names)
    found = table[key].to_pylist()
    assert len(found) == len(set(found)) == 339, path
    assert set(found) == set(keys), path
    order = pa.array([found.index(k) for k in keys])
    return table.take(order)

CAMPAIGN = {'invierno2012': ('invierno 2012', 'winter 2012'),
 'verano2012_2013': ('verano 2012–2013', 'summer 2012–2013'),
 'semillas': ('producción de semillas', 'seed production'), 'forestal': ('forestales', 'forestry'),
 'pastos': ('pastos', 'pasture'), 'otros_usos': ('otros usos', 'other land uses')}
WATER = {'todos': ('todos los sistemas', 'all systems'), 'con_riego': ('con riego', 'irrigated'),
 'sin_riego': ('sin riego', 'rainfed'), 'otro_especial': ('otra respuesta especial', 'other special response'),
 'sin_dato': ('sin dato de riego', 'irrigation information missing')}
MEANING = {'registro': ('registro', 'record'), 'registro_cultivo': ('registro de cultivo', 'crop record'),
 'sembrada': ('superficie sembrada', 'sown area'), 'riego_produccion': ('superficie en producción según riego', 'producing area by irrigation'),
 'uso_suelo': ('superficie según uso del suelo', 'area by land use'), 'semillas': ('superficie de semillas', 'seed-production area'),
 'forestal': ('superficie forestal', 'forestry area'), 'pastos': ('superficie de pastos', 'pasture area'),
 'otros_usos': ('superficie de otros usos', 'other land-use area')}
OPS = {'registros': ('Número de registros', 'Number of records'),
 'upa_con_registros': ('UPA únicas con registros', 'Unique holdings with records'),
 'suma_ha': ('Suma de superficie válida', 'Sum of valid area'),
 'upa_area_positiva': ('UPA únicas con superficie positiva', 'Unique holdings with positive area'),
 'validos': ('Registros con superficie válida', 'Records with valid area'),
 'missing': ('Registros con superficie faltante', 'Records with missing area'),
 'no_aplica': ('Registros con superficie no aplicable', 'Records with non-applicable area'),
 'ceros': ('Registros con superficie cero', 'Records with zero area')}

def build(sources, output, policy_path):
    started = time.time()
    output.mkdir(parents=True, exist_ok=True)
    data = output/'data'; data.mkdir(exist_ok=True)
    full = sources/'FullExpansion'; cat = sources/'CategoryExpansion'; ui = sources/'Agro2013'
    page = (ui/'index.html').read_text(encoding='utf-8')
    payload = json.loads(re.search(r'<script id="payload" type="application/json">(.*?)</script>', page, re.S)[1])
    variables = {v['variable']: v for v in payload['variables']}
    keys = sorted(r['reference_code'] for r in payload['rows'])
    rows = {r['reference_code']: r for r in payload['rows']}
    consumed = {}
    def source(path):
        consumed[str(path.relative_to(sources))] = digest(path)
        return path
    consumed['Agro2013/index.html#payload'] = hashlib.sha256(json.dumps(payload,ensure_ascii=False,sort_keys=True).encode('utf-8')).hexdigest()
    native = read_csv(source(full/'variable_dictionary.csv'))
    categories = read_csv(source(cat/'canonical_variable_dictionary.csv'))
    english = {r['indicator_id']: r for r in read_csv(source(full/'english_indicator_labels.csv'))}
    policy = json.loads(policy_path.read_text(encoding='utf-8'))
    columns, statuses, definitions = {}, {}, {}
    aliases = {}; rejected = []; quarantine = []
    def add(code, values, meta, state=None):
        assert code not in columns and len(values) == 339, code
        columns[code] = values
        statuses[code] = pa.array(state if state is not None else
            ['VALUE_PRESENT' if v is not None else 'MISSING' for v in values.to_pylist()], type=pa.string())
        meta = dict(code=code, **meta)
        for name in ['label_es','label_en','definition_es','definition_en']:
            assert meta.get(name), (code, name)
            assert '\ufffd' not in meta[name], (code, name, 'replacement character')
        definitions[code] = meta
    def alias(a, b, reason, check_status=True):
        if a == b or a in aliases: return False
        assert a in columns and b in columns, (a,b)
        if not same(columns[a], columns[b]) or (check_status and not statuses[a].equals(statuses[b])):
            rejected.append(dict(source_code=a, candidate=b, reason=reason, result='DIFFERENT_VALUES_OR_STATUS'))
            return False
        aliases[a] = dict(target=b, reason=reason)
        return True
    # Read the native matrices without floating point conversion.
    bygroup = defaultdict(list)
    for r in native: bygroup[r['group']].append(r)
    for group, group_rows in bygroup.items():
        table = load_wide(source(full/'Modules'/f'{group}.csv'), keys)
        blob = json.loads(source(full/'Modules'/f'{group}.json').read_text(encoding='utf-8'))
        order = [blob['keys'].index(k) for k in keys]
        for r in group_rows:
            original = r['indicator_id']; v = variables[original]; factor = 46 if r['unit']=='qq' else 1
            code = original+'_kg' if factor == 46 else original
            value = number_array(table[original].to_pylist(), factor)
            state = [blob['status'][original][i] for i in order] if original in blob['status'] else ['OBSERVED_COUNT']*339
            if v.get('full_quality_blocked'):
                quarantine.append(dict(code=code, source_code=original, source_file=f'FullExpansion/Modules/{group}.csv', reason='UNVALIDATED_SOURCE_SCALE'))
                value = pa.nulls(339, type=value.type); state = ['UNVALIDATED_SOURCE_SCALE']*339
            en = english[original]
            note_es = v.get('note_es',''); note_en = v.get('note_en','')
            add(code, value, dict(label_es=v['es'], label_en=v['en'],
                definition_es=v['es']+'. '+note_es, definition_en=v['en']+'. '+note_en,
                unit='kg' if factor==46 else r['unit'], unit_en=v['unit_en'],
                module=group, source_field=r['source_variable'], entity=r['entity'],
                operation=r['operation'], filter=r['effective_filter'] or r['filter'],
                period_es=r['reference_period'], period_en=en['period_en'],
                denominator='NOT_APPLICABLE_RAW_COUNT_OR_SUM', statistical_role=r['statistical_role'],
                preferred=str(v.get('full_primary',False)).lower(),
                source_code=original, source_file=f'FullExpansion/Modules/{group}.csv',
                recipe=f'FullExpansion/Recipes/{r["reproduction_program"]}',
                formula=(f'{original} * 46' if factor==46 else r['redatam_code']),
                quality='UNVALIDATED_SOURCE_SCALE' if v.get('full_quality_blocked') else r['status'],
                validation_failures=r.get('validation_failures','0'),
                component_discrepancies=r.get('component_discrepancies','0'),
                source_unit=r['unit'], factor=str(factor)), state)
        print('Native module', group, len(group_rows), flush=True)
    # A crop is a product, not one variable: preserve all area/count/irrigation contexts.
    crop_labels = {v['crop_code']:v for v in variables.values() if v['group']=='crops'}
    table = load_wide(source(cat/'municipal_products_wide.csv'), keys)
    sum_status = {}
    context_to_id = {(r['crop_code'],r['campaign'],r['irrigation'],r['area_definition']):r['indicator_id']
                     for r in categories if r['operation']=='suma_ha'}
    status_columns = ['cultivo_codigo','campana','riego','definicion_superficie','municipio_id','estado']
    keypos = {k:i for i,k in enumerate(keys)}
    for status_path in [cat/'municipal_products_long.csv', sources/'RedatamExploration/crop_all_long.csv']:
        status_table = pacsv.read_csv(source(status_path),
            convert_options=pacsv.ConvertOptions(include_columns=status_columns, column_types={k:pa.string() for k in status_columns}))
        for code,campaign,water,meaning,municipality,state in zip(*(status_table[k].to_pylist() for k in status_columns)):
            iid = context_to_id.get((code,campaign,water,meaning))
            if iid:
                if iid not in sum_status: sum_status[iid] = [None]*339
                before=sum_status[iid][keypos[municipality]]
                assert before is None or before==state,(iid,municipality,before,state)
                sum_status[iid][keypos[municipality]] = state
    for r in categories:
        code = r['indicator_id']; product_en = crop_labels[r['crop_code']]['en'].rsplit(' · ',1)[0]
        a,b = OPS[r['operation']]; c,d = CAMPAIGN[r['campaign']]; e,f = WATER[r['irrigation']]; j,k = MEANING[r['area_definition']]
        es = f'{r["crop_name"]} · {a} · {c} · {e} · {j}'
        en = f'{product_en} · {b} · {d} · {f} · {k}'
        state = sum_status.get(code) if r['operation']=='suma_ha' else ['OBSERVED_COUNT']*339
        assert state is not None and all(s is not None for s in state), code
        add(code, number_array(table[code].to_pylist()), dict(label_es=es,label_en=en,
            definition_es=es+'. Conteo o suma municipal de registros válidos según el filtro; UPA se cuentan una vez por condición. Las campañas y definiciones de superficie no son aditivas.',
            definition_en=en+'. Municipal count or sum under the specified filter; holdings are counted once per condition. Seasons and area definitions are not additive.',
            unit=r['unit'],unit_en={'registros':'records','UPA':'holdings','ha':'ha'}[r['unit']],
            module='crop_areas',source_field=r['source_variable'],entity=r['entity'],operation=r['operation'],filter=r['filter'],
            period_es=c,period_en=d,denominator='NOT_APPLICABLE_RAW_COUNT_OR_SUM',statistical_role=r.get('statistical_role','analytical'),
            preferred='true' if r['operation'] in ['suma_ha','upa_con_registros','upa_area_positiva'] else 'false',
            source_code=code,source_file='CategoryExpansion/municipal_products_wide.csv',
            recipe='CategoryExpansion/Recipes/'+r['reproduction_program'], formula=r['redatam_code'],quality=r['status'],
            validation_failures='',component_discrepancies='',source_unit=r['unit'],factor='1'),state)
    print('Crop area definitions',len(categories),flush=True)
    # Published aggregates are retained separately where native counts/nulls differ.
    olddict = {r['variable']:r for r in read_csv(source(ui/'variable_dictionary.csv'))}
    for v in variables.values():
        if v['group'].startswith('full_') or v['group']=='crops': continue
        name=v['variable']; code='cna13_published_'+name; old=olddict.get(name,{})
        note_es=v.get('note_es','Agregado municipal publicado. No sumar totales y componentes.')
        note_en=v.get('note_en','Published municipal aggregate. Do not add totals and their components.')
        add(code,number_array([rows[k].get(name) for k in keys]),dict(label_es=v['es'],label_en=v['en'],
            definition_es=v['es']+'. '+note_es,definition_en=v['en']+'. '+note_en,
            unit=v['unit_es'],unit_en=v['unit_en'],module='published_'+v['group'],
            source_field=old.get('question_evidence',name),entity='PUBLISHED_MUNICIPAL',operation='published_aggregate',filter='',
            period_es='CNA2013; periodo específico de la pregunta',period_en='CNA2013; question-specific reference period',
            denominator='NOT_APPLICABLE_RAW_COUNT_OR_SUM',statistical_role='analytical',preferred='true',source_code=name,
            source_file='Agro2013/index.html#payload',recipe='Code/build_portable_dataset.py',formula='payload.rows[reference_code]['+name+']',
            quality='PUBLISHED_AGGREGATE_NATIVE_DIFFERENCES_RETAINED',validation_failures='',component_discrepancies='',
            source_unit=v['unit_es'],factor='1'), ['PUBLISHED_AGGREGATE']*339)
    # Annual quantities remain alongside seasons because the temporal definitions differ.
    annual=read_csv(source(full/'AnnualProduction/dictionary.csv'))
    table=load_wide(source(full/'AnnualProduction/production_annual_kg.csv'),keys)
    state=load_wide(source(full/'AnnualProduction/production_annual_status.csv'),keys)
    for r in annual:
        code=r['indicator_id']; v=variables[code]
        add(code,number_array(table[code].to_pylist()),dict(label_es=v['es'],label_en=v['en'],
            definition_es=v['es']+'. '+v['note_es'],definition_en=v['en']+'. '+v['note_en'],unit='kg',unit_en='kilograms',
            module='annual_production',source_field='CULTINV.S4_P23_6;CULTVER.S4_P24_8',entity='CULTINV;CULTVER',operation='annual_sum',
            filter='crop_code='+r['crop_code'],period_es=r['reference_period'],period_en=v['full_period_en'],
            denominator='NOT_APPLICABLE_RAW_COUNT_OR_SUM',statistical_role='analytical',preferred='true',source_code=code,
            source_file='FullExpansion/AnnualProduction/production_annual_kg.csv',recipe='FullExpansion/AnnualProduction/'+r['recipe'],
            formula=r['formula'],quality='DERIVED_WITH_DOCUMENTED_CONVERSION',validation_failures=r['source_reconciliation_discrepancies'],
            component_discrepancies='',source_unit='qq',factor='46'),state[code].to_pylist())
    groups=json.loads(source(full/'TopProducts/LivestockGroups/groups.json').read_text(encoding='utf-8'))
    table=load_wide(source(full/'TopProducts/LivestockGroups/municipal_heads.csv'),keys)
    state=load_wide(source(full/'TopProducts/LivestockGroups/municipal_status.csv'),keys)
    for r in groups:
        code=r['indicator']; parts=['cna13_published_'+c for c in r['components']]
        add(code,number_array(table[code].to_pylist()),dict(label_es=r['label'],label_en=r['en'],
            definition_es=r['definition']+'. Suma de componentes publicados; no sumar de nuevo con sus componentes.',
            definition_en=' + '.join(definitions[c]['label_en'] for c in parts)+'. Sum of published components; do not add the total to its components.',
            unit='cabezas',unit_en='heads',module='livestock_groups',source_field=';'.join(parts),entity='PUBLISHED_MUNICIPAL',operation='component_sum',
            filter='',period_es='CNA2013; existencias declaradas',period_en='CNA2013; reported stocks',denominator='NOT_APPLICABLE_RAW_COUNT_OR_SUM',
            statistical_role='analytical',preferred='true',source_code=code,source_file='FullExpansion/TopProducts/LivestockGroups/municipal_heads.csv',
            recipe='FullExpansion/TopProducts/LivestockGroups/Recipes/'+code+'.py',formula='SUM('+','.join(parts)+')',
            quality='DERIVED_FROM_PUBLISHED_AGGREGATES',validation_failures='',component_discrepancies='',source_unit='cabezas',factor='1'),state[code].to_pylist())
        if len(parts)==1: alias(code,parts[0],'single_component_group',check_status=False)
    # Explicitly established aliases; never use equality alone to infer semantic identity.
    for code, p in policy['indicators'].items():
        if p.get('alternative') and code in columns and p['alternative'] in columns:
            alias(code,p['alternative'],'same_filter_records_holdings_equal_in_all_339')
    for r in native:
        previous=r.get('equivalent_previous_indicator')
        if previous: alias(previous,r['indicator_id'],'same_source_crop_filter_operation_verified')
    # Exact duplicate operations on the same source field/filter/period.
    signatures={}
    for code,m in definitions.items():
        if m['module'].startswith('published_') or m['module'] in ['annual_production','livestock_groups','crop_areas']: continue
        signature=(m['entity'],m['operation'],m['filter'],m['unit'],m['period_es'],m['quality'],
                   m['source_field'] if m['operation'] not in ['records','holdings','entity_records'] else '')
        if signature in signatures: alias(code,signatures[signature],'identical_source_operation_filter_period')
        else: signatures[signature]=code
    # Repeated crop-area record/holding counts have the same category and irrigation filter.
    crop_pairs={}
    for r in categories:
        key=(r['entity'],r['crop_code'],r['campaign'],r['irrigation'],r['filter'])
        if r['operation']=='upa_con_registros':crop_pairs[key]=r['indicator_id']
    for r in categories:
        key=(r['entity'],r['crop_code'],r['campaign'],r['irrigation'],r['filter'])
        if r['operation']=='registros' and key in crop_pairs:
            alias(r['indicator_id'],crop_pairs[key],'same_crop_filter_records_holdings_equal_in_all_339')
    def resolve(code):
        seen=set()
        while code in aliases:
            assert code not in seen,code
            seen.add(code);code=aliases[code]['target']
        return code
    for code,a in aliases.items():
        a['target']=resolve(a['target']);assert same(columns[code],columns[a['target']]),code
    kept=[c for c in columns if c not in aliases]
    alias_rows=[]
    for code,a in aliases.items():
        m=definitions[code]
        alias_rows.append(dict(source_code=code,canonical_code=a['target'],numerator=1,denominator=1,
            reason=a['reason'],definition_es=m['definition_es'],definition_en=m['definition_en'],
            original_unit=m['unit'],original_operation=m['operation'],original_recipe=m['recipe'],
            scope='CNA2013; verified in these 339 municipalities only; original analysis units remain distinct'))
    for code,m in definitions.items():
        if m['factor']=='46' and m['operation']=='sum':
            alias_rows.append(dict(source_code=m['source_code'],canonical_code=resolve(code),numerator=1,denominator=46,
                reason='original_qq_equals_canonical_kg_divided_by_46',definition_es=m['definition_es'],definition_en=m['definition_en'],
                original_unit='qq',original_operation=m['operation'],original_recipe=m['recipe'],scope='Original unit conversion; no additional measurement'))
    # IDs and geography occur once, rather than once per source module.
    id_values={'mun_code':pa.array(keys), 'cna_code':pa.array([rows[k]['source_code'] for k in keys]),
        'municipality':pa.array([rows[k]['source_municipality'] for k in keys]),
        'department':pa.array([rows[k]['source_department'] for k in keys]),
        'province':pa.array([rows[k]['source_province'] for k in keys]),
        'year':pa.array([2013]*339,type=pa.int16()),'map_year':pa.array([2015]*339,type=pa.int16()),
        'asdf_id':pa.array([int(rows[k]['asdf_id']) for k in keys],type=pa.int16())}
    ids=[('mun_code','Código municipal de referencia','Reference municipality code'),
         ('cna_code','Código municipal CNA2013','CNA2013 municipality code'),
         ('municipality','Nombre del municipio','Municipality name'),('department','Departamento','Department'),
         ('province','Provincia','Province'),('year','Año censal','Census year'),('map_year','Año de referencia cartográfica','Map reference year'),
         ('asdf_id','Identificador de la geometría Geo4Bolivia','Geo4Bolivia geometry identifier')]
    id_def=[]
    template=next(iter(definitions.values()))
    for code,es,en in ids:
        m={k:'' for k in template};m.update(code=code,label_es=es,label_en=en,definition_es=es,definition_en=en,
            module='identification',statistical_role='identifier',source_file='Agro2013/crosswalk_cna2013_geo4bolivia339.csv',
            recipe='Code/build_portable_dataset.py',quality='INTERNAL_CROSSWALK_VERIFIED',preferred='true')
        id_def.append(m)
    dictionary=id_def+[definitions[c] for c in kept]
    table=pa.table({**id_values,**{c:columns[c] for c in kept}})
    table=table.replace_schema_metadata({b'title':b'Bolivia Agricultural Census 2013 municipal aggregates',
        b'geography':b'339 census municipalities, operational link to 2015 map; exact boundary equivalence unverified',
        b'dictionary':b'dictionary_bilingual.parquet',b'aliases':b'variable_aliases.parquet',
        b'quality':b'cell_status.parquet; honey quantities withheld; source discrepancies retained'})
    pq.write_table(table,data/'municipal_data.parquet',compression='zstd')
    # Null absence is preserved; statuses are normalized separately from quantities.
    state_table=pa.table({'mun_code':id_values['mun_code'],**{c:statuses[c] for c in kept}})
    pq.write_table(state_table,data/'cell_status.parquet',compression='zstd')
    pq.write_table(pa.Table.from_pylist(dictionary),data/'dictionary_bilingual.parquet',compression='zstd')
    write_csv(data/'dictionary_bilingual.csv',dictionary)
    pq.write_table(pa.Table.from_pylist(alias_rows),data/'variable_aliases.parquet',compression='zstd')
    write_csv(data/'variable_aliases.csv',alias_rows)
    # Preserve each removed definition and original status, without repeating its values.
    alias_states=pa.table({'mun_code':id_values['mun_code'],**{c:statuses[c] for c in aliases
        if not statuses[c].equals(statuses[resolve(c)])}})
    pq.write_table(alias_states,data/'alias_status_overrides.parquet',compression='zstd')
    all_metadata=[dict(**m,canonical_code=resolve(c),stored=c not in aliases) for c,m in definitions.items()]
    pq.write_table(pa.Table.from_pylist(all_metadata),data/'source_definitions.parquet',compression='zstd')
    # Keep the viewer's estimated population denominator explicitly separate from census observations.
    context_rows=read_csv(source(ui/'denominators_estimated_2013.csv'))
    context_by_key={r['reference_code']:r for r in context_rows}
    context_table=pa.table({'mun_code':pa.array(keys),
        **{c:number_array([context_by_key[k][c] for k in keys]) for c in
           ['population_2012','population_2024','population_estimated_2013']},
        **{c:pa.array([context_by_key[k][c] for k in keys]) for c in ['formula','estimate_status','geography_status']}})
    pq.write_table(context_table,data/'municipal_context.parquet',compression='zstd')
    context_labels=[('mun_code','Código municipal de referencia','Reference municipality code'),
        ('population_2012','Población 2012 enlazada a la geografía operativa','2012 population linked to the operational geography'),
        ('population_2024','Población 2024 enlazada; hereda supuestos de asignación C01','2024 linked population; inherits C01 allocation assumptions'),
        ('population_estimated_2013','Población estimada: P2012 + (P2024-P2012)/12. No es conteo censal 2013 ni proyección oficial.','Estimated population: P2012 + (P2024-P2012)/12. Not a 2013 census count or official projection.'),
        ('formula','Fórmula de estimación del denominador poblacional','Population-denominator estimation formula'),
        ('estimate_status','Estado de estimación; separado de los datos agropecuarios observados','Estimation status; separate from observed agricultural data'),
        ('geography_status','Limitaciones heredadas de la correspondencia territorial','Inherited geographic-link limitations')]
    write_csv(data/'context_dictionary.csv',[dict(code=c,definition_es=es,definition_en=en) for c,es,en in context_labels])
    source(pre := ui/'crosswalk_cna2013_geo4bolivia339.csv')
    # Exhaustive round-trip comparisons, not sampled checks.
    check=pq.read_table(data/'municipal_data.parquet')
    assert check.num_rows==339 and check.column_names==table.column_names
    assert all(check[c].combine_chunks().equals(table[c].combine_chunks()) for c in table.column_names)
    state_check=pq.read_table(data/'cell_status.parquet')
    assert state_check.equals(state_table)
    assert len(dictionary)==len(check.column_names) and len({x['code'] for x in dictionary})==len(dictionary)
    assert all(re.fullmatch(r'\d{6}',k) for k in keys)
    # Repeated vectors are diagnosed but not collapsed without an explicit equivalence.
    vector_groups=defaultdict(list)
    for c in kept:
        vals=columns[c].to_pylist()
        token=json.dumps([str(v.normalize()) if isinstance(v,Decimal) else str(v) if v is not None else None for v in vals])
        vector_groups[hashlib.sha256(token.encode()).hexdigest()].append(c)
    duplicate_groups=[v for v in vector_groups.values() if len(v)>1]
    summary=dict(status='PASS',municipalities=339,source_definitions=len(definitions),
        stored_statistical_columns=len(kept),identification_columns=len(id_values),
        consolidated_duplicate_columns=len(aliases),unit_conversion_aliases=sum(x['denominator']==46 for x in alias_rows),
        alias_reasons=dict(Counter(a['reason'] for a in aliases.values())),
        rejected_candidate_pairs=len(rejected),identical_value_groups_retained_without_semantic_equivalence=len(duplicate_groups),
        analytical_columns=sum(definitions[c]['statistical_role']=='analytical' for c in kept),
        diagnostic_columns=sum(definitions[c]['statistical_role']=='diagnostic' for c in kept),
        quarantined=quarantine,verified_numeric_cells=339*len(kept),verified_alias_cells=339*len(aliases),
        exact_decimal_roundtrip=True,nulls_preserved=True,source_files=consumed,
        pyarrow_version=pa.__version__,elapsed_seconds=round(time.time()-started,2))
    write_json(data/'redundancy_audit.json',summary)
    write_json(data/'rejected_equivalences.json',rejected)
    write_json(data/'equal_vectors_retained.json',duplicate_groups)
    print(json.dumps({k:v for k,v in summary.items() if k not in ['source_files','quarantined']},ensure_ascii=False),flush=True)
    return summary

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--sources',type=Path,required=True);parser.add_argument('--output',type=Path,required=True);parser.add_argument('--policy',type=Path,required=True)
    a=parser.parse_args();build(a.sources.resolve(),a.output.resolve(),a.policy.resolve())
