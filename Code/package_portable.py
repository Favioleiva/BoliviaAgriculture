"""Package the existing viewer and local downloads; never publish or extract microdata."""
from pathlib import Path
import csv, hashlib, html, json, re, shutil, sys, zipfile
from urllib.parse import urlsplit, unquote
import pyarrow.parquet as pq
from build_portable_dataset import digest, write_json, write_csv

ROOT=Path(__file__).resolve().parents[5]
OUT=ROOT/'Outputs/Contract_04'; SRC=OUT/'Deliverables'
PKG=SRC/'BoliviaAgriculturalCensus2013'; E=OUT/'Evidence/FullExpansion'

DOWNLOAD_CSS='''
#dataset{max-width:1320px;margin:2rem auto;padding:1.5rem;background:#f2f7f3;border:1px solid #c5d8ce;border-radius:16px;color:#183b32;scroll-margin-top:1rem}
#dataset h2{font-size:1.6rem;margin:0 0 .7rem}#dataset p{font-size:1rem;line-height:1.6;max-width:80ch}
#dataset .dataset-actions{display:flex;gap:.7rem;flex-wrap:wrap;margin:1rem 0}
#dataset a{overflow-wrap:anywhere}#dataset .dataset-actions a{padding:.7rem 1rem;border:1px solid #467b67;border-radius:8px;text-decoration:none;font-weight:600;color:#164e3a;background:white}
#dataset .dataset-actions a:first-child{background:#164e3a;color:white}#dataset .dataset-note{font-size:.9rem;color:#355b4d}
@media(max-width:700px){#dataset{margin:1rem;padding:1rem}#dataset .dataset-actions{display:grid}#dataset .dataset-actions a{min-height:44px}}
'''

DOWNLOAD_JS='''(()=>{
const text={es:{title:'Descarga el dataset completo',lead:'339 municipios · 22,864 variables almacenadas · códigos estables y diccionario bilingüe. Incluye 11,897 variables analíticas y 10,967 diagnósticas.',all:'Dataset completo · ZIP',parquet:'Datos municipales · Parquet',dict:'Diccionario español / inglés · CSV',dictpq:'Diccionario · Parquet',browse:'Consultar diccionario',quality:'Estados de calidad · Parquet',aliases:'Equivalencias de códigos · CSV',method:'Contenido y metodología',note:'Se consolidaron 5,670 columnas duplicadas verificadas. Las cantidades en quintales se ofrecen en kg; las equivalencias originales y los estados se conservan. La producción de miel permanece sin validar y se entrega nula, nunca como cero.',nav:'Descargar datos'},en:{title:'Download the complete dataset',lead:'339 municipalities · 22,864 stored variables · stable codes and a bilingual dictionary. Includes 11,897 analytical and 10,967 diagnostic variables.',all:'Complete dataset · ZIP',parquet:'Municipal data · Parquet',dict:'Spanish / English dictionary · CSV',dictpq:'Dictionary · Parquet',browse:'Browse the dictionary',quality:'Quality status · Parquet',aliases:'Code equivalences · CSV',method:'Contents and methodology',note:'5,670 verified duplicate columns were consolidated. Quintal quantities are provided in kg; original equivalences and status flags are retained. Honey production remains unvalidated and is delivered as null, never zero.',nav:'Download data'}};
function update(){const t=text[document.documentElement.lang==='en'?'en':'es'];document.querySelectorAll('[data-download-key]').forEach(e=>e.textContent=t[e.dataset.downloadKey]);}
new MutationObserver(update).observe(document.documentElement,{attributes:true,attributeFilter:['lang']});update();
})();'''

def panel(base):
    links=[('all','data/dataset_bundle.zip'),('parquet','data/municipal_data.parquet'),
           ('dict','data/dictionary_bilingual.csv'),('dictpq','data/dictionary_bilingual.parquet'),
           ('browse','dictionary.html'),('quality','data/cell_status.parquet'),
           ('aliases','data/variable_aliases.csv'),('method','README.html')]
    return '<section id="dataset" aria-labelledby="dataset-title"><h2 id="dataset-title" data-download-key="title">Descarga el dataset completo</h2><p data-download-key="lead"></p><div class="dataset-actions">'+''.join(
        f'<a data-download-key="{key}" href="{base}{path}"'+(' download' if key not in ['browse','method'] else '')+'></a>' for key,path in links)+'</div><p class="dataset-note" data-download-key="note"></p></section>'

