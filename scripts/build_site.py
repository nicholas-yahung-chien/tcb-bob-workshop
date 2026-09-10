"""Build an offline-friendly static workshop website; Python standard library only."""
from pathlib import Path
from html import escape
import json

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / "site"
BASE = "https://github.com/nicholas-yahung-chien/tcb-bob-workshop"
CLONE = f"git clone --single-branch --branch workshop/tcb-2026 {BASE}.git tcb-bob-workshop\ncd tcb-bob-workshop\npython scripts/preflight.py"


def code(text): return '<pre><code>'+escape(text)+'</code></pre>'


def prompt(stem, title, mode):
    text=(ROOT/"prompts"/(stem+".md")).read_text(encoding="utf-8")
    return f'<div class="prompt"><div class="prompt-head"><span>{escape(title)} · {mode}</span><button type="button" data-copy="{stem}">複製 Prompt</button></div><pre id="{stem}">{escape(text)}</pre><p class="copy-status" role="status" aria-live="polite"></p></div>'


def check(label): return f'<label class="check"><input type="checkbox" data-check="{escape(label,quote=True)}"><span>{label}</span></label>'


PAGES = [
    ("00-setup.html","課前準備","先把同一份素材準備好","版本一致，才能比較產出；先確認環境再進入實作。", "準備 · 5 分鐘"),
    ("01-planning.html","需求規劃","把一項需求，變成可執行的計畫","從合庫 CKP02 出發，交付 architecture.md 與 checklist.md。", "14:30–15:00 · Nicholas Chien"),
    ("02-documentation.html","COBOL 文件化","從讀懂程式，到留下可查證的文件","以 CKP02 為必做題，CIS14 為相依分析加深題。", "15:15–15:47 · Jackson Yang / Nicholas Chien"),
    ("03-testing.html","測試與修正","用測試確認 Bob 的實作","將規格落成可執行的行為模型，保留主機驗證的界線。", "15:47–16:02 · Nicholas Chien"),
    ("04-logs.html","IMS log 分析","先還原事件，再提出假設","用合成事件摘要練習證據、關聯與不確定性的表達。", "16:02–16:07 · 講師短示範"),
    ("05-sast.html","SAST 修補","從 finding 走到修補與回歸測試","以合成 SQL 注入題示範可檢查的修補流程。", "16:07–16:12 · 講師短示範"),
    ("06-reference.html","成果與備援","對照成果，完成最後一哩","先完成自己的實作，再用參考答案與人工規準核對。", "16:12–16:15 · 成果確認"),
    ("07-instructor.html","講師手冊","把時間留給學員實作","時間配置、Bob for Z 示範、故障處理與兩場重置流程。", "講師專用 · 課前演練"),
    ("08-source-map.html","程式素材地圖","由程式證據建立共同理解","合庫原始素材、相依關係、缺件與公開範例的邊界。", "45 份原始碼 · 延伸閱讀")
]


