"""Seal technical evidence and the portable ZIP; human acceptance remains pending."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import datetime, hashlib, json, re, shutil, zipfile
from build_portable_dataset import digest, write_json

ROOT=Path(__file__).resolve().parents[5];O=ROOT/'Outputs/Contract_04';E=O/'Evidence/FullExpansion'
P=O/'Deliverables/BoliviaAgriculturalCensus2013'

def run():
    validation=json.loads((E/'portable_validation.json').read_text(encoding='utf-8'))
    assert validation['status']=='PASS'
    audit=json.loads((P/'data/redundancy_audit.json').read_text(encoding='utf-8'))
    for n in ['verify_portable.py','finalize_portable.py','build_dashboard.py']:
        shutil.copy2(E/'Code'/n,P/'Code'/n)
    evidence=P/'Validation';evidence.mkdir(exist_ok=True)
    for n in ['portable_validation.json','portable_data_validation.json','portable_rebuild_validation.json',
              'portable_downloads_desktop.png','portable_downloads_mobile.png','portable_dictionary.png']:
        shutil.copy2(E/n,evidence/n)
    files=sorted(p for p in P.rglob('*') if p.is_file() and '.git' not in p.relative_to(P).parts and p!=P/'manifest.json')
    def record(p):return dict(path=p.relative_to(P).as_posix(),bytes=p.stat().st_size,sha256=digest(p))
    with ThreadPoolExecutor(max_workers=12) as pool:records=list(pool.map(record,files))
    manifest=dict(created=datetime.datetime.now(datetime.timezone.utc).isoformat(),
        contract='Contract_04',state='DELIVERED — AWAITING HUMAN APPROVAL',uploaded=False,
        entrypoint='index.html',dataset='data/municipal_data.parquet',dictionary='data/dictionary_bilingual.parquet',
        files=records)
    write_json(P/'manifest.json',manifest)
    archive=P.with_suffix('.zip')
    with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED,compresslevel=6) as z:
        for p in sorted(P.rglob('*')):
            if p.is_file() and '.git' not in p.relative_to(P).parts:z.write(p,Path(P.name)/p.relative_to(P))
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None
        assert len(z.namelist())==len(records)+1
    delivery=dict(status='PASS',archive=str(archive.relative_to(ROOT)),archive_bytes=archive.stat().st_size,
        archive_sha256=digest(archive),manifest_sha256=digest(P/'manifest.json'),files=len(records)+1,
        uploaded=False,human_acceptance='PENDING')
    write_json(E/'portable_delivery.json',delivery)
    text=f'''# Paquete autocontenido — 2026-11-22

DELIVERED — AWAITING HUMAN APPROVAL. PENDING HUMAN ACCEPTANCE.
Solicitud autorizada: visor y descargas dentro de BoliviaAgriculturalCensus2013,
Parquet completo, códigos y diccionario español/inglés, con redundancias analizadas.
Entrega: Deliverables/BoliviaAgriculturalCensus2013/index.html y ZIP hermano.
339 municipios; 28,534 definiciones de origen; 22,864 columnas estadísticas
(11,897 analíticas y 10,967 diagnósticas) y ocho identificadores. Se consolidan
5,670 columnas mediante equivalencias explícitas comprobadas en los 339 municipios;
735 sumas se ofrecen en kg en vez de duplicar qq. Se conservan 29 pares candidatos
distintos. Las coincidencias de valores sin equivalencia semántica no se eliminan.
Diccionario: code, label_es, label_en, definition_es, definition_en y metadatos;
aliases, estados, definiciones originales y denominadores estimados separados.
Miel sigue nula/UNVALIDATED_SOURCE_SCALE. Se conservan discrepancias, campañas,
fuentes publicadas/nativas y limitaciones de geografía y conversión. No se afirma
independencia entre columnas ni aprobación científica universal.

Validación técnica PASS: {validation['source_value_comparisons']:,} comparaciones
directas contra fuentes, {validation['quarantined_null_checks']} nulos de cuarentena,
reproducción íntegra de Parquet desde la carpeta, diccionario y claves, payload del
visor idéntico, {validation['local_references_checked']:,} referencias HTML locales,
todas las recetas, seis descargas verificadas por hash, ES/EN, escritorio/móvil,
consulta bilingüe del diccionario y renderizado sin solicitudes externas.
ZIP: {delivery['archive_bytes']:,} bytes; SHA-256 {delivery['archive_sha256']}.
Manifiesto: {delivery['files']:,} archivos; CRC ZIP comprobado.

Evidencia: Evidence/FullExpansion/portable_validation.json,
portable_data_validation.json, portable_rebuild_validation.json,
portable_delivery.json y capturas portable_*.png.
Código: Evidence/FullExpansion/Code/{{prepare_portable,build_portable_dataset,
package_portable,verify_portable,finalize_portable}}.py. Python 3.12 / PyArrow 24.0.0.
El constructor del visor conserva el panel de descargas en futuras reconstrucciones.
Reanudar datos: python -B Code/build_portable_dataset.py --sources . --output
../BoliviaAgriculturalCensus2013_rebuilt --policy Code/choice_policy.json, desde
la carpeta entregada. No requiere microdatos ni red para reconstruir los Parquet.
La reextracción REDATAM requiere la base original y configurar rutas históricas.
Recuperación de interfaz: History/portable_dataset_revision conserva el respaldo.
Se corrigió la incorporación de estados del piloto leyendo crop_all_long.csv;
una copia redundante se interrumpió y se reanudó solo la interfaz, conservando
las fuentes ya copiadas y verificando enlaces/valores posteriormente.
Sin extracción nueva, modificación de Inputs/fuentes cartográficas/C01/C02,
instalaciones, publicación ni aceptación automática. No quedan tareas de esta
revisión pendientes; las limitaciones científicas anteriores permanecen.

'''
    for name in ['90_EXECUTION_REPORT.md','91_VALIDATION_REPORT.md','99_CLOSURE_REPORT.md']:
        p=O/name;p.write_text(text+p.read_text(encoding='utf-8'),encoding='utf-8')
    p=ROOT/'Contracts/CONTRACT_REGISTER.md';p.write_text(text+p.read_text(encoding='utf-8'),encoding='utf-8')
    p=ROOT/'Contracts/Contract_04.txt';s=p.read_text(encoding='utf-8');s=re.sub(r'^Estado:.*$','Estado: DELIVERED — AWAITING HUMAN APPROVAL',s,count=1,flags=re.M);p.write_text(s,encoding='utf-8')
    print(json.dumps(delivery,ensure_ascii=False),flush=True)

if __name__=='__main__':run()
