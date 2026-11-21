"""Reproducible presentation policy; no changes to census values or definitions."""
from specification import *
import re,shutil,unicodedata,html

H=E/'History/simplified_choices_revision'
UI=O/'Deliverables/Agro2013'
ADMIN={'UPA.S2_P16':'Tipo de informante', 'UPA.S16_P132':'Estado de la entrevista', 'GANADERIA.S6_P81B':'Unidad de miel; no es cantidad producida'}
def norm(s):return ''.join(c for c in unicodedata.normalize('NFD',s.strip().lower()) if not unicodedata.combining(c))
def backup(p):
 q=H/p.relative_to(R)
 if not q.exists():q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,q)
def prepare():
 assert not H.exists(),'Preparation already completed; do not repeat'
 paths=[R/'Contracts/Contract_04.txt',R/'Contracts/CONTRACT_REGISTER.md',*[O/n for n in ['90_EXECUTION_REPORT.md','91_VALIDATION_REPORT.md','99_CLOSURE_REPORT.md']],D/'codigos_y_diccionario.zip',*[UI/n for n in ['index.html','assets/app.js','assets/style.css','assets/top-products.js']],*[E/'Code'/n for n in ['build_dashboard.py','full_interface.js','agro_interface_full.js','top_products.js']],E/'dashboard_build.json',E/'overview_counts.json']
 for p in paths:backup(p)
 p=R/'Contracts/Contract_04.txt';s=re.sub(r'^Estado:.*$','Estado: EXECUTING — SIMPLIFICACIÓN ANALÍTICA',p.read_text(encoding='utf-8'),count=1,flags=re.M)
 write(p,s+'\n\nADENDA — DIAGNÓSTICO Y SIMPLIFICACIÓN DE OPCIONES, '+now()+'\nEl supervisor solicita diagnosticar alternativas redundantes y simplificar la visualización, priorizando respuestas afirmativas en preguntas de uso/presencia. Crear una política reproducible de vista principal: UPA con respuesta afirmativa en preguntas declaradas Sí/No; preservar subtipos afirmativos, categorías sustantivas y unidades diferentes. Retirar de la vista principal duplicados de registros/UPA solo cuando el mismo filtro da valores idénticos en los 339 municipios; no tratar personas o trabajadores como UPA. Mantener sumas físicas y UPA con cantidad positiva. Conservar todas las respuestas, diagnósticos, códigos, diccionarios, datos y enlaces mediante vistas completas. Sin agregar categorías, calcular porcentajes, cambiar denominadores o alterar los datos. Documentar decisiones por campo/indicador y casos no simplificables. Cambios permitidos: Code, nueva evidencia y diagnóstico FullExpansion, visor HTML/JS, paquete, informes, registro y manifiestos C04. Verificar las selecciones, enlaces antiguos, ES/EN, mapa/tabla/total y preservación de datos; sin nueva extracción ni publicación. PENDING HUMAN ACCEPTANCE.\n')