def content(name):
    if name=="00-setup.html":
        return '''<h2 id="ready">環境與版本</h2><p>兩場使用相同教材：2026/09/21（一）及 09/24（四），13:30–17:00。正式 agenda 排至16:45；16:45–17:00 尚未排定。本網站只承接 Nicholas 的30分鐘與共同授課60分鐘，入門及Q&amp;A由Haowen負責。</p>
<p>需要 Git、Python 3.10以上、已登入的Bob IDE或Bob Shell。Python只用標準庫，不需安裝套件；COBOL編譯器與主機連線不是必做題先備條件。Bob Shell製作基準為2.0.2，其他版本請先檢查help與模式名稱。</p>
<h2 id="download">取得本工作坊程式碼</h2>'''+f'<div class="prompt"><div class="prompt-head"><span>Windows / macOS / Linux 共用</span><button data-copy="clone">複製指令</button></div><pre id="clone">{escape(CLONE)}</pre><p class="copy-status" role="status"></p></div>'+'''
<p>若Windows沒有python指令，改用py -3。完成後以Bob開啟新資料夾，確認看得到AGENTS.md、bank-source/、samples/、specs/與prompts/。網路受限時，講師可提供同一版本ZIP，解壓後執行相同preflight。</p>
<h2 id="workspace">一個工作區，一個成果資料夾</h2><p>原始碼在bank-source/raw/，分析使用bank-source/reading/。所有學員新產出寫入output/。請保留來源、規格與驗收測試，不以修改測試來消除失敗。</p>
<p>用Ask先解釋、Plan先規劃、Agent再寫檔。Plan在不同版本可能限制可寫路徑，因此正式architecture.md與checklist.md由Agent統一落檔。</p>
<h2 id="shell">Shell替代操作</h2><p>可在IDE貼上頁面Prompt。使用Shell的講師可執行下列指令。非互動bob run會預先核准工具呼叫，請只在本次獨立clone執行；不要貼API key進Prompt或分享講師金鑰。</p>'''+code('bob --version\nbob run --help\nbob chat --mode ask')+code('powershell -File scripts/run-bob.ps1 -PromptFile prompts/01-ask.md -Mode ask')+'''
<p>macOS/Linux可用 <code>cat prompts/01-ask.md | bob run --mode ask --disable-mcp --disable-subagents</code>。本課程不依賴MCP，Premium功能另由Jackson帶領。</p>
<h2 id="check">開始前核對</h2>'''+check("preflight顯示45份原始碼與閱讀版hash通過")+check("Bob可回應，且工作區為本次clone")+check("已了解合成測試不是主機執行")+'''<p class="note">若登入、額度或網路受阻：先用reference/參考文件做來源核對，再由講師示範。不要因等待安裝而失去整段實作時間。</p>'''
    if name=="01-planning.html":
        return '''<h2 id="outcome">30分鐘，兩份可審查成果</h2><p>假設業務提出：「批次更新前，先告訴我會改幾筆；確認後才能套用。」這是教學假設，非合庫已核定需求。先讀CKP02實際行為，再規劃dry-run與統計，避免一開始就要求Bob修改整個主機系統。</p>
<table><thead><tr><th>時間</th><th>操作</th><th>完成證據</th></tr></thead><tbody><tr><td>14:30–14:33</td><td>開啟需求與原始碼</td><td>確認CR-01邊界</td></tr><tr><td>14:33–14:38</td><td>Ask：了解現況</td><td>REWRITE範圍及欄位對照</td></tr><tr><td>14:38–14:45</td><td>Plan：規劃七個領域</td><td>區分已知／提案／缺件</td></tr><tr><td>14:45–14:55</td><td>Agent：輸出兩份文件</td><td>architecture.md / checklist.md</td></tr><tr><td>14:55–15:00</td><td>驗收與討論</td><td>結構通過、人工核對</td></tr></tbody></table>
<h2 id="ask">Step 1 · 先理解現況</h2><p>不要把「將某些欄位改寫」等同於「只有這些筆數發生I/O」。CKP02的句點決定IF範圍，這會直接影響dry-run設計。</p>'''+prompt("01-ask","現況與欄位","Ask")+'''
<details><summary>預期回應與常見偏差</summary><p>CKP02每筆讀入記錄都REWRITE；資料內EOF只阻止欄位轉換。R-ID群組11 bytes；補白在第9–10位。IDSHIFT是合成純子程式，沒有I/O。若Bob聲稱R-ID只有10或EOF停止讀檔，要求重新引用來源。</p></details>
<h2 id="plan">Step 2 · Plan整理提案</h2><p>七項不是七套一定存在的系統，而是七個需要檢視的領域。Java、API、Database實作未提供時，應標未知並列負責確認的角色。</p>'''+prompt("02-plan","完整Implementation Plan","Plan")+'''
<h2 id="deliver">Step 3 · Agent落成文件</h2>'''+prompt("03-plan-deliver","輸出architecture與checklist","Agent")+'''
<h2 id="verify">Step 4 · 驗收</h2>'''+code('python scripts/verify.py plan')+'''<p>此命令檢查文件、七領域關鍵詞，以及 source-check 的欄位長度、EOF欄位、REWRITE範圍與重跑結果。還必須人工核對來源引用、缺件與部署回復可行性。</p>'''+check("architecture清楚區分As-is／To-be／缺件")+check("七項領域都有分析，不補造Java或API")+check("checklist含角色、驗收、依賴與回復")+check("未執行的部署與主機測試保持未完成")+'''
<p class="note">提示技巧：固定輸出路徑、限定來源、要求證據、指定未知的表達方式，比「請給我完整計畫」更容易驗收。做完即可休息，15:15回來接續文件化。</p>'''
    if name=="02-documentation.html":
        return '''<h2 id="route">這一段怎麼合作</h2><p>15:15–15:23由Jackson帶領Bob for Z功能示範（建議交接配置）；15:23–15:30 Ask理解COBOL與copybook/JCL；15:30–15:42產出文件；15:42–15:47檢閱impact。Nicholas提供本頁實作、驗收與後續測試銜接。</p>
<h2 id="z">Bob for Z · 示範與替代路徑</h2><p>已具Premium Package for Z的環境，由Jackson示範Z Code、Z Architect／Z Architecture（以當天版本顯示為準）、Explain與Impact Analysis。IBM文件列有<code>/explain</code>及<code>/impact-analysis</code>；只在已安裝對應功能的環境使用。</p><p>選定bank-source/reading/CKP02.TXT，說明入口、資料結構與變更影響；再切到CIS14展示copybooks。若語言工具不辨識.TXT，於output/z-demo/建立同內容.cbl/.cpy副本，保留原始碼。未具Premium者直接走Ask＋下列Prompt，完成相同文件驗收。</p>
<p class="note">本機Bob Shell演練只能證明一般Ask/Plan/Agent流程。Premium授權、Z Understand服務連線與Z專用指令需Jackson於課前實際核對；此網站不將它們列為已驗證。</p>
<h2 id="read">先讀一小段，建立精確理解</h2><p>打開CKP02第25–33、73–95行，核對400字元、REDEFINES、OPEN I-O及IF句點。CKP02沒有COPY；IDSHIFT的IDREC.cpy提供可獨立閱讀的COPY對照。CIS14則有實際PCB/SSA/segment copybooks。</p>
<p>JCL練習是samples/jcl/IDSHIFT.jcl骨架，EXEC的是合成TESTSHIFT。它不含CKP02正式DD配置，也不可直接提交主機；要問Bob「缺哪些site參數與證據」，而不是要求它假装編譯成功。</p>
<h2 id="document">Code to Document</h2>'''+prompt("04-document","程式文件與影響分析","Agent")+'''
<h2 id="review">驗收：文件可以漂亮，內容必須可追溯</h2>'''+code('python scripts/verify.py docs')+'''<p>facts.json將常錯的欄位事實固定成機器可核對的介面；evidence檢查引文與行號是否真的存在。程式不能替你判斷「該引文是否足以支持結論」，仍需人工看來源。</p>'''+check("program.md區分CKP02與合成IDSHIFT")+check("facts.json與三筆真實來源引文通過")+check("impact-analysis列直接影響、可能影響及缺件")+'''
<h2 id="cis14">加深題 · CIS14相依與流程</h2><p>時間充裕者課後執行。查詢客戶失敗是否一定不輸出？請讓Bob沿PROCESS-OK和PGM-OK判斷，讀到使用的copybooks，不以檔名猜測。</p>'''+prompt("06-customer-analysis","CIS14與CKP02深讀","Ask")+'''
<details><summary>講師核對提示</summary><p>CIS14輸入300、分行表80、輸出917/1109；GU/GNP透過CBLTDLI；XIDCHK與BRHIDCNV實作未提供。PROCESS-OK控制查詢、PGM-OK控制輸出。日期範圍檢查不是閏年檢核。沒有證據可將所有提供程式串成單一呼叫鏈。</p><p>實測曾發生日期算錯、把WORKING-STORAGE寫成LINKAGE、從未讀程式名稱猜用途。逐行核對，將錯誤連同09-repair交回Bob修正；20240229−10000=20230229，並非有效曆法日期。</p><a href="https://github.com/nicholas-yahung-chien/tcb-bob-workshop/blob/main/reference/customer-analysis.md">開啟講師審訂答案與精確狀態分支</a></details>'''
    if name=="03-testing.html":
        return '''<h2 id="goal">15分鐘的必做實作</h2><p>15:47–15:50閱讀介面與測試；15:50–15:58請Bob實作並執行；15:58–16:02核對結果或以修正Prompt處理失敗。此次新增的dry-run功能落在Python行為模型，原始CKP02保持不變。</p>
<p>model使用ASCII bytes：COBOL第14位是Python索引13。不要用Unicode中文字數驗證主機byte欄位，也不要把模型的written計數等同於CKP02的REWRITE次數。</p>
<table><thead><tr><th>輸入／模式</th><th>預期</th></tr></thead><tbody><tr><td>0012345678，無EOF</td><td>12345678加兩空白，尾390 bytes不變</td></tr><tr><td>14–16位是EOF</td><td>內容不變，批次仍處理下一筆</td></tr><tr><td>非00前綴</td><td>內容不變</td></tr><tr><td>4筆中2筆符合，dry-run</td><td>total=4, changed=2, written=0，回原資料副本</td></tr><tr><td>相同資料，write模型</td><td>changed=2, written=2，回轉換副本</td></tr><tr><td>非法長度或型別</td><td>ValueError，全批先驗證</td></tr></tbody></table>
<h2 id="build">Step 1 · 請Bob寫程式與測試</h2>'''+prompt("05-unit","從契約到測試","Agent")+'''
<h2 id="check">Step 2 · 獨立驗收</h2>'''+code('python scripts/verify.py unit')+'''<p>提供11個獨立測試方法，另要求學員產出至少3個測試。測試包含400 bytes全記錄比對、EOF位置偏一、尾端任意bytes、caller不變及重跑。不要用「程式跑完沒有錯」代替結果核對。</p>
<details><summary>為什麼要測重跑？</summary><p>0000123456第一次成為00123456加兩空白，仍以00開頭；第二次會再次改變。因此本規則不保證冪等，正式批次的重跑與備份回復必須先規劃。</p></details>
<h2 id="repair">Step 3 · 失敗就帶證據修正</h2>'''+prompt("09-repair","根據驗收修正","Agent")+check("11項契約測試與至少3項學員測試通過")+check("沒有修改tests或原始碼以通過測試")+check("test-report記錄實際結果並標示主機未驗證")+'''
<h2 id="cobol">延伸 · 真正COBOL測試driver</h2><p>具GnuCOBOL的個人練習環境可編譯合成IDSHIFT與TESTSHIFT。下列不是IBM Enterprise COBOL編譯指令，本次製作環境沒有COBOL編譯器，因此此路徑尚未實測。</p>'''+code('cobc -x -fixed -I samples/cobol -o output/testshift samples/cobol/TESTSHIFT.cbl samples/cobol/IDSHIFT.cbl\n# Windows: .\\output\\testshift.exe\n# macOS/Linux: ./output/testshift')+'''<p>正式主機單元測試由Jackson／平台團隊確認編譯器、JCL、執行程式庫、code page與測資後另行執行。</p>'''
    if name=="04-logs.html":
        return '''<h2 id="demo">5分鐘短示範，課後可完整實作</h2><p>1分鐘認識CSV、2分鐘送出Prompt、2分鐘核對三條時間線。若服務回應超過2分鐘，先展示reference/log-analysis.md，保留學員課後實作。</p><p>沒有收到真實IMS transaction log；本題使用教學者定義的已轉譯事件摘要，不能宣稱已解析原始IMS binary log。</p>
<h2 id="task">依事件證據分析</h2>'''+prompt("07-logs","時間線與根因假設","Agent")+'''
<h2 id="verify">對照結果</h2>'''+code('python scripts/verify.py logs')+'''<table><thead><tr><th>關聯ID</th><th>觀察</th><th>不能推論</th></tr></thead><tbody><tr><td>DEMO-A</td><td>E01–E03，GE後正常結束</td><td>不能只看GE就判失敗</td></tr><tr><td>DEMO-B</td><td>E04–E07，II、ROLB OK、失敗結束</td><td>不能直接判定重送或外部副作用已全回復</td></tr><tr><td>DEMO-C</td><td>E08耗時2500ms，沒有END</td><td>結束未知，不足以斷言死鎖</td></tr></tbody></table>'''+check("所有觀察可追到event_id")+check("根因假設與確定事實分開")+'''<p>真實場景先取得允許使用的log、轉譯方式、code page、時區、截取窗口、關聯鍵與狀態碼版本，再分析。原始log不在本次交付範圍。</p>'''
    if name=="05-sast.html":
        return '''<h2 id="flow">5分鐘短示範：finding → code → fix → test</h2><p>前1分鐘核對source/sink，中間2分鐘請Bob修補，最後2分鐘檢查測試與剩餘風險。合成finding為CWE-89 SQL注入，使用本機記憶體SQLite與虛構資料，不對銀行系統執行攻擊。</p>
<p>本題不是Fortify／Checkmarx實際掃描結果。用它練習接收報告後的處理方式：先證實資料流、最小修補、回歸測試、再交給正式工具複掃。</p>
<h2 id="fix">從報告修補</h2>'''+prompt("08-sast","SQL注入修補","Agent")+'''
<h2 id="test">驗收</h2>'''+code('python scripts/verify.py sast')+'''<p>6項測試驗證正常查詢、未知值、合法單引號、注入字串、表仍存在及參數綁定。正確修補應保留O’NEIL這類合法資料語意；把引號刪掉不是修補。</p>'''+check("source/sink可定位，參數透過binding傳入")+check("6項回歸測試通過")+check("報告明示正式SAST複掃待執行")+'''<p class="note">COBOL／HLASM finding必須對照實際報告與資料流。不能把無條件REWRITE直接稱為已證實的資安漏洞，也不能把本SQLite修補宣稱為合庫程式修補。</p>'''
    if name=="06-reference.html":
        links=''.join(f'<li><a href="{BASE}/blob/main/reference/{p.name}">{p.name}</a></li>' for p in sorted((ROOT/'reference').glob('*')) if p.is_file())
        report=(ROOT/'verification/report.md').read_text(encoding='utf-8') if (ROOT/'verification/report.md').exists() else '演練進行中，尚未發布通過結論。'
        return '''<h2 id="rubric">成果驗收規準</h2><p>採「可觀測成果一致」，不要求AI每次用相同文字。文件結構通過後，講師再用四項規準判斷是否可用。</p><ol><li>正確：400 bytes、11位群組、EOF與REWRITE範圍不誤判。</li><li>可追溯：每項來源事實有檔案與行號；引用真的支持結論。</li><li>可執行：清單有角色、依賴、測試與回復；不捏造已執行紀錄。</li><li>有界線：已知、提案、缺件分開，Python／主機／Premium／SAST驗證分開。</li></ol>
<h2 id="reference">參考答案</h2><p>先自行完成再展開。repo的reference/可離線閱讀；網站連結導向GitHub。</p><details><summary>開啟參考檔案清單</summary><ul>'''+links+'''</ul></details>
<h2 id="fallback">服務故障或時間不足</h2><p>在全新clone執行下列備援指令；遇到既有output會停止，以免覆蓋學員工作。備援答案是講師提供，不可標成新一次Bob成功生成。</p>'''+code('python scripts/restore-reference.py all\npython scripts/verify.py all')+'''
<h2 id="verification">實測紀錄</h2>'''+code(report)+'''
<h2 id="action">帶走一項行動計畫</h2><p>16:12–16:15填寫：下週要用Bob處理哪支程式？已有哪些來源？需要誰補哪份文件？第一個可驗收產出是什麼？把答案存到output/action-plan.md，16:15交回Haowen的Key Takeaway與Q&amp;A。</p>'''
    if name=="07-instructor.html":
        return '''<h2 id="schedule">授課安排</h2><table><thead><tr><th>時段</th><th>負責</th><th>現場成果</th></tr></thead><tbody><tr><td>13:30–14:30</td><td>Haowen</td><td>入門與安裝，本網站不重製該段</td></tr><tr><td>14:30–15:00</td><td>Nicholas</td><td>架構文件、實作清單</td></tr><tr><td>15:00–15:15</td><td>休息</td><td>保留output與工作區</td></tr><tr><td>15:15–15:23</td><td>Jackson主導，建議配置</td><td>Bob for Z / Explain示範</td></tr><tr><td>15:23–15:47</td><td>Jackson / Nicholas</td><td>COBOL理解、文件、impact</td></tr><tr><td>15:47–16:02</td><td>Nicholas</td><td>行為模型與單元測試</td></tr><tr><td>16:02–16:07</td><td>共同示範</td><td>合成IMS事件分析</td></tr><tr><td>16:07–16:12</td><td>共同示範</td><td>合成SAST修補</td></tr><tr><td>16:12–16:15</td><td>共同確認</td><td>成果與行動計畫</td></tr><tr><td>16:15–16:45</td><td>Haowen</td><td>Key Takeaway + Q&amp;A</td></tr><tr><td>16:45–17:00</td><td>尚未排定</td><td>需主辦方確認，不視為額外實作時間</td></tr></tbody></table>
<p>共授段內分工是本教材建議，需Jackson課前對齊；agenda只明定共同負責，未指定逐項講者。COBOL現代化是Optional，不占用必做驗收時間。</p>
<h2 id="before">課前核對</h2><ul><li>09/14最終名單由主辦方收齊；確認學員帳號、機器權限與網路，不在公開repo放名單。</li><li>09/18前與Jackson確認Premium授權、Z專用模式／指令及Z Understand連線；無法使用則採Ask替代。</li><li>兩場前一天以新clone跑preflight，確認Bob模型／版本／額度、同一教材commit與獨立工作目錄。</li><li>準備離線repo ZIP、reference答案及驗證紀錄；Python與Git預先安裝，不於30分鐘段臨時處理。</li><li>09/24重新clone，不沿用09/21的output；對照相同release與hash。</li></ul>
<h2 id="zprep">Bob for Z示範腳本</h2><ol><li>Jackson在已授權IDE確認Z Code與Z Architect／Architecture可選。</li><li>開啟CKP02閱讀副本；若需.cbl副檔名，在output/z-demo/建立副本，不更動bank-source。</li><li>執行已安裝的Explain能力，核對R-ID、IF句點、I/O；再展示CIS14的PCB與SSA。</li><li>示範Impact Analysis，將缺少JCL與外部程式的結果保留為未知。</li><li>收尾明示：Premium結果不自動等於已編譯或可安全上線。</li></ol>
<h2 id="recovery">現場處理</h2><table><thead><tr><th>狀況</th><th>處理</th></tr></thead><tbody><tr><td>服務兩分鐘無回應</td><td>短示範改開reference，必做題再等到五分鐘後評估備援</td></tr><tr><td>Plan不能寫指定路徑</td><td>保留對話或工具指定計畫，切Agent落檔</td></tr><tr><td>facts行號不符</td><td>確認UTF-8閱讀版與版本；讓Bob讀原行並修正引用</td></tr><tr><td>測試失敗</td><td>貼完整錯誤＋09-repair；只改output</td></tr><tr><td>時間落後</td><td>優先保住architecture/checklist與unit，log/SAST開參考成果示範</td></tr><tr><td>無Premium或主機</td><td>一般Ask/Agent完成核心題；保留主機待驗證項目</td></tr></tbody></table>
<h2 id="optional">Optional · 現代化提案</h2><p>課後請Bob依CR-01提出Java wrapper或API契約「提案」，逐項說明bytes/code page、錯誤、重跑與批次交易邊界。不能把新提案寫成既有系統，也不在現場直接更動主機資產。</p>
<h2 id="review">講師人工核對清單</h2>'''+check("來源與事實有逐項核對，AI第一版未直接當答案")+check("兩份計畫文件可審查、待辦未虛假勾選")+check("每位學員至少完成一個hands-on或明確採備援")+check("Premium、COBOL執行、真實log與正式SAST的限制已交代")
    if name=="08-source-map.html":
        return '''<h2 id="sources">原始素材與閱讀版</h2><p>使用者已確認合庫同意公開這批原始碼。bank-source/raw/保留原始bytes；reading/轉成UTF-8供閱讀，行數保持一致。SYSOCP31少數未能解碼的bytes以明確跳脫保留，不能當作字義已還原。</p>
<table><thead><tr><th>程式／資料</th><th>教學用途</th><th>已知界線</th></tr></thead><tbody><tr><td>CKP02</td><td>30分鐘需求規劃與文件必做題</td><td>400字元、每筆REWRITE，沒有COPY或IMS呼叫</td></tr><tr><td>CIS14與41份copybooks</td><td>IMS、PCB、SSA、欄位與影響分析</td><td>缺runtime、外部子程式、PSB/DBD、正式JCL</td></tr><tr><td>STANCVT</td><td>HLASM序號邊界延伸題</td><td>最大值回0000001，會改寫OLDSTAN；未見完整輸入檢核</td></tr><tr><td>SYSOCP31</td><td>訊息流程與缺件辨識</td><td>多份COPY及動態呼叫程式未提供</td></tr><tr><td>合成IDSHIFT與IDREC</td><td>純子程式及COPY對照</td><td>不是CKP02檔案I/O的完整替代</td></tr></tbody></table>
<h2 id="relations">相依關係：只畫有證據的線</h2><div class="flow"><span>CIS14</span><span>→ CBLTDLI / IMS</span><span>→ PCB、SSA、segment</span></div><p>CIS14另呼叫XIDCHK與BRHIDCNV，實作未提供。SYSOCP31呼叫STANGEN，不等於已證明它接到STANCVT。CKP02與其他提供程式間的串接關係未知。</p>
<h2 id="extension">延伸Prompt · HLASM</h2>'''+code('請只讀bank-source/reading/STANCVT.TXT。以行號解釋FFFFFFF回到哪個值、OLDSTAN是否改寫、RETCODE行為。分別推導0000009、000FFFF、FFFFFF9、FFFFFFF，並說明非法字元只有在被TR處理的位置才可能查到FF。不要宣稱已執行HLASM。')+'''
<h2 id="links">來源與產品文件</h2><ul>
<li><a href="https://github.com/nicholas-yahung-chien/tcb-bob-workshop/blob/main/docs/source-analysis.md">四支主程式的分析與選材理由</a></li>
<li><a href="https://github.com/nicholas-yahung-chien/tcb-bob-workshop/blob/main/docs/source-index.md">45份來源的 COPY、CALL 與資料群組索引</a></li>
<li><a href="https://hw.is-a.dev/ibm-bobathon/">參考Workshop Hub：網站層級、Prompt與成果對照方式</a></li>
<li><a href="https://github.com/howard-haowen/ibm-bobathon">參考repo：Carbon風格與單一工作坊下載</a></li>
<li><a href="https://bob.ibm.com/docs/shell/features/modes">IBM Bob Shell模式文件</a></li>
<li><a href="https://bob.ibm.com/docs/shell/getting-started/start-bobshell-non-interactive">IBM Bob Shell非互動執行與工具核准說明</a></li>
<li><a href="https://www.ibm.com/docs/en/bobz/3.0.0?topic=z-using-workflows-skills-tools-commands">IBM Bob Premium Package for Z工作流程與指令</a></li></ul>
<p>產品能力參考文件查閱於2026/09/10；版本與授權仍以課前實際環境為準。網站視覺與學習流程參考資深成員設計，文字、練習與工具另行編寫。</p>'''
    raise ValueError(name)


