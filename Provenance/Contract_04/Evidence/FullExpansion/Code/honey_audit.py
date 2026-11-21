"""Read-only bounded source audit and presentation quarantine for honey.

No individual records are written. DBL decoding follows De Grande (2016),
table 4: an unheaded sequence of eight-byte doubles. File length, finiteness,
record counts and independent native REDATAM totals are checked explicitly.
The hypothesized 10,000 factor is diagnostic only, never applied to outputs.
"""
from common import *
import math, struct, shutil, xml.etree.ElementTree as ET, html
from decimal import Decimal

IID='cna13b_ganaderia_s6_p81a_c0000_sum'
OFFICIAL='https://siip.produccion.gob.bo/noticias/files/BI_290420161267a_cna%20BOLIVIA_final.pdf'
FORMAT='https://www.scielo.org.mx/pdf/educm/v31n3/2448-6515-educm-31-03-00811.pdf'
STATUS='UNVALIDATED_SOURCE_SCALE'
ES='Serie no validada: la escala de miel en la base local es incompatible con el total publicado por el INE. Se retienen las cifras municipales hasta aclarar la unidad; no equivalen a cero. Referencia nacional publicada: 1,485,700 kg (CNA2013, cuadro 86).'
EN='Unvalidated series: the honey scale in the local database conflicts with the INE published total. Municipal quantities are withheld pending unit clarification; they are not zero. Published national reference: 1,485,700 kg (CNA2013, table 86).'

def backup(p):
 q=E/'History/honey_revision'/p.relative_to(R)
 if not q.exists():q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,q)

def blocked(r):return r['indicator_id']==IID

def decorate(v,r):
 if blocked(r):
  v.update(full_quality_blocked=True,full_quality_status=STATUS)
  v['note_es']=ES+' '+v['note_es'].replace(ES,'').strip();v['note_en']=EN+' '+v['note_en']

def document_view():
 for name in ['README.html','catalogo.html']:
  p=D/name
  if not p.exists():continue
  backup(p);s=p.read_text(encoding='utf-8')
  import re
  s=re.sub(r'<aside id="honey-audit">.*?</aside>','',s,flags=re.S)
  notice='<aside id="honey-audit" class="note"><h2>Miel: escala pendiente de validación</h2><p>'+ES+'</p><p>Los archivos de agregados nativos conservan la salida original como evidencia, no como kilogramos validados. <a href="honey_audit.html">Auditoría, fuentes y pruebas reproducibles</a>.</p></aside>'
  s=s.replace('</h1>','</h1>'+notice,1);write(p,s)

