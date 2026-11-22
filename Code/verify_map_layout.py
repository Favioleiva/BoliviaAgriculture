from pathlib import Path
import hashlib,json,re
from playwright.sync_api import sync_playwright

R=Path(__file__).resolve().parents[5];O=R/'Outputs/Contract_04';E=O/'Evidence/FullExpansion'
P=O/'Deliverables/BoliviaAgriculturalCensus2013';H=E/'History/map_layout_revision'
def payload(p):return re.search(r'<script id="payload" type="application/json">(.*?)</script>',p.read_text(encoding='utf-8'),re.S)[1]
for ui in [O/'Deliverables/Agro2013',P/'Agro2013']:
    assert payload(ui/'index.html')==payload(H/(ui/'index.html').relative_to(R))
checks=[];errors=[]
with sync_playwright() as pw:
    browser=pw.chromium.launch(channel='msedge',headless=True)
    for width,height in [(1440,900),(1366,768),(390,844)]:
        page=browser.new_page(viewport={'width':width,'height':height})
        page.on('pageerror',lambda e:errors.append(str(e)))
        page.goto((P/'Agro2013/index.html').as_uri());page.evaluate('window.productsReady')
        assert page.locator('#animal').count()==1
        assert page.locator('#mapProductControls #animal').count()==1
        assert page.evaluate('document.querySelector("main").lastElementChild.id==="dataset"')
        assert page.locator('.hero a[href="#dataset"]').count()==0
        assert page.locator('#dataset a').count()==8
        for language in ['es','en']:
            page.locator('#'+language).click()
            for topic in ['animals','crops','full_water','full_agriculture']:
                page.locator('#topic').select_option(topic);page.evaluate('window.productsReady')
                ids=page.locator('#animal option').evaluate_all('(xs)=>xs.slice(0,3).map(x=>x.value)')
                assert ids
                page.evaluate('window.scrollTo(0,document.querySelector(".map-card").getBoundingClientRect().top+scrollY-12)')
                for code in ids:
                    page.locator('#animal').select_option(code);page.evaluate('window.productsReady')
                    bounds=page.evaluate('''()=>{const a=document.querySelector('#animal').getBoundingClientRect(),m=document.querySelector('.mapsvg').getBoundingClientRect();return {selectTop:a.top,selectBottom:a.bottom,mapTop:m.top,mapBottom:m.bottom,height:innerHeight,width:innerWidth,overflow:document.documentElement.scrollWidth>innerWidth+1,title:document.querySelector('#mapTitle').textContent}}''')
                    assert bounds['selectTop']>=0 and bounds['selectBottom']<height,(width,topic,code,bounds)
                    assert bounds['mapTop']>=bounds['selectBottom'] and bounds['mapBottom']<=height+2,(width,topic,code,bounds)
                    assert not bounds['overflow'],(width,topic)
                    assert page.locator('.municipality').count()==339
                    checks.append(dict(language=language,topic=topic,code=code,**bounds))
                if language=='es' and topic=='crops':
                    page.screenshot(path=str(E/f'map_layout_{width}.png'))
        # Verify sticky selector while moving through the map, then the final download section.
        page.locator('#topic').select_option('animals');page.evaluate('window.productsReady')
        page.evaluate('window.scrollTo(0,document.querySelector(".mapsvg").getBoundingClientRect().top+scrollY)')
        assert page.locator('#animal').bounding_box()['y']>=0
        page.locator('#dataset').scroll_into_view_if_needed()
        page.screenshot(path=str(E/f'map_layout_downloads_{width}.png'))
        with page.expect_download() as info:page.locator('#dataset [data-download-key="parquet"]').click()
        d=info.value;assert d.failure() is None
        assert hashlib.sha256(Path(d.path()).read_bytes()).digest()==hashlib.sha256((P/'data/municipal_data.parquet').read_bytes()).digest()
        page.close()
    # Original local entrypoint has the same layout and its existing download destination.
    page=browser.new_page();page.goto((O/'Deliverables/Agro2013/index.html').as_uri());page.evaluate('window.productsReady')
    assert page.locator('#mapProductControls #animal').count()==1
    assert page.evaluate('document.querySelector("main").lastElementChild.id==="dataset"')
    assert '../BoliviaAgriculturalCensus2013/data/municipal_data.parquet'==page.locator('#dataset [data-download-key="parquet"]').get_attribute('href')
    browser.close()
assert not errors,errors
result=dict(status='PASS',payloads_unchanged=2,selection_checks=len(checks),checks=checks,browser_errors=errors,downloads_verified=3,selector_unique=True,downloads_last=True)
(E/'map_layout_validation.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps({k:v for k,v in result.items() if k!='checks'}),flush=True)