def shell(title, body, prefix, active=None, eyebrow="IBM Bob · Workshop", description="", footer_nav=""):
    nav=''.join(f'<a {"aria-current=page" if p[0]==active else ""} href="{p[0]}">{i:02d}　{p[1]}</a>' for i,p in enumerate(PAGES)) if active else ''
    return f'''<!doctype html><html lang="zh-TW"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="{escape(description,quote=True)}"><title>{escape(title.replace('<br>', ' '))} · 合庫 IBM Bob Workshop</title><link rel="stylesheet" href="{prefix}assets/style.css"><script src="{prefix}assets/app.js" defer></script></head><body><a class="skip" href="#main">跳至主要內容</a><div class="utility">IBM Bob · 合作金庫 Workshop · 2026.09</div><header><a class="brand" href="{prefix}index.html">IBM <span>Bob</span></a><nav aria-label="主要導覽"><a href="{prefix}workshops/tcb/index.html">課程首頁</a><a href="{BASE}">GitHub ↗</a></nav></header><div class="layout {'with-side' if active else ''}">{f'<aside><p class="side-label">本期教材</p><nav aria-label="課程導覽">{nav}</nav><p class="progress" aria-live="polite"></p></aside>' if active else ''}<main id="main"><section class="hero"><p class="eyebrow">{eyebrow}</p><h1>{title}</h1><p class="lead">{description}</p></section><article>{body}</article>{footer_nav}</main></div><footer><p>TCB × IBM Bob Workshop</p><p>課程內容由 Nicholas Chien 規劃，使用 Codex 與 IBM Bob Shell 協作製作及驗證。</p><p>參考 <a href="https://hw.is-a.dev/ibm-bobathon/">IBM Bob Workshop Hub</a> 的教學網站風格。</p></footer></body></html>'''


