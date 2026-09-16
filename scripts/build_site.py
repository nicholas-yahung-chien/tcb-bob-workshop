"""Build an offline-friendly static workshop website; Python standard library only."""
from pathlib import Path
from html import escape
import re
import json

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / "site"
BASE = "https://github.com/nicholas-yahung-chien/tcb-bob-workshop"


def code(text): return '<pre><code>'+escape(text)+'</code></pre>'


def prompt(stem, title, mode):
    text=(ROOT/"prompts"/(stem+".md")).read_text(encoding="utf-8")
    context=json.loads((ROOT/"lessons/prompt-context.json").read_text(encoding="utf-8"))[stem]
    files='、'.join('<code>'+escape(name)+'</code>' for name in context['files']) if context['files'] else '沿用目前對話；需要翻譯時加入實際產生的文件。' if stem=='workflow-docs-zh-tw' else '沿用目前對話，不需新增檔案。'
    return f'<p class="mode-guide"><strong>{escape(mode)} 模式</strong></p><p class="file-context">加入檔案：{files}</p><div class="prompt"><div class="prompt-head"><span>{escape(title)}</span><button type="button" data-copy="{stem}">複製 Prompt</button></div><pre id="{stem}">{escape(text)}</pre><div class="expected"><strong>預期回應</strong><p>{escape(context["response"])}</p></div><p class="copy-status" role="status" aria-live="polite"></p></div>'


def check(label): return f'<label class="check"><input type="checkbox" data-check="{escape(label,quote=True)}"><span>{label}</span></label>'


PAGES = [
    ("00-setup.html","課前準備","開啟你的練習工作區","下載程式，和 Bob 一起準備開始。", "開始之前"),
    ("01-planning.html","需求規劃","這項需求會影響哪些程式？","從一個批次需求開始，練習看程式、問問題，再整理計畫。", "需求規劃"),
    ("02-documentation.html","COBOL 文件化","把程式讀懂，也讓下一個人看得懂","用 pp4z 解讀程式，再整理成方便查閱的文件。", "COBOL 文件化"),
    ("03-testing.html","測試與修正","換一筆資料，結果還對嗎？","從現有測試出發，看看正常、例外和重跑時的結果。", "測試與修正"),
    ("04-logs.html","主機紀錄與 IMS 事件","從紀錄確認程式做了什麼","先看自己的主機執行結果，再練習分析 IMS 事件。", "主機紀錄"),
    ("05-sast.html","查詢弱點修補","看懂問題，再動手修正","對照弱點報告與程式，修正查詢並檢查原本的功能。", "查詢弱點修補"),
    ("06-reference.html","成果與解答","回頭看看，你完成了什麼","比較文件、程式和測試結果，整理下一步想做的事。", "成果與解答"),
    ("07-help.html","常見問題","遇到問題時，可以這樣試","找不到檔案、模式或執行結果時，從這裡繼續。", "常見問題"),
    ("08-source-map.html","認識練習程式","接下來，還可以看哪些程式？","認識 CKP02、CIS14 與其他練習檔案。", "認識練習程式")
]



def content(name):
    import re
    body=(ROOT/'lessons'/name).read_text(encoding='utf-8')
    body=re.sub(r"\{\{check:(.*?)\}\}",lambda m:check(m[1]),body)
    links=''.join(f'<li>{escape(p.name)}</li>' for p in sorted((ROOT/'reference').glob('*')) if p.is_file())
    body=body.replace('{{references}}','<ul>'+links+'</ul>')
    return re.sub(r"\{\{([^|{}]+)\|([^|{}]+)\|([^{}]+)\}\}",lambda m:prompt(m[1],m[2],m[3]),body)


