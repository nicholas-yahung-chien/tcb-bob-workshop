# 在 Bob 完成準備與測試

本流程使用 Bob 的檔案操作與系統既有工具，不執行 Python、不安裝 Python，也不另寫 Python 取代舊腳本。程式執行與資料比對由 z/OS 完成，Bob 負責準備、審閱與分析證據。

## 一、檢查已備妥的程式

1. 閱讀 SOURCE-MAP.md 與 source-manifest.json，確認 z-lab 中的 45 份 .cbl、.cpy、.asm 檔案存在，並確認 z-tests/fixtures.json、z-tests/run.jcl、根目錄 Zowe 設定與 schema 齊全。檔案已隨教材提供，不複製、不轉檔，也不新增另一套程式。
2. 使用系統既有雜湊工具（Windows 可用 Get-FileHash）核對 manifest 各 file 的 SHA-256。工具不可用時記錄「雜湊未驗證」，不能把閱讀內容當成完整性驗證。
3. 缺檔或雜湊不同時，列出路徑並請學員確認是否修改過；保留修改，不覆寫，也不自行補寫原始碼。需要還原時重新下載教材並解壓到另一個資料夾比較。
4. 保存 output/workspace-check.md，列出實際檢查方法、結果與未確認事項。請學員開啟 z-lab/CKP02.cbl，確認 pp4z 功能。檔案檢查不代表已登入主機或啟用 pp4z。

## 二、核對已備妥的個人 JCL

1. 先確認 host-lab/environment.md 存在；若不存在，請學員依 CONNECTION.md 的「建立個人作業配置」完成並核對後再繼續。核對帳號、來源連線 tcb-rse（IBM-937）、作業連線 tcb-jobs（IBM-1047）、來源成員、JCL 成員、job 名稱、volume 與 storage class，不得含待填文字。job 名稱是自己的帳號加 A；配置為 DEVVS1、SCNOSMS。有落差先指出，不猜替代值。
2. 課程已在每個帳號的 <帳號>.TCBLAB.COBOL 準備 CKP02、GENCKP、CHKCKP，在 <帳號>.TCBLAB.JCL 準備 RUN，兩個資料集皆為 PDSE、FB、LRECL=80。CKP02 來自 z-lab/CKP02.cbl，兩支輔助程式來自 z-tests 中的同名 .cbl。三支來源均以 IBM-937 傳輸，包含原始中文註解；這是內容編碼，不是資料集 CCSID 標籤。請學員開啟並核對，不要求上傳、貼上或重建來源。缺少成員時請講師協助，不覆寫已有修改。
3. 先使用現有的 host-lab/run.jcl，不要求重新下載。只有本機缺少這份檔案時，才請學員以 tcb-jobs 開啟自己 TCBLAB.JCL(RUN)，依課程網頁的收合指引下載一次。已有個人修改時保留，以本次要提交的版本核對。以 z-tests/run.jcl 核對這份 JCL：預設 TCBP001 已替換為個人 job 名稱，YOURUSER 已替換為自己的帳號。不要重新產生已備妥的作業，也不要自動提交。
4. CGEN、CCKP、CCHK 的 SYSIN 必須分別讀取自己的 TCBLAB.COBOL(GENCKP)、TCBLAB.COBOL(CKP02)、TCBLAB.COBOL(CHKCKP)，全部保留 CODEPAGE(937),DBCS。JCL 不內嵌任何一支 COBOL；教材來源不修改，不另存另一份 CKP02。
5. 確認 JCL 敘述不超過 72 欄，// 位置及 IF/ENDIF 配對正確。本次 JCL 使用英文註解，以 IBM-1047 提交；COBOL 原始中文註解仍保留。核對 IGY.V6R4M0.SIGYCOMP、CEE.SCEELKED、CEE.SCEERUN。保留每項作業獨立的 && 暫存資料集、FB 與 LRECL=400，不新增共用永久測資或 IMS 指令。GENCKP 會自動建立測資，不要求學員貼上測試資料。
6. 對照 z-tests/fixtures.json 的七筆 id、fields、once、twice，確認 GENCKP 建立測資、兩組預期與空檔；SNAP1 在 RUNONCE 前複製實際 &&WORK 至 &&BEFORE1，SNAP2 在 RUNTWICE 前複製當時的 &&WORK 至 &&BEFORE2；兩者都必須 RC 0 才進行該次轉換。CHECK1、CHECK2 的 BEFOREDD 分別讀取這兩份快照，不得使用原始測資或 EXPECTDD 代替。CHKCKP 同步讀取 before、actual、expected，檢查筆數與讀取狀態，並比對 actual 與 expected 的完整 400 bytes。不修改預期值來讓測試通過。
7. 將檢查證據存入 host-lab/jcl-review.md。可使用系統文字工具量測行長；未量測的項目如實標記。帶學員看編譯、連結、測資與測試步驟。預先配置不代表學員自己的這次作業已執行。