def install_downloads(ui,base):
    p=ui/'index.html';s=p.read_text(encoding='utf-8')
    s=re.sub(r'<section id="dataset".*?</section>','',s,flags=re.S)
    s=re.sub(r'<a[^>]*data-download-key="nav"[^>]*>.*?</a>','',s,flags=re.S)
    s=re.sub(r'<link rel="stylesheet" href="assets/dataset-downloads.css">','',s)
    s=re.sub(r'<script src="assets/dataset-downloads.js"></script>','',s)
    s=s.replace('</head>','<link rel="stylesheet" href="assets/dataset-downloads.css"></head>',1)
    assert s.count('</main>')==1
    s=s.replace('</main>',panel(base)+'</main>',1)
    s=s.replace('</body>','<script src="assets/dataset-downloads.js"></script></body>')
    assert s.count('id="dataset"')==1
    p.write_text(s,encoding='utf-8')
    (ui/'assets/dataset-downloads.css').write_text(DOWNLOAD_CSS,encoding='utf-8')
    (ui/'assets/dataset-downloads.js').write_text(DOWNLOAD_JS,encoding='utf-8')
    from map_layout import apply_layout
    apply_layout(ui)

STYLE='''body{font:16px/1.6 system-ui,sans-serif;color:#183b32;max-width:1250px;margin:auto;padding:24px;background:#f7faf8}a{color:#135f4b}h1{font-size:2rem}h2{font-size:1.3rem}table{border-collapse:collapse;width:100%;background:white}th,td{padding:12px;border:1px solid #d6e2da;text-align:left;vertical-align:top;overflow-wrap:anywhere}th{background:#e7f0eb}code{overflow-wrap:anywhere}input{font:inherit;padding:12px;width:min(90%,700px)}.scroll{overflow:auto}small{font-size:.9rem}pre{white-space:pre-wrap;background:#e7f0eb;padding:16px}'''

