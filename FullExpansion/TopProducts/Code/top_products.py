"""National product rankings from existing aggregates, without new extraction."""
from common import *
from decimal import Decimal
from collections import defaultdict,Counter
import re,shutil
import livestock_groups

T=D/'TopProducts';UI=O/'Deliverables/Agro2013';C=O/'Deliverables/CategoryExpansion'
CONTEXTS={'verano2012_2013':'riego_produccion','invierno2012':'sembrada','semillas':'semillas','pastos':'pastos','forestal':'forestal'}
def payload():return json.loads(re.search(r'<script id="payload" type="application/json">(.*?)</script>',(UI/'index.html').read_text(encoding='utf-8'),re.S)[1])
def generic(label):return bool(re.search(r'(^TCV\b|descripciones? genéricas?|sin especificar|no especificad)',label,re.I))
def prepare():
 h=E/'History/top_products_revision';assert not h.exists()
 files=[R/'Contracts/Contract_04.txt',R/'Contracts/CONTRACT_REGISTER.md',D/'codigos_y_diccionario.zip',E/'Code/build_dashboard.py',*[UI/n for n in ['index.html','assets/app.js','assets/style.css']],*[O/n for n in ['90_EXECUTION_REPORT.md','91_VALIDATION_REPORT.md','99_CLOSURE_REPORT.md']]]
 for p in files:
  dest=h/p.relative_to(R);dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,dest)
 p=R/'Contracts/Contract_04.txt';s=re.sub(r'^Estado:.*$','Estado: EXECUTING — TOP PRODUCTOS',p.read_text(encoding='utf-8'),count=1,flags=re.M)
 write(p,s+'\n\nADENDA — RANKINGS NACIONALES DE PRODUCTOS, '+now()+'\nAutorización explícita: pestaña con top 10 en kilogramos, cabezas y hectáreas por categoría, y reflexión sobre diversidad geográfica y ventajas productivas. Usar agregados existentes, sin extracción. Kg: producción anual por código de cultivo; cabezas: 28 categorías ganaderas publicadas del visor, sin añadir totales superpuestos; ha: cada campaña/módulo por separado, riego todos, una definición por selección (verano riego/producción; invierno sembrada; semillas, pastos y forestales propios). No sumar ambos campos estivales ni campañas, no incluir otros usos de tierra como productos. Excluir TCV y descripciones genéricas del ranking de productos identificados; conservar exclusiones documentadas. Orden descendente de sumas válidas, empate por código; mostrar hasta 10 positivos disponibles, sin rellenar. Faltantes/ceros y discrepancias preservados. Filtros por categoría, navegación al mapa, CSV y trazabilidad. Reflexión explicativa con fuentes primarias, separando hipótesis agroecológica de ventaja económica demostrada. Cambios permitidos: Code/top_products*, generador del visor, assets y HTML C04, Deliverables/FullExpansion/TopProducts, evidencia, informes, paquete y manifiestos. Validar sumas/orden/filtros/cobertura/enlaces/navegación/ES-EN/móvil. Sin publicación ni aceptación automática.\n')

