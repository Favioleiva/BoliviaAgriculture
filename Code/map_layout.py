"""Keep the active product selector with its map and complete downloads at the end."""
from pathlib import Path
import re

CSS = '''
.map-card{min-width:0}
#mapProductControls{position:sticky;top:8px;z-index:5;background:var(--card);padding:12px;margin:-6px -6px 16px;border:1px solid var(--line);border-radius:10px;box-shadow:0 3px 12px #0000000a}
#mapProductControls label{display:flex;flex-direction:column;gap:7px;font-size:14px;min-width:0}
#mapProductControls select{display:block;width:100%;min-width:0;max-width:100%;font-size:16px;min-height:44px}
.map-card .mapsvg{max-height:clamp(240px,calc(100vh - 270px),620px);max-height:clamp(240px,calc(100svh - 270px),620px)}
@media(max-width:540px){#mapProductControls{top:4px;padding:10px}.map-card .mapsvg{max-height:clamp(240px,calc(100svh - 300px),520px)}}
'''

def apply_layout(ui):
    ui=Path(ui);p=ui/'index.html';s=p.read_text(encoding='utf-8')
    original_payload=re.search(r'<script id="payload" type="application/json">(.*?)</script>',s,re.S)[1]
    if 'id="mapProductControls"' not in s:
        match=re.search(r'<label><span data-i18n="animal">.*?</label>',s,re.S)
        assert match, 'Unique existing variable selector label must be present'
        label=match[0];assert label.count('id="animal"')==1
        s=s[:match.start()]+s[match.end():]
        old='<div class="workspace"><div class="card"><div class="maptop">'
        new='<div class="workspace"><div class="card map-card"><div id="mapProductControls">'+label+'</div><div class="maptop">'
        assert s.count(old)==1;s=s.replace(old,new,1)
    # Downloads are the final main-content section; no early hero shortcut.
    m=re.search(r'<section id="dataset".*?</section>',s,re.S)
    if m:
        block=m[0];s=s[:m.start()]+s[m.end():];assert s.count('</main>')==1
        s=s.replace('</main>',block+'\n</main>',1)
    s=re.sub(r'<a[^>]*data-download-key="nav"[^>]*>.*?</a>','',s,flags=re.S)
    if 'href="assets/map-layout.css"' not in s:
        s=s.replace('</head>','<link rel="stylesheet" href="assets/map-layout.css"></head>',1)
    assert s.count('id="animal"')==s.count('id="mapProductControls"')==1
    assert original_payload==re.search(r'<script id="payload" type="application/json">(.*?)</script>',s,re.S)[1]
    p.write_text(s,encoding='utf-8')
    (ui/'assets/map-layout.css').write_text(CSS,encoding='utf-8')

if __name__=='__main__':
    root=Path(__file__).resolve().parents[5]/'Outputs/Contract_04/Deliverables'
    for ui in [root/'Agro2013',root/'BoliviaAgriculturalCensus2013/Agro2013']:apply_layout(ui)