def documentation():
    audit=json.loads((PKG/'data/redundancy_audit.json').read_text(encoding='utf-8'))
    statuses=[('AMBAS_CAMPANAS','Cantidad válida en ambas campañas','Valid quantity in both seasons'),
      ('OBSERVADO','Cantidad observada según los controles originales','Observed quantity under the original checks'),
      ('OBSERVED_COUNT','Conteo observado; cero conserva su significado','Observed count; zero retains its meaning'),
      ('PUBLICADO_AGRUPADO','Suma de componentes de agregados publicados','Sum of published aggregate components'),
      ('PUBLISHED_AGGREGATE','Agregado municipal publicado','Published municipal aggregate'),
      ('SIN_REGISTROS','Sin registros para esta condición; cantidad nula','No records for this condition; quantity is null'),
      ('SIN_VALORES_VALIDOS','No hay cantidades válidas para sumar','No valid quantities to sum'),
      ('SOLO_INVIERNO','Producción registrada solo en invierno','Production recorded only in winter'),
      ('SOLO_VERANO','Producción registrada solo en verano','Production recorded only in summer'),
      ('SUMA_PARCIAL','Suma de valores válidos con cantidades faltantes o inválidas','Sum of valid values with missing or invalid quantities'),
      ('UNVALIDATED_SOURCE_SCALE','Escala de origen no validada; valor retenido como nulo','Unvalidated source scale; value withheld as null')]
    write_csv(PKG/'data/status_dictionary.csv',[dict(code=c,definition_es=es,definition_en=en) for c,es,en in statuses])
    text=f'''<!doctype html><html lang="es"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Bolivia Agricultural Census 2013 — Dataset</title><style>{STYLE}</style>
<p><a href="Agro2013/index.html#dataset">Volver al visor / Back to viewer</a> · <a href="dictionary.html">Diccionario / Dictionary</a></p>
<h1>BoliviaAgriculturalCensus2013</h1><p>Dataset municipal autocontenido / Self-contained municipal dataset. Censo / Census 2013; cartografía de referencia / reference map 2015.</p>
<table><tr><th>Español</th><th>English</th></tr>
<tr><td>339 municipios; 22,864 columnas estadísticas y 8 de identificación. 11,897 analíticas y 10,967 diagnósticas. No son 22,864 mediciones independientes.</td><td>339 municipalities; 22,864 statistical and 8 identification columns. 11,897 analytical and 10,967 diagnostic columns. These are not 22,864 independent measurements.</td></tr>
<tr><td>28,534 definiciones de origen; 5,670 columnas duplicadas consolidadas mediante equivalencias explícitas y comparación de los 339 municipios. Los registros y UPA mantienen su definición original en los aliases, aunque compartan almacenamiento en esta entrega.</td><td>28,534 source definitions; 5,670 duplicate columns consolidated using explicit equivalences and comparisons across all 339 municipalities. Records and holdings retain their original definitions in the alias table even when sharing storage in this release.</td></tr>
<tr><td>No se fusionan series solo por tener valores iguales, todos cero o todos nulos. Se conservan 29 pares candidatos con diferencias. Los totales y componentes se documentan; no deben sumarse indiscriminadamente.</td><td>Series are not merged merely because their values match, are all zero or are all null. 29 candidate pairs with differences are retained. Totals and components are documented and must not be added indiscriminately.</td></tr>
<tr><td>735 sumas de masa se convierten mediante kg = qq × 46. Es la convención de la entrega, no una nueva verificación del factor interno del CNA. Las fuentes originales en qq están incluidas y el alias permite reconstruirlas.</td><td>735 mass sums use kg = qq × 46. This is the release convention, not a new verification of the internal census factor. Original qq sources are included and can be reconstructed using the alias.</td></tr>
<tr><td>Producción anual: invierno 2012 + verano 2012–2013; año agrícola julio 2012–junio 2013. No sumar nuevamente con las campañas ni interpretar como año calendario.</td><td>Annual production: winter 2012 + summer 2012–2013; agricultural year July 2012–June 2013. Do not add it to its constituent seasons or interpret it as a calendar year.</td></tr>
<tr><td>La cantidad de miel está en cuarentena: nula y UNVALIDATED_SOURCE_SCALE. Las cifras originales quedan únicamente en las fuentes y auditorías; no se aplica un factor corrector supuesto.</td><td>Honey quantity is quarantined: null and UNVALIDATED_SOURCE_SCALE. Original figures remain only in source and audit files; no assumed correction factor is applied.</td></tr>
<tr><td>Persisten discrepancias departamentales de algunos campos REAL y diferencias entre agregados publicados y extracción nativa. No se ajustaron cifras para forzar coincidencias. Revisar calidad, validation_failures y estados por celda.</td><td>Departmental discrepancies in some REAL fields and differences between published aggregates and native extraction remain. No values were adjusted to force agreement. Review quality, validation_failures and cell status.</td></tr>
<tr><td>La correspondencia entre municipios censales 2013 y mapa 2015 es operativa; no certifica límites idénticos. El mapa tiene 339 geometrías válidas y ningún solapamiento detectado; existen huecos cartográficos documentados en la auditoría del proyecto.</td><td>The link between 2013 census municipalities and the 2015 map is operational; identical boundaries are not certified. The map has 339 valid geometries and no detected overlaps; cartographic gaps were identified in the project audit.</td></tr>
<tr><td>Los nombres locales de productos sin traducción taxonómica verificada se conservan identificados como Local name. Los nombres geográficos no se traducen.</td><td>Local product names without a verified taxonomic translation are explicitly retained as Local name. Geographic names are not translated.</td></tr>
</table>
<h2>Archivos / Files</h2><ul>
<li><a href="data/municipal_data.parquet">municipal_data.parquet</a>: matriz de valores / value matrix. Identificadores de texto; enteros y decimales exactos / text identifiers; integers and exact decimals.</li>
<li><a href="data/dictionary_bilingual.csv">dictionary_bilingual.csv</a> y <a href="data/dictionary_bilingual.parquet">Parquet</a>: code, label_es, label_en, definition_es, definition_en, unidades, periodo, fuente, filtro, fórmula, receta y calidad / units, period, source, filter, formula, recipe and quality.</li>
<li><a href="data/cell_status.parquet">cell_status.parquet</a>: misma clave y códigos que los datos; estados por municipio / same key and variable codes; municipality-specific status.</li>
<li><a href="data/status_dictionary.csv">status_dictionary.csv</a>: interpretación bilingüe de estados / bilingual status definitions.</li>
<li><a href="data/variable_aliases.parquet">variable_aliases.parquet</a> y <a href="data/variable_aliases.csv">CSV</a>: valor original = valor canónico × numerator / denominator / original value = canonical value × numerator / denominator.</li>
<li><a href="data/alias_status_overrides.parquet">alias_status_overrides.parquet</a>: estados originales cuando difieren del estado canónico / original statuses when they differ from the canonical status.</li>
<li><a href="data/source_definitions.parquet">source_definitions.parquet</a>: todas las definiciones y códigos de origen, incluidas las consolidadas / all source definitions and codes, including consolidated ones.</li>
<li><a href="data/municipal_context.parquet">municipal_context.parquet</a> y <a href="data/context_dictionary.csv">context_dictionary.csv</a>: denominadores poblacionales del visor, separados de los datos agropecuarios observados. Población 2013 estimada por interpolación, no censo ni proyección oficial / viewer population denominators, separate from observed agricultural data. 2013 population is interpolated, not a census count or official projection.</li>
<li><a href="data/redundancy_audit.json">redundancy_audit.json</a>: reglas, conteos y hashes de entradas / rules, counts and input hashes. PASS es técnico, no certificación científica de cada serie / PASS is technical, not scientific certification of every series.</li>
<li>Agro2013, CategoryExpansion, FullExpansion, RedatamExploration: visor, agregados originales, estados, catálogos y recetas / viewer, original aggregates, status, catalogues and recipes. Algunas fuentes históricas conservan el español / some historical sources remain in Spanish.</li>
<li><a href="EarthEngine/bolivia339_2015.zip">EarthEngine/bolivia339_2015.zip</a>: mapa municipal / municipal map.</li></ul>
<h2>Abrir y reproducir / Open and reproduce</h2>
<p>Abrir index.html o Agro2013/index.html; no requiere internet ni servidor. Open index.html or Agro2013/index.html; no internet or server is required. External references are optional links.</p>
<pre>import pyarrow.parquet as pq
data = pq.read_table('data/municipal_data.parquet')
dictionary = pq.read_table('data/dictionary_bilingual.parquet')
status = pq.read_table('data/cell_status.parquet')</pre>
<p>Reconstruir en otro directorio a partir de los agregados incluidos / Rebuild into a separate directory from the included aggregates:</p>
<pre>python -B Code/build_portable_dataset.py --sources . --output ../BoliviaAgriculturalCensus2013_rebuilt --policy Code/choice_policy.json</pre>
<p>Python 3.12; pyarrow {audit['pyarrow_version']}. Los programas REDATAM individuales conservan sus rutas históricas y requieren configurar la base original y el directorio de salida. La base REDATAM y los microdatos no se distribuyen. Individual REDATAM programs retain historical paths and require the original database and output-path configuration. REDATAM microdata are not distributed.</p>
<p>Datos: INE Bolivia, Censo Agropecuario 2013. Preparación del dataset y visor: Favio Leiva. Data: INE Bolivia, Agricultural Census 2013. Dataset and viewer preparation: Favio Leiva. <a href="https://github.com/Favioleiva/BoliviaAgriculture">Repositorio / Repository</a>.</p></html>'''
    (PKG/'README.html').write_text(text,encoding='utf-8')
    records=pq.read_table(PKG/'data/dictionary_bilingual.parquet').to_pylist()
    compact=[{k:r[k] for k in ['code','definition_es','definition_en','unit','unit_en','recipe','statistical_role']} for r in records]
    (PKG/'data/dictionary-browser.js').write_text('window.CNA_DICTIONARY='+json.dumps(compact,ensure_ascii=False).replace('</','<\\/')+';',encoding='utf-8')
    browser='''<!doctype html><html lang="es"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Diccionario bilingüe / Bilingual dictionary</title><style>STYLE</style><p><a href="Agro2013/index.html#dataset">Visor / Viewer</a> · <a href="data/dictionary_bilingual.csv" download>CSV</a> · <a href="data/dictionary_bilingual.parquet" download>Parquet</a></p><h1>Diccionario / Dictionary</h1><label for="q">Buscar código o definición / Search code or definition</label><br><input id="q" type="search"><p id="count"></p><div class="scroll"><table><thead><tr><th>Código / Code</th><th>Español</th><th>English</th><th>Unidad / Unit</th></tr></thead><tbody id="body"></tbody></table></div><button id="more" style="font:inherit;padding:12px;margin:20px 0">Mostrar más / Show more</button><script src="data/dictionary-browser.js"></script><script>
let limit=50;const q=document.querySelector('#q'),body=document.querySelector('#body');
const normalized=s=>s.normalize('NFD').replace(/[\\u0300-\\u036f]/g,'').toLowerCase();
const searchable=CNA_DICTIONARY.map(r=>normalized(r.code+' '+r.definition_es+' '+r.definition_en));
function draw(){const query=normalized(q.value),hits=CNA_DICTIONARY.filter((r,i)=>!query||searchable[i].includes(query));body.replaceChildren();for(const r of hits.slice(0,limit)){const tr=document.createElement('tr');for(const key of ['code','definition_es','definition_en','unit_en']){const td=document.createElement('td');td.textContent=r[key];tr.append(td)}body.append(tr)}document.querySelector('#count').textContent=hits.length.toLocaleString('en-US')+' resultados / results · '+Math.min(limit,hits.length)+' visibles / shown';document.querySelector('#more').hidden=limit>=hits.length;}
q.addEventListener('input',()=>{limit=50;draw()});document.querySelector('#more').onclick=()=>{limit+=50;draw()};draw();</script></html>'''.replace('STYLE',STYLE+'table{table-layout:fixed;min-width:900px}th:nth-child(1){width:20%}th:nth-child(2),th:nth-child(3){width:34%}th:nth-child(4){width:12%}')
    (PKG/'dictionary.html').write_text(browser,encoding='utf-8')