def run():
 data=payload();catalog={r['code']:r for r in data['cropCatalog']};rows=[];excluded=[];sources={};geo={r['source_code']:r['nombredepartamento'] for r in data['rows']}
 def record(metric,context,code,label,category,values,states,source,indicator,definition,failures=0,recipe=''):
  if generic(label):excluded.append(dict(metric=metric,context=context,code=code,label=label,reason='Categoría genérica o cultivos variados; no producto identificado'));return
  assert len(values)==339 and len(states)==339
  valid=[Decimal(str(v)) for v in values if v not in (None,'')];total=sum(valid,Decimal(0)) if valid else None
  dep=defaultdict(Decimal)
  for key,v in zip(geo,values):
   if v not in (None,''):dep[geo[key]]+=Decimal(str(v))
  leaders=sorted(dep,key=lambda k:(-dep[k],k));partial=sum(s in ['SUMA_PARCIAL','SIN_VALORES_VALIDOS'] for s in states)
  rows.append(dict(metric=metric,context=context,code=code,label=label,category=category,total=None if total is None else float(total),total_exact='' if total is None else format(total,'f'),valid_municipalities=len(valid),no_value_municipalities=339-len(valid),partial_municipalities=partial,leader_department=leaders[0] if leaders and total and total>0 else '',source=source,indicator=indicator,definition=definition,source_discrepancies=failures,recipe=recipe))
 # Align every vector to the same municipal ordering before national/department sums.
 keys=list(geo)
 ar={r['municipio_id']:r for r in read(D/'AnnualProduction/production_annual_kg.csv')};st={r['municipio_id']:r for r in read(D/'AnnualProduction/production_annual_status.csv')}
 for d in read(D/'AnnualProduction/dictionary.csv'):
  iid=d['indicator_id'];code=d['crop_code']
  record('kg','annual',code,d['crop_name'],catalog[code]['category'],[ar[k][iid] for k in keys],[st[k][iid] for k in keys],'../AnnualProduction/production_annual_kg.csv',iid,'Invierno 2012 + verano 2012–2013; cantidades válidas; 46 kg/qq',int(d['source_reconciliation_discrepancies']),'../AnnualProduction/'+d['recipe'])
 for g in livestock_groups.generate(data):
  record('heads','census',g['code'],g['label'],g['category'],g['values'],g['states'],'LivestockGroups/municipal_heads.csv',g['indicator'],g['definition'],recipe='LivestockGroups/'+g['recipe'])
  rows[-1].update(components=g['components'],en=g['en'],municipal_values=g['values'],municipal_states=g['states'],municipal_keys=keys)
 metadata=read(C/'canonical_variable_dictionary.csv');cache={}
 for d in metadata:
  if d['operation']!='suma_ha' or d['irrigation']!='todos' or d['campaign'] not in CONTEXTS or d['area_definition']!=CONTEXTS[d['campaign']]:continue
  code=d['crop_code'];context=d['campaign'];file=C/'Products'/(code+'.csv')
  if code not in cache:cache[code]=read(file);sources[str(file.relative_to(R))]=sha(file)
  subset={r['municipio_id']:r for r in cache[code] if r['campana']==context and r['riego']=='todos' and r['definicion_superficie']==CONTEXTS[context]}
  assert len(subset)==339,(code,context,len(subset))
  record('ha',context,code,d['crop_name'],d['category'],[subset[k]['superficie_ha'] for k in keys],[subset[k]['estado'] for k in keys],'../../CategoryExpansion/Products/'+code+'.csv',d['indicator_id'],d['source_variable']+'; '+CONTEXTS[context]+'; riego todos',catalog[code]['area_failures'],'../../CategoryExpansion/Recipes/'+d['reproduction_program'])
 assert len({(r['metric'],r['context'],r['code']) for r in rows})==len(rows)
 rows.sort(key=lambda r:(r['metric'],r['context'],r['code']))
 save(T/'rankings.json',rows);outcsv(T/'national_product_totals.csv',[{k:v for k,v in r.items() if k not in ['total','components','en','municipal_values','municipal_states','municipal_keys']} for r in rows]);outcsv(T/'excluded_generic_categories.csv',excluded)
 save(T/'sources.json',dict(created=now(),source_files=sources,annual_csv_sha256=sha(D/'AnnualProduction/production_annual_kg.csv'),annual_status_sha256=sha(D/'AnnualProduction/production_annual_status.csv'),animal_payload_sha256=hashlib.sha256(json.dumps([{k:r[k] for k in ['source_code','nombredepartamento']+[v['variable'] for v in data['variables'] if v['group']=='animals']} for r in data['rows']],sort_keys=True).encode()).hexdigest(),geography_sources=['https://www.fao.org/4/ah867s/ah867s00.htm','https://knowledge-for-policy.ec.europa.eu/publication/perfil-de-sistemas-alimentarios-estado-plurinacional-de-bolivia_en']))
 write(UI/'assets/top-products-data.js','window.TOP_PRODUCTS='+json.dumps(rows,ensure_ascii=False,separators=(',',':'),allow_nan=False)+';')
 for name in ['top_products.js','top_products.css']:shutil.copy2(E/'Code'/name,UI/'assets'/name.replace('_','-'))
 write(T/'README.html','<!doctype html><html lang="es"><meta charset="utf-8"><title>Rankings: método</title><style>body{max-width:900px;margin:auto;padding:30px;font:17px/1.7 system-ui}a{color:#067c70}</style><h1>Top productos: reglas de comparación</h1><p><a href="../../Agro2013/index.html#top-products">Abrir rankings</a> · <a href="national_product_totals.csv">Todos los totales nacionales</a> · <a href="rankings.json">Definiciones y trazabilidad</a> · <a href="excluded_generic_categories.csv">Exclusiones</a></p><p>Orden descendente de cantidades positivas registradas; empate por código ascendente. Top 10 dentro de la unidad, campaña/módulo y categoría seleccionados. Menos de diez positivos: se muestran únicamente los disponibles. La columna de departamento principal es la mayor suma de la misma variable entre municipios de ese departamento.</p><p>Kg: sumas municipales de la producción anual registrada 2012–2013, con la conversión explícita 46 kg/qq y sus limitaciones. Cabezas: categorías ganaderas publicadas, sin añadir totales de especie superpuestos a sus componentes; bovinos excluyen bueyes; aves y porcinos conservan categorías de granja/corral. Son existencias, no producción de carne ni biomasa. Los ceros publicados permanecen tal como están.</p><p>Hectáreas: se comparan productos dentro de una campaña o módulo. En verano se utiliza exclusivamente CULTVER.S4_P24_4, definición para riego y producción; invierno usa CULTINV.S4_P23_3. No se suma el otro campo estival, ni campañas, ni riego todos con sus componentes. Semillas, pastos y forestales tienen rankings separados. Las superficies por cultivo no son una partición de tierra física: cultivos asociados pueden compartir superficie. Se excluyen otros usos del suelo y categorías genéricas/TCV del ranking de productos identificados.</p><p>Nulos no se convierten en ceros. Cada total registra municipios con valor, sin valor y con cantidades inválidas/parciales. Sin valores: no participa. Las discrepancias heredadas no se corrigen; en hectáreas el aviso es el del producto completo y puede pertenecer a otra definición/campaña. Los rankings describen la base censal y no son cifras oficiales nuevas reconciliadas.</p><p>Kg, cabezas y ha no son comparables entre sí. Masa no mide valor económico, contenido nutricional ni rentabilidad. Un top 10 tampoco mide por sí mismo diversidad total, aporte al PIB o ventaja comparativa. La hipótesis geográfica se propone para contraste posterior con altitud, clima, suelos, agua, acceso a mercados, costos y productividad.</p><p>Código de generación: <a href="Code/top_products.py">top_products.py</a>. Los campos source, indicator y recipe enlazan cada total a sus datos y definiciones previas.</p></html>')
 method=(T/'README.html').read_text(encoding='utf-8')
 method=re.sub(r'Cabezas:.*? Son existencias','Cabezas: 17 grupos que reúnen las 28 categorías publicadas. Pollos y gallinas incluyen gallos y pollitos; bovinos incluyen bueyes; porcinos, patos, pavos y codornices combinan granja y corral. Cada componente se suma una sola vez. Búfalos, llamas, alpacas y otras especies conservan grupos separados. <a href="LivestockGroups/dictionary.csv">Correspondencia y recetas</a> · <a href="LivestockGroups/municipal_heads.csv">Matriz municipal agrupada</a>. Son existencias',method)
 write(T/'README.html',method)
 (T/'Code').mkdir(exist_ok=True);shutil.copy2(E/'Code/top_products.py',T/'Code/top_products.py')
 save(E/'top_products_generation.json',dict(created=now(),rows=len(rows),counts=dict(Counter(r['metric']+':'+r['context'] for r in rows)),excluded=len(excluded),no_new_extraction=True))
 print('National rankings generated:',len(rows),'series;',len(excluded),'generic entries excluded')

def apply(page):
 block=(E/'Code/top_products.html').read_text(encoding='utf-8')
 assert page.count('<section id="explore">')==1
 page=page.replace('<section id="explore">',block+'<section id="explore">',1)
 page=page.replace('</head>','<link rel="stylesheet" href="assets/top-products.css"></head>',1)
 page=page.replace('</body>','<script src="assets/top-products-data.js"></script><script src="assets/top-products.js"></script></body>',1)
 page=page.replace('<a class="button secondary" href="?topic=crops#explore"','<a class="button secondary" href="#top-products"',1)
 page=page.replace('data-i18n="heroPlants">Ver cultivos','data-i18n="heroPlants">Top productos',1)
 return page

if __name__=='__main__':
 import sys
 prepare() if '--prepare' in sys.argv else run()