def audit():
 root=ET.parse(W/'CNA2013.dicx').getroot();summaries=[]
 selected={'GANADERIA.S6_P81A','ESPNOMADER.SF_96A','ESPNOMADER.CONSUMO_DE_HOGAR_QQ','CULTINV.S4_P23_6','CULTVER.S4_P24_8'}
 for ent in root.iter('entity'):
  for var in ent.findall('variable'):
   field=ent.findtext('name')+'.'+var.findtext('name')
   if field not in selected:continue
   assert var.findtext('varDicChoice/datasetType')=='DBL'
   p=W/var.findtext('filename').removeprefix('.\\')
   raw=p.read_bytes();assert len(raw)%8==0
   values=[v[0] for v in struct.iter_unpack('<d',raw)]
   assert all(map(math.isfinite,values))
   summaries.append(dict(field=field,file=p.name,sha256=sha(p),bytes=len(raw),records=len(values),decimals=var.findtext('decimals'),minimum=min(values),maximum=max(values),positive=sum(x>0 for x in values),zero=sum(x==0 for x in values),sum=math.fsum(values)))
 honey=next(r for r in summaries if r['field']=='GANADERIA.S6_P81A')
 manifest={r['filename']:r for r in json.loads((BASE/'source_manifest.json').read_text(encoding='utf-8'))['files']}
 for filename in ['CNA2013.dic','CNA2013.dicx']+[r['file'] for r in summaries]:
  baseline=manifest[filename]
  assert sha(W/filename)==baseline['sha256']==sha(R/baseline['path'])
 assert honey['records']==871927 and honey['positive']==41205 and honey['zero']==830722
 assert abs(honey['sum']-148.569999)<1e-9
 controls=read(E/'Results/honey_scale_probe_03_controls.csv',';')
 control_checks=[]
 for col,field in [('HONEY','GANADERIA.S6_P81A'),('FOREST','ESPNOMADER.SF_96A'),('HOME','ESPNOMADER.CONSUMO_DE_HOGAR_QQ')]:
  native=sum(Decimal(r[col]) for r in controls);source=next(r for r in summaries if r['field']==field)
  difference=Decimal(str(source['sum']))-native
  assert abs(difference)<=Decimal('0.000009')
  control_checks.append(dict(field=field,native_department_sum=str(native),direct_source_sum=str(source['sum']),difference=str(difference),tolerance='0.000009',status='PASS'))
 dicx=read(E/'Results/honey_scale_probe_01.csv',';');dic=read(E/'Results/honey_scale_probe_02_dic.csv',';');assert dic==dicx
 official=['134665.1','234119.4','233394.5','2723.0','87001.6','406488.8','298455.5','60712.5','28139.5']
 comparison=[]
 for row,published in zip(dicx,official):
  diagnostic=Decimal(row['RAW6'])*10000
  comparison.append(dict(departamento=row['REDCODE'],native_value=row['RAW6'],published_kg=published,hypothetical_x10000=str(diagnostic),hypothesis_difference_kg=str(diagnostic-Decimal(published)),factor_adopted=False))
 municipal=read(D/'Modules/livestock.csv');municipal_sum=sum(Decimal(r[IID]) for r in municipal if r[IID]!='')
 assert municipal_sum==Decimal('148.569875')
 native_paths=list((E/'Programs').glob('honey_scale_probe_*.spc'))+list((E/'Plans').glob('honey_scale_probe_*.json'))+list((E/'Results').glob('honey_scale_probe_*'))
 evidence=dict(created=now(),audit_status='COMPLETE',scientific_status=STATUS,indicator=IID,field='GANADERIA.S6_P81A',official_source=OFFICIAL,official_table=86,official_pdf_page=90,official_national_kg='1485700.0',format_source=FORMAT,format_basis='Table 4, DBL eight-byte doubles, little-endian; exact file length and native aggregate controls checked. Independent read only; no microrecord export.',source_summaries=summaries,native_controls=control_checks,dic_and_dicx_results_identical=True,municipal_native_sum=str(municipal_sum),department_comparison=comparison,source_mutated=False,scale_factor_applied=False,interpretation='The small total is already present in the supplied DBL file and reproduced by both native dictionaries. Output DECIMALS and REAL copies do not correct it. A 10,000 scale hypothesis matches published magnitudes but is not documented as a source conversion. Two other REAL/4-decimal fields have native sums consistent with their own stored values; no general decimal-factor rule is justified.',validation_gap='Internal reconciliation and declared Kg labels were insufficient; external magnitude validation should have prevented presentation as validated kilograms.',resolution='Quarantine this quantity in viewer/maps/table. Retain native aggregates as audit evidence with explicit quality metadata. Counts and other quantities are unchanged. No reconstructed municipal kilograms until source scale is independently confirmed.',native_artifacts=[dict(path=p.relative_to(O).as_posix(),sha256=sha(p)) for p in native_paths if p.is_file()])
 save(E/'honey_audit.json',evidence);save(D/'honey_quality.json',dict(indicator=IID,source_variable='GANADERIA.S6_P81A',status=STATUS,display_quantity=False,original_values_retained=True,note_es=ES,note_en=EN,official_reference=OFFICIAL,official_national_kg=1485700,correction_factor=None))
 # Retain native numbers but revoke the misleading overall PASS in metadata.
 for filename in ['indicators.json','variable_dictionary.csv']:
  p=D/filename;backup(p)
  items=json.loads(p.read_text(encoding='utf-8')) if p.suffix=='.json' else read(p)
  selected_rows=[r for r in items if blocked(r)];assert len(selected_rows)==1
  selected_rows[0].update(status=STATUS,semantic_limit=ES)
  if p.suffix=='.json':save(p,items)
  else:outcsv(p,items)
 outcsv(D/'honey_department_audit.csv',comparison)
 rows=''.join('<tr>'+''.join('<td>'+html.escape(str(r[k]))+'</td>' for k in ['departamento','native_value','published_kg','hypothetical_x10000','hypothesis_difference_kg'])+'</tr>' for r in comparison)
 write(D/'honey_audit.html','<!doctype html><html lang="es"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Auditoría de miel CNA2013</title><style>body{font:17px/1.6 system-ui;background:#081c18;color:#edf4ee;max-width:1100px;margin:auto;padding:24px}a{color:#a6e7bb}td,th{padding:10px;border-bottom:1px solid #456}table{border-collapse:collapse}.scroll{overflow:auto}</style><a href="../Agro2013/index.html?indicator='+IID+'#explore">Volver al visor</a><h1>Miel: escala no validada</h1><p>'+ES+'</p><p>La suma de los 339 agregados municipales es 148.569875; la lectura independiente del archivo DBL suministrado suma 148.569999. La pequeña diferencia es compatible con la precisión de exportación y no explica la discrepancia de escala. Ambos diccionarios (.dic y .dicx) reproducen la magnitud pequeña. Cambiar DECIMALS o copiar el campo tampoco la resuelve.</p><p>El fallo del código de validación fue aceptar la etiqueta Kg y los controles internos sin detectar esta incompatibilidad externa. El visor ahora retiene esta cantidad en mapa, tabla y total; los agregados originales se conservan como evidencia no validada. Los conteos no se convierten ni sustituyen.</p><p>Multiplicar por 10,000 reproduce aproximadamente las cifras oficiales, pero eso es una hipótesis, no un factor documentado. No se aplica. Las otras dos variables REAL con cuatro decimales no justifican una regla de reescalado general.</p><h2>Contraste departamental</h2><p>La columna ×10,000 es exclusivamente diagnóstica y no se incorpora a la base municipal.</p><div class="scroll"><table><tr><th>Depto.</th><th>Salida nativa</th><th>INE kg</th><th>Hipótesis ×10,000</th><th>Diferencia kg</th></tr>'+rows+'</table></div><p><a href="'+OFFICIAL+'">INE, CNA2013, cuadro 86, página 90</a> · <a href="'+FORMAT+'">De Grande (2016), especificación DBL, cuadro 4</a> · <a href="honey_quality.json">Estado de calidad</a> · <a href="honey_department_audit.csv">Contraste CSV</a> · <a href="../../Evidence/FullExpansion/honey_audit.json">Evidencia y hashes</a> · <a href="../../Evidence/FullExpansion/Code/honey_audit.py">Código de auditoría</a></p><p>Para resolver la escala hace falta documentación de la normalización del campo o una versión corregida y contrastable de la fuente. No se han modificado Inputs ni WorkBase.</p></html>')
 document_view()
 print('Source audit complete; unresolved honey scale quarantined, no rescaling.')

if __name__=='__main__':audit()
