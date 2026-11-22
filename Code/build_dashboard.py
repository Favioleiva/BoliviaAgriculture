"""Extend the preserved viewer only after count/integrity validation passes."""
from specification import *
import re,html,shutil
import overview
import kilograms
import annual_production
import top_products
import honey_audit
import simplify_choices
import english_locale

def run():
 validation=json.loads((E/'validation.json').read_text(encoding='utf-8'));assert validation['integrity_and_counts_status']=='PASS'
 recipes=json.loads((D/'indicators.json').read_text(encoding='utf-8'));ui=O/'Deliverables/Agro2013';history=E/'History'/ui.relative_to(R)
 page=(history/'index.html').read_text(encoding='utf-8');pattern=r'(<script id="payload" type="application/json">)(.*?)(</script>)';payload=json.loads(re.search(pattern,page,re.S)[2]);oldvars=len(payload['variables'])
 data_rows_hash=hashlib.sha256(json.dumps(payload['rows'],sort_keys=True).encode()).hexdigest()
 choice_policy=simplify_choices.load_policy()
 for r in recipes:
  entity_names={'BOVINO':'Bovinos','OVINO':'Ovinos','PORCINOG':'Porcinos de granja','PORCINOC':'Porcinos de corral','CAPRINO':'Caprinos','LLAMA':'Llamas','ALPACA':'Alpacas','AVESG':'Aves de granja','AVESC':'Aves de corral','NROEMPL':'Personal empleado','CULTFRU':'Frutales dispersos','CULTORG':'Cultivos orgánicos','ESPNOMADER':'Productos no maderables'}
  display_label=(entity_names.get(r['entity'],'')+' · ' if r['entity'] in entity_names else '')+r['label']
  if r['entity'] in ['CULTINV','CULTVER']:display_label+=' · '+r['reference_period']
  context='Unidad de análisis: '+('UPA únicas' if r['operation'].startswith('holdings') else r['entity'])+'. '+r['reference_period']+'. '
  note=context+'Conteos de registros y UPA no son intercambiables. Los datos faltantes se conservan; las sumas incluyen solo cantidades válidas.'
  if r['operation']=='sum':note+=' Una suma parcial no representa necesariamente toda la producción.'
  if r['entity']=='NROEMPL':note+=' Trabajadores declarados por UPA; no personas únicas entre explotaciones.'
  if r['group']=='water':note+=' El método pertenece a la UPA; no identifica hectáreas por método y cultivo.'
  if r['group'] in ['agriculture','plants','structure']:note+=' Asignación al municipio jerárquico de la UPA; no certifica la ubicación física de cada parcela.'
  if r['statistical_role']=='diagnostic':note+=' Diagnóstico o respuesta no sustantiva: consultar la definición.'
  if r.get('semantic_limit'):note+=' '+r['semantic_limit']
  if r.get('source_imputation_note'):note+=' '+r['source_imputation_note']
  if r.get('record_interpretation'):note+=' '+r['record_interpretation']
  if r['validation_failures']:note+=f' Hay {r["validation_failures"]} discrepancias en el control departamental; cifras sin ajustar.'
  if r.get('component_discrepancies'):note+=f' Hay {r["component_discrepancies"]} diferencias entre el total y sus componentes; cifras originales conservadas.'
  en='Raw census counts or sums. Records and unique holdings are distinct units. Missing quantities remain missing; partial sums include only valid quantities. Source question and category labels are retained in Spanish. '+r['reference_period']+'.'
  if r['entity']=='NROEMPL':en+=' Workers reported by holdings are not unique persons across holdings.'
  if r['group'] in ['agriculture','plants','structure']:en+=' Aggregation follows the holding municipality; it does not certify every plot location.'
  if r['validation_failures']:en+=' Departmental reconciliation discrepancies are documented; values are unchanged.'
  if r.get('component_discrepancies'):en+=' Total/component discrepancies are documented; source values are unchanged.'
  if r.get('source_imputation_note'):en+=' '+r.get('source_imputation_note_en','Official metadata documents automatic blank-to-zero imputation in this source field; imputed zeros cannot be separated here.')
  if r.get('record_interpretation'):en+=' An age/sex row does not imply positive livestock quantity; use holdings with a positive quantity to measure livestock presence.'
  payload['variables'].append(dict(variable=r['indicator_id'],es=display_label,en=display_label,group='full_'+r['group'],unit_es=r['unit'],unit_en=r['unit'],decimals=0 if r['integer_expected'] else 2,note_es=note,note_en=en,full_field=r['source_variable'],full_question=(entity_names.get(r['entity'],'')+' · ' if r['entity'] in entity_names else '')+(V[r['source_variable']]['label'] if r['source_variable'] in V else r['source_variable']),full_role=r['statistical_role'],full_operation=r['operation'],full_period=r['reference_period'],full_recipe=r['reproduction_program']))
  kilograms.decorate(payload['variables'][-1],r)
  honey_audit.decorate(payload['variables'][-1],r)
  simplify_choices.decorate(payload['variables'][-1],r,choice_policy)
 assert hashlib.sha256(json.dumps(payload['rows'],sort_keys=True).encode()).hexdigest()==data_rows_hash
 annual_production.integrate(payload)
 english_names=english_locale.apply(payload,recipes)
 page=re.sub(pattern,lambda m:m[1]+json.dumps(payload,ensure_ascii=False,allow_nan=False).replace('</',r'<\/')+m[3],page,flags=re.S)
 controls='<label id="fullFieldLabel" hidden><span data-i18n="fullField">Pregunta</span><select id="fullField"></select></label><label id="fullRoleLabel" hidden><span data-i18n="fullRole">Vista</span><select id="fullRole"><option value="primary">Principales</option><option value="analytical">Todas las respuestas</option><option value="diagnostic">Diagnósticos</option><option value="all">Diccionario completo</option></select></label>'
 page=page.replace('<label><span data-i18n="animal">Variable</span>',controls+'<label><span data-i18n="animal">Variable</span>',1)
 downloads='<div id="fullDownloads" class="downloads" hidden><a id="fullData" download data-i18n="fullData">CSV del módulo</a><a id="fullCode" download data-i18n="fullCode">Código de este indicador</a><a id="fullDefinition" data-i18n="fullDefinition">Definición y controles</a><a href="../FullExpansion/catalogo.html" data-i18n="fullCatalogue">Catálogo de la ampliación</a><a href="../FullExpansion/README.html" data-i18n="fullMethods">Método y cobertura</a></div>'
 downloads=downloads.replace('</div>','<a href="../FullExpansion/choice_diagnosis.html" data-i18n="fullViewRules">Criterios de esta vista</a></div>')
 page=page.replace('<div id="cropDownloads"',downloads+'<div id="cropDownloads"',1)
 lead='Explora los cultivos y los módulos de producción, agua, trabajo, ganadería, equipamiento y servicios del censo en los 339 municipios. Conteos y sumas crudas, con código y definición por indicador.'
 page=re.sub(r'(data-i18n="lead">).*?(</p>)',lambda m:m[1]+lead+m[2],page)
 updated_text={
  'plantsTitle':'Cultivos y módulos del censo',
  'treesText':'Consulta plantas frutales dispersas por especie y UPA con registros de plantas medicinales. El módulo de medicinales no contiene una cantidad de plantas: sus registros y UPA se muestran por separado.',
  'otherText':'Agua, energía, trabajo, asistencia y crédito están disponibles en el selector de temas. El uso productivo de agua y energía no mide servicios domésticos; trabajadores declarados por las UPA no son personas únicas entre explotaciones.',
  'methodLimits':'La ampliación presenta conteos y sumas físicas por módulo, con universos separados y programas por indicador. Los destinos describen usos de la producción; no contienen precios ni importes monetarios. Las discrepancias de conciliación se documentan sin ajustar cifras. No se suman totales y componentes, cultivos asociados o campañas indiscriminadamente.'}
 for key,text in updated_text.items():
  page=re.sub(r'(<[^>]+data-i18n="'+key+r'"[^>]*>).*?(</[^>]+>)',lambda m:m[1]+text+m[2],page,flags=re.S)
 page,overview_en=overview.apply(page,recipes,payload)
 page=top_products.apply(page)
 js=(history/'assets/app.js').read_text(encoding='utf-8')
 js=english_locale.javascript(english_names)+js
 js=js.replace("(nonanimal?current()['note_'+lang]:words[lang][m+'Note'])", "((nonanimal||m==='count')?current()['note_'+lang]:words[lang][m+'Note'])")
 js=js.replace('`${v} (${counts[v]})`','`${localeName(v)} (${counts[v]})`')
 topics={ 'full_'+g:label for g,(label,_) in GROUPS.items() }
 topics_en=dict(structure='Holding structure and land tenure',agriculture='Crop production and calendar',plants='Scattered fruit and medicinal plants',practices='Practices and organic agriculture',livestock='Livestock, milk and beekeeping',health='Animal health',water='Irrigation and water sources',forest='Forests and forest products',fishing='Hunting, fishing and aquaculture',workforce='Labour and family composition',energy='Energy and machinery use',infrastructure='Infrastructure and equipment',services='Assistance, credit and insurance')
 js=js.replace('const variableById=', 'Object.assign(TOPICS.es,'+json.dumps(topics,ensure_ascii=False)+');Object.assign(TOPICS.en,'+json.dumps({'full_'+k:v for k,v in topics_en.items()})+');\nconst variableById=',1)
 js=js.replace('const cropMode=',(E/'Code/full_interface.js').read_text(encoding='utf-8')+'\nconst cropMode=',1)
 js=js.replace('function variableOptions(old){','function variableOptions(old){if(fullTopic()){fullVariableOptions(old);return;}',1)
 js=js.replace('function syncCropControls(){','function syncCropControls(){fullSyncVisibility();',1)
 js=js.replace('function value(r){','function value(r){if(fullMode())return fullValue(r);',1)
 js=js.replace('function measureLabel(){','function measureLabel(){if(fullMode())return (current().full_operation==="sum"?(current().full_mass_factor?(lang==="es"?"Suma convertida · ":"Converted sum · "):(lang==="es"?"Suma cruda · ":"Raw sum · ")):(lang==="es"?"Conteo · ":"Count · "))+current()["unit_"+lang];',1)
 js=js.replace('async function loadAndUpdate(){','async function loadAndUpdate(){if(fullMode()){const id=current().variable;$("#measureNote").textContent=lang==="es"?"Cargando módulo local…":"Loading local module…";try{await ensureFull();if(current()?.variable===id)update()}catch(e){$("#measureNote").textContent=e.message;throw e}return;}',1)
 js=js.replace('const code=current()?.crop_code;', 'const loadId=current()?.variable,code=current()?.crop_code;',1)
 js=js.replace('if(current()?.crop_code===code)update()', 'if(current()?.variable===loadId&&current()?.crop_code===code)update()',1)
 js=js.replace("document.querySelectorAll('.municipality').forEach(p=>p.classList.toggle", "if(fullMode())fullDetails(r);document.querySelectorAll('.municipality').forEach(p=>p.classList.toggle",1)
 js=js.replace("table();details();\n}","table();details();if(fullMode())fullUpdateExtras();\n}",1)
 # Keep the original raw data rows untouched; new data live in independently loaded modules.
 js=js.replace("n(r[$('#animal').value],current().decimals)","n(fullMode()?fullValue(r):r[$('#animal').value],current().decimals)")
 js=js.replace('x==null?words[lang].missing:Number(x).toLocaleString','x==null?words[lang].missing:(fullMode()&&d>0&&x>0&&x<0.005)?"<"+Number(0.01).toLocaleString(lang==="es"?"es-BO":"en-US",{minimumFractionDigits:2,maximumFractionDigits:2}):Number(x).toLocaleString',1)
 js=js.replace("${crop?(lang==='es'?'Cero observado':'Observed zero'):words[lang].zero}","${fullMode()?(lang==='es'?'Cero en la base':'Recorded zero'):crop?(lang==='es'?'Cero observado':'Observed zero'):words[lang].zero}",1)
 js=js.replace("titleLines.forEach((line,i)=>add(-78+i*24,line,20));","titleLines.slice(0,3).forEach((line,i)=>add(-78+i*24,line+(i===2&&titleLines.length>3?'…':''),20));")
 texts=dict(fullField='Question or field',fullRole='Result type',fullData='Module CSV',fullCode='Code for this indicator',fullDefinition='Definition and checks',fullCatalogue='Expansion catalogue',fullMethods='Methods and coverage',lead='Explore crops and census modules for production, water, work, livestock, equipment and services across 339 municipalities. Raw counts and sums, with code and definitions for each indicator.')
 texts.update(plantsTitle='Crops and census modules',treesText='Explore scattered fruit plants by species and holdings with medicinal-plant records. The medicinal module has no plant quantity: records and unique holdings are shown separately.',otherText='Water, energy, labour, assistance and credit are available in the topic selector. Productive water and energy use do not measure household services; workers reported by holdings are not unique persons across holdings.',methodLimits='The expansion includes raw counts and physical sums with separate universes and code per indicator. Production destinations do not contain prices or monetary amounts. Reconciliation discrepancies are documented without adjusting values. Totals and components, associated crops and seasons are not indiscriminately added.')
 texts.update(overview_en)
 texts.update(fullField='Question',fullRole='View',fullViewRules='View selection criteria')
 js=js.replace('const ES={};','Object.assign(EN,'+json.dumps(texts)+');\nconst ES={};',1)
 js+='''
for(const [key,title] of Object.entries(TOPICS.es)){if([...$('#topic').options].some(o=>o.value===key))continue;const o=document.createElement('option');o.value=key;o.textContent=TOPICS[lang][key];$('#topic').append(o)}
$('#fullField').onchange=()=>{const field=$('#fullField').value;fullVariableOptions();$('#fullField').value=field;fullVariableOptions();window.productsReady=loadAndUpdate()};
$('#fullRole').onchange=()=>{variableOptions();window.productsReady=loadAndUpdate()};
$('#topic').onchange=()=>{$('#fullField').replaceChildren();variableOptions();$('#measure').value='count';window.productsReady=loadAndUpdate()};
$('#animal').onchange=()=>{window.productsReady=loadAndUpdate()};
const fullRequested=new URLSearchParams(location.search).get('indicator');
if(fullRequested&&variableById.get(fullRequested)?.full_field){const requested=variableById.get(fullRequested);$('#topic').value=requested.group;$('#fullRole').value=requested.full_primary!==false?'primary':requested.full_role;variableOptions(fullRequested);window.productsReady=loadAndUpdate()}
const originalLanguage=language;language=function(l){originalLanguage(l);const labels=l==='es'?['Principales','Todas las respuestas','Diagnósticos','Diccionario completo']:['Main indicators','All responses','Diagnostics','Full dictionary'];[...$('#fullRole').options].forEach((o,i)=>o.textContent=labels[i])};
'''
 js+=overview.JS
 js+='\n'+(E/'Code/topic_counts.js').read_text(encoding='utf-8')
 js=js.replace('(current().full_mass_factor?', '(current().full_annual?(lang==="es"?"Producción anual · ":"Annual production · "):current().full_mass_factor?')
 js=js.replace('function measureLabel(){','function measureLabel(){if(fullMode()&&current().full_quality_blocked)return lang==="es"?"Escala no validada":"Unvalidated scale";',1)
 # User preference: comma thousands and decimal point in both languages.
 js=js.replace("es-BO","en-US")
 for group in GROUPS:
  blob=json.loads((D/'Modules'/f'{group}.json').read_text(encoding='utf-8'))
  write(ui/'assets/full'/f'{group}.js','window.receiveFull('+json.dumps(group)+','+json.dumps(blob,ensure_ascii=False,separators=(',',':'),allow_nan=False).replace('</',r'<\/')+');')
 css=(history/'assets/style.css').read_text(encoding='utf-8')+'\nbody[data-topic^="full_"] #datatable th:nth-child(6),body[data-topic^="full_"] #datatable td:nth-child(6),body[data-topic^="full_"] #datatable th:nth-child(8),body[data-topic^="full_"] #datatable td:nth-child(8){display:none}#fullFieldLabel select,#fullRoleLabel select{max-width:100%}.workspace h2{overflow-wrap:anywhere}\n'
 css+='\nbody[data-topic^="full_"][data-measure="count"] #detailComponents{display:block}body[data-topic^="full_"] .controls{display:grid;grid-template-columns:repeat(3,minmax(0,1fr))}body[data-topic^="full_"] .controls label:has(#animal){grid-column:span 3}body[data-topic^="full_"] .controls label{min-width:0}@media(max-width:700px){body[data-topic^="full_"] .controls{grid-template-columns:1fr}body[data-topic^="full_"] .controls label:has(#animal){grid-column:auto}}\n'
 css+=overview.CSS
 write(ui/'index.html',page);write(ui/'assets/app.js',js);write(ui/'assets/style.css',css)
 write(E/'Code/agro_interface_full.js',js)
 save(E/'dashboard_build.json',dict(created=now(),previous_variables=oldvars,added_indicators=len(recipes),groups=len(GROUPS),previous_rows_sha256=data_rows_hash,previous_rows_unchanged=True))
 print('Integrated',len(recipes),'indicators in',len(GROUPS),'lazy-loaded modules')
 from map_layout import apply_layout
 apply_layout(ui)
 # Preserve the authorized dataset-download panel on subsequent viewer rebuilds.
 if (O/'Deliverables/BoliviaAgriculturalCensus2013/data/municipal_data.parquet').exists():
  from package_portable import install_downloads
  install_downloads(ui,'../BoliviaAgriculturalCensus2013/')
if __name__=='__main__':run()
