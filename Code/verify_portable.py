"""Independent source-to-Parquet and offline UI checks for the portable release."""
from pathlib import Path
from collections import defaultdict
from decimal import Decimal
import csv, hashlib, json, re, sys, time
from urllib.parse import unquote, urlsplit
import pyarrow.parquet as pq
from playwright.sync_api import sync_playwright

sys.stdout.reconfigure(encoding='utf-8')
ROOT=Path(__file__).resolve().parents[5];E=ROOT/'Outputs/Contract_04/Evidence/FullExpansion'
P=ROOT/'Outputs/Contract_04/Deliverables/BoliviaAgriculturalCensus2013'

def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def payload(path):return json.loads(re.search(r'<script id="payload" type="application/json">(.*?)</script>',path.read_text(encoding='utf-8'),re.S)[1])

def run():
    started=time.time();report={};table=pq.read_table(P/'data/municipal_data.parquet')
    dictionary=pq.read_table(P/'data/dictionary_bilingual.parquet').to_pylist()
    definitions=pq.read_table(P/'data/source_definitions.parquet').to_pylist()
    keys=table['mun_code'].to_pylist();index={k:i for i,k in enumerate(keys)}
    values={c:table[c].to_pylist() for c in table.column_names}
    assert len(keys)==len(set(keys))==339 and all(re.fullmatch(r'\d{6}',k) for k in keys)
    assert [r['code'] for r in dictionary]==table.column_names
    assert all(r['definition_es'] and r['definition_en'] for r in dictionary)
    sources=defaultdict(list)
    for r in definitions:sources[r['source_file']].append(r)
    checks=0;quarantined=0
    for source,meta in sources.items():
        if source.endswith('#payload'):
            original=payload(P/'Agro2013/index.html');rows=original['rows'];key='reference_code'
        else:
            with (P/source).open(encoding='utf-8-sig',newline='') as f:rows=list(csv.DictReader(f))
            key='municipio_id'
        assert len(rows)==339
        for row in rows:
            i=index[row[key]]
            for r in meta:
                actual=values[r['canonical_code']][i]
                if r['quality']=='UNVALIDATED_SOURCE_SCALE':
                    assert actual is None;quarantined+=1;continue
                original=row.get(r['source_code']);expected=None if original is None or str(original)=='' else Decimal(str(original))
                # Only native mass columns need conversion here; annual/grouped CSVs are already derived.
                if expected is not None and r['operation']=='sum' and r['source_unit']=='qq':expected*=46
                assert actual==expected,(source,row[key],r['code'],actual,expected)
                checks+=1
        print('Verified source',source,len(meta),'columns',flush=True)
    report.update(source_value_comparisons=checks,quarantined_null_checks=quarantined,municipalities=339,
        statistical_columns=len(table.column_names)-8,dictionary_rows=len(dictionary),source_definitions=len(definitions))
    context=pq.read_table(P/'data/municipal_context.parquet').to_pylist()
    with (P/'Agro2013/denominators_estimated_2013.csv').open(encoding='utf-8-sig') as f:
        denominator_source={r['reference_code']:r for r in csv.DictReader(f)}
    for r in context:
        s=denominator_source[r['mun_code']]
        for field in ['population_2012','population_2024','population_estimated_2013']:
            assert r[field]==Decimal(s[field]),(r['mun_code'],field)
    report['auxiliary_population_denominator_comparisons']=len(context)*3
    # The new UI controls must not alter any original payload value or variable definition.
    baseline=E/'History/portable_dataset_revision/Outputs/Contract_04/Deliverables/Agro2013/index.html'
    assert payload(baseline)==payload(P/'Agro2013/index.html')
    assert payload(baseline)==payload(ROOT/'Outputs/Contract_04/Deliverables/Agro2013/index.html')
    report['viewer_payload_unchanged']=True
    missing=[];escaped=[];references=0
    for p in P.rglob('*.html'):
        s=re.sub(r'<script\b[^>]*>.*?</script>','',p.read_text(encoding='utf-8'),flags=re.S)
        for href in re.findall(r'(?:href|src)=["\']([^"\']+)',s):
            u=urlsplit(href)
            if u.scheme or not u.path:continue
            q=(p.parent/unquote(u.path)).resolve();references+=1
            if not q.is_relative_to(P):escaped.append((str(p.relative_to(P)),href))
            elif not q.is_file():missing.append((str(p.relative_to(P)),href))
    assert not missing,missing[:10]
    assert not escaped,escaped[:10]
    for r in definitions:assert (P/r['recipe']).is_file(),r['recipe']
    report.update(local_references_checked=references,missing_local_links=missing,escaping_links=escaped,
                  source_recipes_resolved=len(definitions))
    (E/'portable_data_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
    errors=[];external=[];downloads=[]
    with sync_playwright() as pw:
        browser=pw.chromium.launch(channel='msedge',headless=True)
        context=browser.new_context(viewport={'width':1440,'height':1000},accept_downloads=True)
        context.route('http://**/*',lambda route:(external.append(route.request.url),route.abort()))
        context.route('https://**/*',lambda route:(external.append(route.request.url),route.abort()))
        page=context.new_page();page.on('pageerror',lambda e:errors.append(str(e)))
        page.goto((P/'index.html').as_uri(),wait_until='load');page.wait_for_url('**/Agro2013/index.html')
        page.evaluate('window.productsReady')
        assert page.locator('.municipality').count()==339
        assert page.locator('#dataset a').count()==8
        page.locator('#dataset').scroll_into_view_if_needed()
        page.locator('#dataset').screenshot(path=str(E/'portable_downloads_desktop.png'))
        for language in ['en','es']:
            page.locator('#'+language).click()
            page.wait_for_function('(l)=>document.documentElement.lang===l',arg=language)
            assert ('Download' if language=='en' else 'Descarga') in page.locator('#dataset-title').inner_text()
        for link in ['all','parquet','dict','dictpq','quality','aliases']:
            target=page.locator(f'#dataset [data-download-key="{link}"]')
            path=(P/'Agro2013'/target.get_attribute('href')).resolve()
            with page.expect_download() as info:target.click()
            d=info.value;assert d.failure() is None
            assert sha(d.path())==sha(path)
            downloads.append(dict(link=link,file=path.name,sha256=sha(path)))
        for topic in ['full_water','full_agriculture','crops','animals']:
            page.locator('#topic').select_option(topic);page.evaluate('window.productsReady')
            assert page.locator('.municipality').count()==339
        page.set_viewport_size({'width':390,'height':844});page.locator('#dataset').scroll_into_view_if_needed()
        assert page.evaluate('document.documentElement.scrollWidth<=innerWidth+1')
        page.locator('#dataset').screenshot(path=str(E/'portable_downloads_mobile.png'))
        page.goto((P/'dictionary.html').as_uri(),wait_until='load')
        page.locator('#q').fill('cna13_annual_01510000_kg')
        assert page.locator('#body tr').count()==1
        assert 'Papa' in page.locator('#body').inner_text() and 'Potato' in page.locator('#body').inner_text()
        page.set_viewport_size({'width':1440,'height':1000});page.screenshot(path=str(E/'portable_dictionary.png'))
        assert not errors,errors
        assert not external,external
        browser.close()
    report.update(status='PASS',downloads=downloads,browser_errors=errors,external_resource_requests=external,
                  offline_rendering=True,desktop_mobile=True,elapsed_seconds=round(time.time()-started,2))
    (E/'portable_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(report,ensure_ascii=False),flush=True)

if __name__=='__main__':run()