由學員在本機 host-lab/run.jcl 使用 tcb-jobs（IBM-1047）及 Submit as JCL 提交，記錄 job ID，再下載紀錄。

## 三、分析實際測試

讀取實際 run.jcl、z-tests/fixtures.json 與 host-lab/logs/<job ID>/ 的 JESMSGLG、JESYSMSG、CCKP/SYSPRINT、GENERATE/SYSOUT、GENERATE/PRINTDD、CHECK1/SYSOUT、CHECK2/SYSOUT。同名 DD 依 step 分開存放。缺檔時請學員下載，不能借用其他作業結果。

JES 系統紀錄以 tcb-jobs（IBM-1047）開啟；GENERATE/SYSOUT、GENERATE/PRINTDD、CHECK1/SYSOUT、CHECK2/SYSOUT 也以 tcb-jobs 開啟；CCKP/SYSPRINT 以 tcb-rse（IBM-937）開啟，再由編輯器另存新檔。整批下載入口可能未傳入 encoding；若中文失真，重新依此方式取得，不把失真內容當作程式事實。RSE 可能在 LF 前附帶 U+0085 NEL；分析時忽略該行末控制字元，保留原始檔案與欄位中的空白。若整理閱讀版，另存副本；不要為消除 NEL 而改用 IBM-1047，導致中文解碼錯誤。

- 記錄 owner、job 名稱、job ID 與紀錄時間。
- 核對 ALLOC、CGEN、LGENCKP、CCKP、LCKP02、CCHK、LCHKCKP、GENERATE、SNAP1、RUNONCE、CHECK1、SNAP2、RUNTWICE、CHECK2、RUNEMPTY 共 15 步是否實際執行。跳過的步驟不能算通過。
- 從 CCKP/SYSPRINT 確認 CODEPAGE(937)、DBCS，以及 SYSIN 對應自己 TCBLAB.COBOL(CKP02) 的來源。中文註解若顯示異常，先檢查該 DD 的解碼設定；不改整個作業連線，也不翻譯來源。
- CCKP 的 RC 4 須核對 IGYLI0090-W、IGYSC0205-W、IGYCB7310-W 及來源；不同訊息另列分析。其他 14 步應為 RC 0。
- CHECK1、CHECK2 各需七個不重複 CASE（0001–0007），每筆 PASS ALL 400 BYTES，結尾 CHECKED=0007 ERRORS=0000。BEFORE-ID 是該次轉換前的實際輸入；CHECK1 對照初始 id，CHECK2 應等於 CHECK1 的 ACTUAL-ID。ACTUAL-ID、EXPECT-ID 依檢查次數分別對照 once、twice，識別值以雙引號包住，保留引號內全部十個字元及尾端空白。
- 舊作業若沒有 SNAP1、SNAP2 或 BEFORE-ID，列為舊版紀錄，不能自行補出轉換前的實測值。
- RUNEMPTY 需有實際執行且 RC 0 的證據。空檔與資料中的 EOF 標記分別核對。
- 保存 host-lab/test-report.md，逐項列出預期、實際 step/DD/訊息與通過、失敗或待確認。失敗時先指出證據與最小修正；保留原始 log，重跑使用新 job ID。

Bob 的靜態檢查不能取代編譯與執行。這些紀錄也不是 IMS transaction log。沒有主機證據就保留待執行，不生成模擬成功紀錄。

GENERATE／PRINTDD 每筆以單一完整 400-byte 資料行印出，不切成多段；前後各加一個雙引號以保留 RSE 會省略的行尾空白，引號內恰好 400 bytes，引號不屬於資料。GENERATE／SYSOUT 另外顯示 CASE、ID 與 BYTES-014-016，分別用來辨認案例、第 1–10 位及第 14–16 位。若畫面自動折行，可關閉編輯器的自動換行並水平捲動。CASE 0003 的第 14–16 位為 EOF，因此不轉換；CASE 0005 的名稱以 EOF 開頭，EOF 位於第 12–14 位，第 14–16 位為 F 加兩個空白，仍符合轉換條件。測資採虛構公司名稱、聯絡人及地址，數字欄位填數字、保留欄位填空白；異常識別值與 EOF 列為邊界案例，不視為正常客戶資料。這是測資內容輸出，尚未實作需求中的預覽功能。