def run():
 recipes=json.loads((D/'indicators.json').read_text(encoding='utf-8'));byfield=defaultdict(list)
 for r in recipes:byfield[r['source_variable']].append(r)
 blobs={g:json.loads((D/'Modules'/(g+'.json')).read_text(encoding='utf-8')) for g in GROUPS}
 policy={};fields=[];equal_pairs=[]
 for f,rs in byfield.items():
  declared={norm(c['label']) for c in C[f] if not c['declared_special'] and not c['label_suggests_nonresponse']}
  binary=declared=={'si','no'}
  affirmative_subtypes=bool(declared) and 'no' in declared and all(v=='no' or v.startswith('si,') for v in declared)
  paired={(r['context'],r['operation']):r for r in rs}
  for r in rs:
   iid=r['indicator_id'];primary=r['statistical_role']=='analytical';reason='substantive';target=None
   if not primary:reason='diagnostic'
   elif f in ADMIN:primary=False;reason='administrative_or_unit_field'
   elif binary or affirmative_subtypes:
    yes=norm(r['context_label'])=='si' or (affirmative_subtypes and norm(r['context_label']).startswith('si,'))
    if not yes:primary=False;reason='non_affirmative_response'
    elif r['operation']=='records':
     partner=paired.get((r['context'],'holdings'));assert partner,f
     primary=False;reason='affirmative_use_unique_holdings';target=partner['indicator_id']
    elif r['operation']=='holdings':reason='affirmative_unique_holdings'
   elif r['operation']=='records' and r['entity'] not in {'COMPFAM','NROEMPL'}:
    partner=paired.get((r['context'],'holdings'))
    if partner and partner['statistical_role']=='analytical':
     a=blobs[r['group']]['variables'][iid];b=blobs[r['group']]['variables'][partner['indicator_id']]
     assert len(a)==len(b)==339
     if a==b:
      primary=False;reason='same_filter_equal_records_and_holdings';target=partner['indicator_id']
      equal_pairs.append(dict(records=iid,holdings=target,field=f,context=r['context'],municipal_values_checked=339))
   policy[iid]=dict(primary=primary,reason=reason,alternative=target,binary=binary,affirmative_subtypes=affirmative_subtypes)
  fields.append(dict(source_variable=f,question=V.get(f,{}).get('label',f),group=rs[0]['group'],binary=binary,affirmative_subtypes=affirmative_subtypes,analytical_before=sum(r['statistical_role']=='analytical' for r in rs),primary_after=sum(policy[r['indicator_id']]['primary'] for r in rs),diagnostics=sum(r['statistical_role']=='diagnostic' for r in rs),affirmative_indicators=sum(policy[r['indicator_id']]['reason']=='affirmative_unique_holdings' for r in rs),note='Sin respuesta afirmativa recuperada: no fabricar un cero ni mostrar No como presencia.' if binary and not any(policy[r['indicator_id']]['primary'] for r in rs) else ADMIN.get(f,'')))
 counts=dict(native_indicators=len(recipes),analytical_before=sum(r['statistical_role']=='analytical' for r in recipes),primary_native=sum(p['primary'] for p in policy.values()),binary_fields=sum(f['binary'] for f in fields),binary_fields_with_affirmative=sum(f['binary'] and f['affirmative_indicators']>0 for f in fields),affirmative_subtype_fields=sum(f['affirmative_subtypes'] for f in fields),equal_record_holding_pairs=len(equal_pairs),administrative_fields=len(ADMIN))
 save(E/'choice_policy.json',dict(created=now(),source_metadata_sha256=sha(D/'indicators.json'),counts=counts,fields=fields,indicators=policy,equal_pairs=equal_pairs,module_sha256={g:sha(D/'Modules'/(g+'.json')) for g in GROUPS}))
 outcsv(D/'choice_diagnosis_fields.csv',fields)
 outcsv(D/'choice_diagnosis_indicators.csv',[dict(indicator_id=r['indicator_id'],source_variable=r['source_variable'],label=r['label'],operation=r['operation'],statistical_role=r['statistical_role'],primary=policy[r['indicator_id']]['primary'],reason=policy[r['indicator_id']]['reason'],alternative=policy[r['indicator_id']]['alternative'] or '',reproduction_program=r['reproduction_program']) for r in recipes])
 changed=[f for f in fields if f['primary_after']!=f['analytical_before']]
 rows=''.join('<tr><td>'+html.escape(f['question'])+'<br><small>'+f['source_variable']+'</small></td><td>'+str(f['analytical_before'])+'</td><td>'+str(f['primary_after'])+'</td><td>'+html.escape(f['note'] or ('Solo UPA con respuesta afirmativa' if f['binary'] or f['affirmative_subtypes'] else 'Registros y UPA coinciden con el mismo filtro; se prioriza UPA'))+'</td></tr>' for f in changed)
 write(D/'choice_diagnosis.html','<!doctype html><html lang="es"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Diagnóstico de alternativas del censo</title><style>body{font:17px/1.6 system-ui;background:#0b201a;color:#e9f4ec;max-width:1100px;margin:auto;padding:24px}a{color:#a9e7bc}table{border-collapse:collapse;width:100%}td,th{padding:12px;text-align:left;border-bottom:1px solid #466}small{color:#abd0bc}.scroll{overflow:auto}</style><a href="../Agro2013/index.html#explore">Abrir visor</a><h1>Opciones principales y desglose completo</h1><p>Se revisaron '+str(len(fields))+' campos con indicadores. '+str(counts['binary_fields_with_affirmative'])+' preguntas Sí/No tienen respuestas afirmativas recuperadas. La vista principal muestra UPA que responden Sí: no repite No, sin dato, registros y UPA como cuatro alternativas.</p><p>Se comprobaron '+str(len(equal_pairs))+' pares adicionales de registros/UPA: coinciden en los 339 municipios usando el mismo filtro. Se prioriza UPA únicamente en la vista; ambas definiciones y sus códigos se conservan. Esta igualdad observada no se generaliza a otras categorías o futuras bases. En familia y empleo se mantienen ambas unidades, incluso cuando coinciden.</p><p>'+str(counts['analytical_before'])+' definiciones nativas analíticas → '+str(counts['primary_native'])+' marcadas como principales antes de sustituir campañas por producción anual. La política de producción anual y los grupos ganaderos existentes no cambian.</p><p>Se conservan categorías sustantivas como riego/secano, propiedad/alquiler, sexo y trabajo remunerado/no remunerado. Los subtipos afirmativos no se suman ni fusionan. No se suman UPA entre preguntas de riego: una misma UPA puede usar varios métodos. No se calculan tasas ni se cambian denominadores. Las sumas físicas y UPA con cantidad positiva siguen separadas.</p><p>El selector <b>Vista</b> permite elegir <b>Principales</b>, <b>Todas las respuestas</b>, <b>Diagnósticos</b> y <b>Diccionario completo</b>. Los enlaces antiguos abren la vista que contiene el indicador solicitado. Tres campos administrativos/de unidad quedan en las vistas completas. La miel continúa no validada.</p><p><a href="choice_diagnosis_fields.csv">Diagnóstico por campo</a> · <a href="choice_diagnosis_indicators.csv">Decisión y código por indicador</a> · <a href="../../Evidence/FullExpansion/Code/simplify_choices.py">Reglas reproducibles</a> · <a href="catalogo.html">Catálogo original completo</a></p><div class="scroll"><table><tr><th>Pregunta</th><th>Antes</th><th>Principales</th><th>Motivo</th></tr>'+rows+'</table></div></html>')
 print(json.dumps(counts))

def load_policy():
 obj=json.loads((E/'choice_policy.json').read_text(encoding='utf-8'));assert obj['source_metadata_sha256']==sha(D/'indicators.json'),'Regenerate choice policy after metadata changes'
 return obj['indicators']
def decorate(v,r,policy):
 p=policy[r['indicator_id']];v.update(full_primary=p['primary'],full_choice_reason=p['reason'])
 if p['reason']=='affirmative_unique_holdings':
  v['full_choice_es']='UPA que responden Sí' if p['binary'] else 'UPA · '+r['context_label']
  v['full_choice_en']='Holdings answering Yes' if p['binary'] else 'Holdings · '+r['context_label']

if __name__=='__main__':
 import sys
 prepare() if '--prepare' in sys.argv else run()