def build():
    target=SITE/'workshops/tcb'; target.mkdir(parents=True,exist_ok=True)
    assets=SITE/'assets'; assets.mkdir(exist_ok=True)
    for name in ('style.css','app.js'):
        (assets/name).write_bytes((ROOT/'web'/name).read_bytes())
    for i,(name,short,title,desc,eyebrow) in enumerate(PAGES):
        prev=f'<a href="{PAGES[i-1][0]}">← {PAGES[i-1][1]}</a>' if i else '<a href="index.html">← 課程首頁</a>'
        nxt=f'<a href="{PAGES[i+1][0]}">{PAGES[i+1][1]} →</a>' if i+1<len(PAGES) else '<a href="index.html">回課程首頁 →</a>'
        page=shell(title,content(name),'../../',name,eyebrow,desc,f'<nav class="next" aria-label="前後單元">{prev}{nxt}</nav>')
        (target/name).write_text(page,encoding='utf-8')
    cards=''.join(f'<a class="card" href="{p[0]}"><span class="eyebrow">{i:02d} / {p[4]}</span><h2>{p[1]}</h2><p>{p[3]}</p><span class="cta">開始學習 →</span></a>' for i,p in enumerate(PAGES))
    intro='''<div class="outcomes"><div><strong>01</strong><p>把需求變成計畫</p><span>architecture.md / checklist.md</span></div><div><strong>02</strong><p>把程式變成知識</p><span>program.md / impact-analysis.md</span></div><div><strong>03</strong><p>用測試確認成果</p><span>可執行模型 / 驗證紀錄</span></div></div><h2>取得本工作坊程式碼</h2>'''
    intro+=f'<div class="prompt"><div class="prompt-head"><span>同一份來源，同一套驗收</span><button data-copy="clone">複製指令</button></div><pre id="clone">{escape(CLONE)}</pre><p class="copy-status" role="status"></p></div>'
    intro+='<p>2026/09/21、09/24兩場內容相同。先完成課前準備，14:30從需求規劃開始；15:15接續COBOL文件與測試。IMS log／SAST為短示範與課後實作。</p><h2>課程教材</h2><div class="card-grid">'+cards+'</div>'
    (target/'index.html').write_text(shell('讀懂既有程式，<br>完成下一步改變。',intro,'../../',description='合庫 IBM Bob Workshop · 從主機程式出發，練習可查證的 Prompt、規劃與實作。',eyebrow='2026.09.21 / 09.24 · Nicholas Chien'),encoding='utf-8')
    hub='<p>以合作金庫提供的COBOL與HLASM範例為素材，搭配可直接複製的Prompt、實作契約與講師參考成果。</p><div class="card-grid"><a class="card" href="workshops/tcb/index.html"><span class="eyebrow">TCB · September 2026</span><h2>合作金庫工作坊</h2><p>需求規劃 · COBOL解讀與文件化 · 測試 · IMS事件與SAST練習</p><span class="cta">進入工作坊 →</span></a></div>'
    (SITE/'index.html').write_text(shell('IBM Bob Workshop Hub',hub,'',description='從熟悉的業務程式，開始一次能帶走成果的實作。'),encoding='utf-8')
    (SITE/'.nojekyll').write_text('',encoding='utf-8')
    print(f'Built {len(PAGES)+2} HTML pages')


if __name__=='__main__': build()
