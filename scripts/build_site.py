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
    return f'<p class="mode-guide">在Bob模式選單選取 <strong>{escape(mode)}</strong>，用 @ 加入下方Prompt列出的檔案，再貼上內容送出。</p><div class="prompt"><div class="prompt-head"><span>{escape(title)} · {mode}</span><button type="button" data-copy="{stem}">複製 Prompt</button></div><pre id="{stem}">{escape(text)}</pre><p class="copy-status" role="status" aria-live="polite"></p></div>'


def check(label): return f'<label class="check"><input type="checkbox" data-check="{escape(label,quote=True)}"><span>{label}</span></label>'


PAGES = [
    ("00-setup.html","課前準備","先把同一份素材準備好","版本一致，才能比較產出；先確認環境再進入實作。", "準備 · 5 分鐘"),
    ("01-planning.html","需求規劃","把一項需求，變成可執行的計畫","從合庫 CKP02 出發，交付 architecture.md 與 checklist.md。", "14:30–15:00 · 需求規劃"),
    ("02-documentation.html","COBOL 文件化","從讀懂程式，到留下可查證的文件","以 CKP02 為必做題，CIS14 為相依分析加深題。", "15:15–15:47 · pp4z 文件化"),
    ("03-testing.html","測試與修正","用測試確認 Bob 的實作","將規格落成可執行的行為模型，保留主機驗證的界線。", "15:47–16:02 · 測試與修正"),
    ("04-logs.html","IMS log 分析","先還原事件，再提出假設","用合成事件摘要練習證據、關聯與不確定性的表達。", "16:02–16:07 · 實作練習"),
    ("05-sast.html","SAST 修補","從 finding 走到修補與回歸測試","以合成 SQL 注入題示範可檢查的修補流程。", "16:07–16:12 · 實作練習"),
    ("06-reference.html","成果與解答","檢查成果，帶走實作方法","先完成自己的實作，再用參考答案與檢查規準核對。", "16:12–16:15 · 成果確認"),
    ("07-help.html","常見問題","順利完成每一步","處理檔案上下文、模式、權限與驗收問題。", "操作協助"),
    ("08-source-map.html","程式素材地圖","由程式證據建立共同理解","合庫原始素材、相依關係、缺件與公開範例的邊界。", "45 份原始碼 · 延伸閱讀")
]


def content(name):
    import re
    body=(ROOT/'lessons'/name).read_text(encoding='utf-8')
    body=re.sub(r"\{\{check:(.*?)\}\}",lambda m:check(m[1]),body)
    links=''.join(f'<li><a href="{BASE}/blob/workshop/tcb-2026/reference/{p.name}">{p.name}</a></li>' for p in sorted((ROOT/'reference').glob('*')) if p.is_file())
    body=body.replace('{{references}}','<ul>'+links+'</ul>')
    return re.sub(r"\{\{([^|{}]+)\|([^|{}]+)\|([^{}]+)\}\}",lambda m:prompt(m[1],m[2],m[3]),body)


def render_page(title, body, prefix, active=None, eyebrow="IBM Bob · Workshop", description="", footer_nav=""):
    nav=''.join(f'<a {"aria-current=page" if p[0]==active else ""} href="{p[0]}">{i:02d}　{p[1]}</a>' for i,p in enumerate(PAGES)) if active else ''
    return f'''<!doctype html><html lang="zh-TW"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="{escape(description,quote=True)}"><title>{escape(title.replace('<br>', ' '))} · 合庫 IBM Bob Workshop</title><link rel="stylesheet" href="{prefix}assets/style.css"><script src="{prefix}assets/app.js" defer></script></head><body><a class="skip" href="#main">跳至主要內容</a><div class="utility">IBM Bob · 合作金庫 Workshop · 2026.09</div><header><a class="brand" href="{prefix}index.html">IBM <span>Bob</span></a><nav aria-label="主要導覽"><a href="{prefix}workshops/tcb/index.html">課程首頁</a><a href="{BASE}">GitHub ↗</a></nav></header><div class="layout {'with-side' if active else ''}">{f'<aside><p class="side-label">本期教材</p><nav aria-label="課程導覽">{nav}</nav><p class="progress" aria-live="polite"></p></aside>' if active else ''}<main id="main"><section class="hero"><p class="eyebrow">{eyebrow}</p><h1>{title}</h1><p class="lead">{description}</p></section><article>{body}</article>{footer_nav}</main></div><footer><p>合作金庫 IBM Bob Workshop</p><p>2026.09.21 / 09.24</p></footer></body></html>'''