def render_page(title, body, prefix, active=None, eyebrow="IBM Bob · Workshop", description="", footer_nav=""):
    nav=''.join(f'<a {"aria-current=page" if p[0]==active else ""} href="{p[0]}">{i:02d}　{p[1]}</a>' for i,p in enumerate(PAGES)) if active else ''
    return f'''<!doctype html><html lang="zh-TW"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="{escape(description,quote=True)}"><title>IBM Bob - 合庫 workshop · 賦能 Z 開發</title><link rel="icon" type="image/svg+xml" href="{prefix}assets/bob-icon.svg"><link rel="alternate icon" href="{prefix}assets/bob-favicon.ico"><link rel="stylesheet" href="{prefix}assets/style.css"><script src="{prefix}assets/app.js" defer></script></head><body><a class="skip" href="#main">跳至主要內容</a><div class="utility">IBM Bob · 合作金庫 Workshop · 2026.09</div><header><a class="brand" href="{prefix}index.html">IBM <span>Bob</span></a><nav aria-label="主要導覽"><a href="{prefix}workshops/tcb/index.html">課程首頁</a><a href="{BASE}">GitHub ↗</a></nav></header><div class="layout {'with-side' if active else ''}">{f'<aside><p class="side-label">練習單元</p><nav aria-label="課程導覽">{nav}</nav><p class="progress" aria-live="polite"></p></aside>' if active else ''}<main id="main"><section class="hero"><p class="eyebrow">{eyebrow}</p><h1>{title}</h1><p class="lead">{description}</p></section><article>{body}</article>{footer_nav}</main></div><footer><p>合作金庫 IBM Bob Workshop</p><p>2026.09.21 / 09.24</p></footer></body></html>'''


def build():
    target=SITE/'workshops/tcb'; target.mkdir(parents=True,exist_ok=True)
    assets=SITE/'assets'; assets.mkdir(exist_ok=True)
    for name in ('style.css','app.js','bob-icon.svg','bob-favicon.ico'):
        (assets/name).write_bytes((ROOT/'web'/name).read_bytes())
    for i,(name,short,title,desc,eyebrow) in enumerate(PAGES):
        prev=f'<a href="{PAGES[i-1][0]}">← {PAGES[i-1][1]}</a>' if i else '<a href="index.html">← 課程首頁</a>'
        nxt=f'<a href="{PAGES[i+1][0]}">{PAGES[i+1][1]} →</a>' if i+1<len(PAGES) else '<a href="index.html">回課程首頁 →</a>'
        page=render_page(title,content(name),'../../',name,eyebrow,desc,f'<nav class="next" aria-label="前後單元">{prev}{nxt}</nav>')
        (target/name).write_text(page,encoding='utf-8',newline='\n')
    cards=''.join(f'<a class="card" href="{p[0]}"><span class="eyebrow">{i:02d}</span><h2>{p[1]}</h2><p>{p[3]}</p><span class="cta">開始學習 →</span></a>' for i,p in enumerate(PAGES))
    intro='''<p>接手一支不熟悉的程式、收到一項新需求，或拿到一份錯誤記錄時，你會從哪裡開始？這裡準備了幾個練習，帶你用自己的問題和 Bob 展開對話，再一步步完成文件與程式。</p><h2>下載練習程式</h2>'''
    intro+=f'<p><a class="cta" href="00-setup.html">下載程式並開始練習 →</a>　<a href="{BASE}/releases/latest">下載 ZIP ↗</a></p>'
    intro+='<h2>選擇練習單元</h2><div class="card-grid">'+cards+'</div>'
    (target/'index.html').write_text(render_page('合作金庫 IBM Bob 工作坊',intro,'../../',description='需求規劃、COBOL 文件、測試與問題排查',eyebrow='IBM Bob + pp4z · 2026.09.21 / 09.24'),encoding='utf-8',newline='\n')
    hub='<p>從熟悉的工作情境開始，練習用 Bob 閱讀程式、討論需求和檢查結果。</p><div class="card-grid"><a class="card" href="workshops/tcb/index.html"><span class="eyebrow">2026.09.21 / 09.24</span><h2>合作金庫工作坊</h2><p>從批次需求開始，再試試 COBOL 文件、測試與事件分析。</p><span class="cta">開始練習 →</span></a></div>'
    (SITE/'index.html').write_text(render_page('IBM Bob Workshop',hub,'',description='操作練習與範例程式'),encoding='utf-8',newline='\n')
    (SITE/'.nojekyll').write_text('',encoding='utf-8',newline='\n')
    print(f'Built {len(PAGES)+2} HTML pages')


if __name__=='__main__': build()
