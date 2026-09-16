# CKP02 主機練習

第 04 單元的獨立事件練習請另見 [IMS-EVENTS.md](IMS-EVENTS.md)：主機已備妥 IMSEVT／IMSEVTS，使用父子區段驗證 GNP、回復、受控中止與分段耗時。該作業的 CUT 刻意產生 U3001，不能套用本頁基準作業的成功條件。

這個練習在 z/OS 編譯並執行 CKP02，使用七筆合成資料比較第一次與第二次執行的結果，再確認空檔能正常結束。每項作業使用獨立暫存資料集。

開始前，先確認自己的主機連線可用，並備妥本場提供的作業名稱與配置值。操作步驟與對話範例請看 [課程網頁](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/03-testing.html#host)。

連線與帳號使用方式請看 [CONNECTION.md](CONNECTION.md)。將不含密碼的個人配置放在 host-lab/environment.md；Bob 應保留這份檔案。

在 Bob 對話中，可以先請它閱讀 `z-tests/fixtures.json` 和 CKP02，說明每筆資料應如何變化，再檢視自己的個人 JCL。`GENCKP` 建立測資，SNAP1、SNAP2 在每次轉換前保留實際輸入；`CHKCKP` 印出 BEFORE-ID、ACTUAL-ID、EXPECT-ID 並比較整筆 400 bytes；這兩支是練習的輔助程式。CKP02 本身沒有新增 log 或 IMS 呼叫。

主機已為自己的帳號準備好 `<帳號>.TCBLAB.COBOL` 的 CKP02、GENCKP、CHKCKP，以及 `<帳號>.TCBLAB.JCL(RUN)`。成員名稱對應教材中的同名程式與 run.jcl。CKP02 保留 z-lab/CKP02.cbl 的完整內容與中文註解；GENCKP、CHKCKP 來自 z-tests。既有三支來源以 IBM-937 準備，編譯採 CODEPAGE(937),DBCS；目前開啟、提交與讀取紀錄統一使用 tcb-rse（IBM-1371），不是要求學員切換字碼。

請依 [BOB-GUIDE.md](BOB-GUIDE.md) 第二節核對已備妥的個人作業，依第三節分析實際紀錄。以 tcb-rse 開啟 COBOL 成員，個人 host-lab/run.jcl 不包含在共用 ZIP；已有本機版本就沿用。僅在本機缺少檔案時，才依課程指引從自己的遠端 JCL(RUN) 下載一次。請 Bob 說明並核對後，再以 tcb-rse（IBM-1371）提交。不需要上傳程式、貼上測資或執行本機 Python。七筆測資與空檔由每項作業自動重新建立。

作業應依序完成配置、三支程式的編譯與連結、測資建立、第一次執行與比對、第二次執行與比對，以及空檔執行。編譯警告需要逐項核對，連結必須 RC 0；提交成功不等於作業成功。兩次比對各應顯示 `CHECKED=0007 ERRORS=0000`，且每筆完整 400 bytes 相同。

這版 CKP02 的實測編譯結果為 RC 4：清單包含序號欄位警告 `IGYLI0090-W`、對應摘要 `IGYSC0205-W`，以及 `IGYCB7310-W`，指出呼叫關檔段落的 PERFORM 不會返回。該段落以 `STOP RUN` 結束程式。三個連結與後續執行、比對步驟均為 RC 0；遇到不同警告或步驟未執行時，應先檢查清單。

所需環境：與來源相容的 Enterprise COBOL、LE、JES、可寫入的 DASD 資料集空間及個人工作權限。JCL 中的 compiler library、LE library、CLASS、MSGCLASS、UNIT 與帳務欄位須符合使用環境。INPUT1 使用定長 400-byte 資料集，不以 USS 文字檔取代。

若暫時無法連上主機，可先完成程式閱讀與本機實作。取得實際作業紀錄後，再補上主機執行結果。

GENERATE／PRINTDD 使用中文 IBM-937 測資，每筆以單一完整 400-byte 資料行印出；前後雙引號用來保留尾端空白，不屬於資料。中文包含雙位元字元與 SO／SI 控制碼，因此解碼後的字數、畫面欄號不等於主機 byte 位置。GENERATE／SYSOUT 另外顯示 CASE、ID 與 EOF-MARKER-AT-014=YES/NO，表示第 14–16 bytes 是否為 EOF；不直接印出可能切到半個中文字的三個 bytes。CASE 0003 為 YES，所以不轉換；CASE 0005 的 EOF 位於第 12–14 bytes，判斷為 NO，仍轉換。公司、姓名、地址及備註均為虛構中文；未知代碼留空，數字欄位保留數字。這是測資輸出，尚未實作需求中的預覽功能。

## 模擬資料的欄位與界線

欄位位置以 CKP02 的有效宣告為準，全部為 DISPLAY 欄位，共 400 bytes。fixtures.json 的 fields 逐欄列出內容，字串右側補空白；不再填入 Q 或在 FILLER 放案例編號。使用虛構中文名稱、地址及備註，以 IBM-937 的 byte 長度配置及補白，SO／SI 也計入長度。保留既有 400-byte 格式及 CKP02 程式，未改成 UTF-8 主機資料。

| 欄位 | byte 位置 | 本次模擬內容 |
|---|---|---|
| R-ID-1、R-ID-2 | 1–10、11 | 保留識別值轉換案例；用途未明的後綴留空白 |
| R-NAME | 12–51 | 虛構公司或客戶名稱；EOF 特例明確列為控制或邊界案例 |
| R-PID-1、R-PID-2 | 52–61、62 | 關聯識別資料未提供，留空白 |
| R-PNAME | 63–102 | 暫以虛構聯絡人名稱模擬，角色待業務字典確認 |
| R-ADR | 103–166 | 虛構台北地址，並非實際客戶地址 |
| R-BK1、R-BK2、R-BK3 | 167–208，各 14 | 未提供代碼定義，留空白，不杜撰銀行或帳號規則 |
| R-AC1、R-AC2、R-AC3 | 209–235，各 9 | PIC 9(9)，填九個 0；不推定為金額或筆數 |
| R-RJD | 236–243 | PIC 9(8)，一般案例暫以 YYYYMMDD 模擬；正式日期格式及意義待確認 |
| R-RJN | 244–249 | 代碼意義未明，留空白 |
| R-NOTE | 250–309 | 明示「課程虛構資料」，表示課程模擬資料 |
| FILLER | 310–400 | 全部空白 |

CASE 0001、0002 為一般格式模擬；CASE 0003–0007 分別保留 EOF 排除、重跑、鄰近位置 EOF、非數字識別值與空白識別值的回歸測試。CASE 0003 放在中間是刻意確認既有程式略過轉換後仍繼續讀取，不代表正式尾筆檔案配置。識別值沿用教學案例，未宣稱通過統編或身分證檢核。缺少完整客戶資料字典時，以上只能確認符合 PIC 與明示的模擬假設，不能宣稱已符合全部正式業務規則。

中英文紀錄統一從 tcb-rse（IBM-1371）開啟。異常時依 CONNECTION.md「讀取中文作業輸出」排查。

第 04 單元另有 RC 4 修正延伸練習。依 RC4-LAB.md 在 Ask 分析、Plan 討論、Agent 產生獨立 CKP02R；原版基準與修正版目標分開保留。原版報告存 host-lab/test-report.md，修正版報告存 host-lab/rc4/test-report.md。完整清單的前段及尾段訊息都需核對，不能只依第一段警告摘要判斷。

真實 IMS 延伸練習依 [IMS-LAB.md](IMS-LAB.md) 核對並提交遠端已備妥的 `<帳號>.TCBLAB.JCL(IMSRUN)`，本機 z-tests/ims-run.jcl 為相同內容的閱讀範本；獨立的 z-tests/IMSCKP.cbl 已備妥於遠端 COBOL(IMSCKP)，由 CIMS 讀取並編譯，成果另存 host-lab/ims。不需學員產生或上傳檔案。作業自動建立專用的 IMS 資料庫，由輔助程式匯出資料給原版 CKP02，再驗證更新、回復與提交後的查詢。原版 CKP02 本身仍沒有 DL/I 呼叫；不要把 IMS 輔助程式的功能寫成 CKP02 既有功能，也不要用 samples/logs 的虛構事件代替這次的實際紀錄。