def package(refresh_ui=False):
    assert (PKG/'data/municipal_data.parquet').exists()
    # Copy all existing download targets, including per-indicator programs and their evidence.
    for name in ([] if refresh_ui else ['Agro2013','FullExpansion','CategoryExpansion','RedatamExploration','EarthEngine']):
        count=0
        for p in (SRC/name).rglob('*'):
            if not p.is_file() or '__pycache__' in p.parts:continue
            q=PKG/p.relative_to(SRC);q.parent.mkdir(parents=True,exist_ok=True)
            if not q.exists() or digest(p)!=digest(q):shutil.copy2(p,q)
            count+=1
        print('Copied',name,count,flush=True)
    code=PKG/'Code';code.mkdir(exist_ok=True)
    for name in ['build_portable_dataset.py','package_portable.py','map_layout.py']:
        shutil.copy2(E/'Code'/name,code/name)
    shutil.copy2(E/'choice_policy.json',code/'choice_policy.json')
    (code/'requirements.txt').write_text('pyarrow=='+pq.__version__+'\n' if hasattr(pq,'__version__') else 'pyarrow==24.0.0\n',encoding='utf-8')
    # Repair the four historical links that leave the copied Deliverables tree.
    outside={}
    for name in ['Agro2013','FullExpansion','CategoryExpansion','RedatamExploration']:
        for source_page in (SRC/name).rglob('*.html'):
            dest=PKG/source_page.relative_to(SRC);s=dest.read_text(encoding='utf-8')
            refs=set(re.findall(r'(?:href|src)=["\']([^"\']+)',re.sub(r'<script\b[^>]*>.*?</script>','',s,flags=re.S)))
            for ref in refs:
                u=urlsplit(html.unescape(ref))
                if u.scheme or not u.path:continue
                p=(source_page.parent/unquote(u.path)).resolve()
                if p.is_relative_to(SRC):continue
                assert p.exists() and p.is_relative_to(ROOT/'Outputs'),p
                q=PKG/'Provenance'/p.relative_to(ROOT/'Outputs');q.parent.mkdir(parents=True,exist_ok=True)
                if not q.exists():shutil.copy2(p,q)
                import os
                new=Path(os.path.relpath(q,dest.parent)).as_posix()+('#'+u.fragment if u.fragment else '')
                s=s.replace('"'+ref+'"','"'+new+'"').replace("'"+ref+"'","'"+new+"'")
                outside[str(p.relative_to(ROOT))]=str(q.relative_to(PKG))
            dest.write_text(s,encoding='utf-8')
    install_downloads(PKG/'Agro2013','../')
    # The existing viewer also exposes these exact downloads.
    install_downloads(SRC/'Agro2013','../BoliviaAgriculturalCensus2013/')
    (PKG/'index.html').write_text('''<!doctype html><html lang="es"><meta charset="utf-8"><title>Bolivia Agricultural Census 2013</title><script>location.replace('Agro2013/index.html'+location.search+location.hash)</script><p><a href="Agro2013/index.html">Abrir el censo / Open the census</a></p></html>''',encoding='utf-8')
    documentation()
    for template, name in [("README.github.md", "README.md"), ("README.github.en.md", "README.en.md")]:
        if (E/"Code"/template).exists(): shutil.copy2(E/"Code"/template, PKG/name)
    write_json(PKG/'data/portable_link_repairs.json',outside)
    data_readme='''Bolivia Agricultural Census 2013 — dataset / datos

339 municipalities / municipios. 22,864 statistical variables / variables estadísticas.
municipal_data.parquet: values / valores; mun_code is a six-character string / texto de seis caracteres.
dictionary_bilingual.parquet or .csv: code, definition_es, definition_en and provenance / trazabilidad.
cell_status.parquet and status_dictionary.csv: quality and missingness / calidad y datos faltantes.
variable_aliases.parquet: original = canonical * numerator / denominator.
source_definitions.parquet: original definitions / definiciones originales.
alias_status_overrides.parquet: original status when different / estados originales diferentes.
municipal_context.parquet and context_dictionary.csv: estimated population denominators,
separate from observed census values / denominadores poblacionales estimados, separados
de los valores censales observados. Population 2013 is interpolated / Población 2013 interpolada.

This archive contains the dataset and dictionaries only. The full BoliviaAgriculturalCensus2013
folder additionally contains the offline viewer, original aggregate sources, maps and programs.
Este ZIP contiene los datos y diccionarios. La carpeta completa incluye además el visor sin
conexión, agregados originales, mapas y programas de reproducción.

Do not sum all columns: totals, components and seasons overlap. No sumar todas las columnas:
los totales, componentes y campañas se superponen. Honey quantities are withheld as null,
not zero / Las cantidades de miel se retienen como nulas, no cero.
Mass conversion / conversión: kg = qq * 46, documented release convention.
Annual production / producción anual: July 2012–June 2013 / julio 2012–junio 2013.
Remaining source discrepancies are recorded in the dictionary / Las discrepancias de origen
se conservan y documentan. Technical validation is not scientific certification of each variable.
La validación técnica no certifica científicamente cada variable.

Read / lectura: import pyarrow.parquet as pq; table = pq.read_table('data/municipal_data.parquet')
'''
    (PKG/'data/README_DATASET.txt').write_text(data_readme,encoding='utf-8')
    # Dataset-only archive is inside the folder; the full portable ZIP is a sibling.
    with zipfile.ZipFile(PKG/'data/dataset_bundle.zip','w',zipfile.ZIP_DEFLATED,compresslevel=6) as z:
        for p in sorted((PKG/'data').iterdir()):
            if p.suffix in ['.parquet','.csv','.json']:z.write(p,'data/'+p.name)
        z.write(PKG/'data/README_DATASET.txt','README_DATASET.txt')
    print('Package copied; viewer downloads and bilingual dictionary installed.',flush=True)

if __name__=='__main__':package(refresh_ui='--refresh-ui' in sys.argv)