def build():
    target=SITE/'workshops/tcb'; target.mkdir(parents=True,exist_ok=True)
    assets=SITE/'assets'; assets.mkdir(exist_ok=True)
    for name in ('style.css','app.js'):
        (assets/name).write_bytes((ROOT/'web'/name).read_bytes())
    for i,(name,short,title,desc,eyebrow) in enumerate(PAGES):
        prev=f'<a href="{PAGES[i-1][0]}">← {PAGES[i-1][1]}</a>' if i else '<a href="index.html">← 課程首頁</a>'
        nxt=f'<a href="{PAGES[i+1][0]}">{PAGES[i+1][1]} →</a>' if i+1<len(PAGES) else '<a href="index.html">回課程首頁 →</a>'
        page=render_page(title,content(name),'../../',name,eyebrow,desc,f'<nav class="next" aria-label="前後單元">{prev}{nxt}</nav>')
        (target/name).write_text(page,encoding='utf-8',newline='\n')
    cards=''.join(f'<a class="card" href="{p[0]}"><span class="eyebrow">{i:02d} / {p[4]}</span><h2>{p[1]}</h2><p>{p[3]}</p><span class="cta">開始學習 →</span></a>' for i,p in enumerate(PAGES))
    intro='''<div class="outcomes"><div><strong>01</strong><p>把需求變成計畫</p><span>architecture.md / checklist.md</span></div><div><strong>02</strong><p>把程式變成知識</p><span>program.md / impact-analysis.md</span></div><div><strong>03</strong><p>用測試確認成果</p><span>可執行模型 / 驗證紀錄</span></div></div><h2>下載教材並開啟工作區</h2>'''
    intro+=f'<p><a class="cta" href="00-setup.html">使用VSCode的Git: Clone開始 →</a>　<a href="{BASE}/releases/latest">下載教材ZIP ↗</a></p>'
    intro+='<p>2026/09/21、09/24兩場內容相同。先完成課前準備，14:30從需求規劃開始；15:15接續COBOL文件與測試。在Bob對話面板完成Prompt與成果檢查。</p><h2>課程教材</h2><div class="card-grid">'+cards+'</div>'
    (target/'index.html').write_text(render_page('讀懂既有程式，<br>完成下一步改變。',intro,'../../',description='合庫 IBM Bob Workshop · 從主機程式出發，練習可查證的 Prompt、規劃與實作。',eyebrow='2026.09.21 / 09.24 · Bob in VSCode + pp4z'),encoding='utf-8',newline='\n')
    hub='<p>以合作金庫提供的COBOL與HLASM範例為素材，搭配可直接複製的Prompt、操作步驟與參考解答。</p><div class="card-grid"><a class="card" href="workshops/tcb/index.html"><span class="eyebrow">TCB · September 2026</span><h2>合作金庫工作坊</h2><p>需求規劃 · COBOL解讀與文件化 · 測試 · IMS事件與SAST練習</p><span class="cta">進入工作坊 →</span></a></div>'
    (SITE/'index.html').write_text(render_page('IBM Bob Workshop Hub',hub,'',description='從熟悉的業務程式，開始一次能帶走成果的實作。'),encoding='utf-8',newline='\n')
    (SITE/'.nojekyll').write_text('',encoding='utf-8',newline='\n')
    print(f'Built {len(PAGES)+2} HTML pages')


if __name__=='__main__': build()
