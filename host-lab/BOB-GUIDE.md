# 在 Bob 完成準備與測試

本流程使用 Bob 的檔案操作與系統既有工具，不執行 Python、不安裝 Python，也不另寫 Python 取代舊腳本。程式執行與資料比對由 z/OS 完成，Bob 負責準備、審閱與分析證據。

## 一、檢查已備妥的程式

1. 閱讀 SOURCE-MAP.md 與 source-manifest.json，確認 z-lab 中的 45 份 .cbl、.cpy、.asm 檔案存在，並確認 z-tests 的 GENCKP.cbl、CHKCKP.cbl、fixtures.json、run.jcl、manifest.json，以及根目錄 Zowe 設定與 schema 齊全。檔案已隨教材提供，不複製、不轉檔，也不新增另一套程式。
2. 使用系統既有雜湊工具（Windows 可用 Get-FileHash）依 source-manifest.json 核對 z-lab 各 file 的 SHA-256，並依 z-tests/manifest.json 的 sha256 核對清單中的輔助程式與 JCL，包含 IMSCKP 及 IMS 作業範本。工具不可用時記錄「雜湊未驗證」，不能把閱讀內容當成完整性驗證。
3. 缺檔或雜湊不同時，列出路徑並請學員確認是否修改過；保留修改，不覆寫，也不自行補寫原始碼。需要還原時重新下載教材並解壓到另一個資料夾比較。
4. 保存 output/workspace-check.md，列出實際檢查方法、結果與未確認事項。請學員開啟 z-lab/CKP02.cbl，確認 PPZ 功能。檔案檢查不代表已登入主機或啟用 PPZ。

## 二、核對已備妥的個人 JCL

1. 先確認 host-lab/environment.md 存在；若不存在，請學員依 CONNECTION.md 的「建立個人作業配置」完成並核對後再繼續。核對帳號、來源連線 tcb-rse（IBM-1371）、作業連線 tcb-rse（IBM-1371）、來源成員、JCL 成員、job 名稱、volume 與 storage class，不得含待填文字。job 名稱是自己的帳號加 A；配置為 DEVVS1、SCNOSMS。有落差先指出，不猜替代值。
2. 課程已在每個帳號的 <帳號>.TCBLAB.COBOL 準備 CKP02、GENCKP、CHKCKP，在 <帳號>.TCBLAB.JCL 準備 RUN，兩個資料集皆為 PDSE、FB、LRECL=80。CKP02 來自 z-lab/CKP02.cbl，兩支輔助程式來自 z-tests 中的同名 .cbl。三支來源均以 IBM-937 傳輸，包含原始中文註解；這是內容編碼，不是資料集 CCSID 標籤。請學員開啟並核對，不要求上傳、貼上或重建來源。缺少成員時請講師協助，不覆寫已有修改。
3. 教材不含個人化的 host-lab/run.jcl；已有本機個人版本就沿用，不要求重新下載。只有本機缺少這份檔案時，才請學員以 tcb-rse 開啟自己 TCBLAB.JCL(RUN)，依課程網頁的收合指引下載一次。已有個人修改時保留，以本次要提交的版本核對。以 z-tests/run.jcl 核對這份 JCL：預設 TCBP001 已替換為個人 job 名稱，YOURUSER 已替換為自己的帳號。不要重新產生已備妥的作業，也不要自動提交。
4. CGEN、CCKP、CCHK 的 SYSIN 必須分別讀取自己的 TCBLAB.COBOL(GENCKP)、TCBLAB.COBOL(CKP02)、TCBLAB.COBOL(CHKCKP)，全部保留 CODEPAGE(937),DBCS。JCL 不內嵌任何一支 COBOL；教材來源不修改，不另存另一份 CKP02。
5. 確認 JCL 敘述不超過 72 欄，// 位置及 IF/ENDIF 配對正確。提交統一使用 tcb-rse（IBM-1371）；保留教材既有註解，不要求為了字碼刪除或翻譯中文。核對 IGY.V6R4M0.SIGYCOMP、CEE.SCEELKED、CEE.SCEERUN。保留每項作業獨立的 && 暫存資料集、資料測試檔為 FB、LRECL=400；PRINTDD 為 FB、LRECL=402（前後各一個雙引號），不新增共用永久測資或 IMS 指令。GENCKP 會自動建立測資，不要求學員貼上測試資料。
6. 對照 z-tests/fixtures.json 的七筆 id、fields、once、twice，確認 GENCKP 建立測資、兩組預期與空檔；SNAP1 在 RUNONCE 前複製實際 &&WORK 至 &&BEFORE1，SNAP2 在 RUNTWICE 前複製當時的 &&WORK 至 &&BEFORE2；兩者都必須 RC 0 才進行該次轉換。CHECK1、CHECK2 的 BEFOREDD 分別讀取這兩份快照，不得使用原始測資或 EXPECTDD 代替。CHKCKP 同步讀取 before、actual、expected，檢查筆數與讀取狀態，並比對 actual 與 expected 的完整 400 bytes。不修改預期值來讓測試通過。
7. 將檢查證據存入 host-lab/jcl-review.md。可使用系統文字工具量測行長；未量測的項目如實標記。帶學員看編譯、連結、測資與測試步驟。預先配置不代表學員自己的這次作業已執行。

由學員在本機 host-lab/run.jcl 使用 tcb-rse（IBM-1371）及 Submit as JCL 提交，記錄 job ID，再下載紀錄。

## 三、分析實際測試

優先列出並讀取學員實際加入的紀錄資料夾，確認工作區相對路徑、job ID 與內部檔名。host-lab/logs/<job ID>/ 只是建議保存位置；例如工作區根目錄的 JOB01024/ 也可直接分析，不要求搬移或重新下載。附件無法解析時先查工作區根目錄及使用者明示的位置；未找到才請學員提供位置，不能只查預設目錄就宣稱附件不存在。

搭配實際 run.jcl、z-tests/fixtures.json，讀取同一作業的 JESMSGLG、JESJCL、JESYSMSG、CGEN/SYSPRINT、CCKP/SYSPRINT、GENERATE/SYSOUT、GENERATE/PRINTDD、CHECK1/SYSOUT、CHECK2/SYSOUT。同名 DD 依 step 分開辨識；已修正轉碼的副本須註明來源，保留原下載檔。確認實際缺檔後再請學員補充，不能借用其他作業結果。

使用 JOB 右鍵選單的「全部下載」取得 JES、SYSOUT、PRINTDD 與編譯清單。確認中文與換行正常，保留欄位空白；個別檔案異常時依下方排查指引補存。

- 記錄 owner、job 名稱、job ID 與紀錄時間。
- 核對 ALLOC、CGEN、LGENCKP、CCKP、LCKP02、CCHK、LCHKCKP、GENERATE、SNAP1、RUNONCE、CHECK1、SNAP2、RUNTWICE、CHECK2、RUNEMPTY 共 15 步是否實際執行。跳過的步驟不能算通過。
- 從 CCKP/SYSPRINT 確認 CODEPAGE(937)、DBCS，以及 SYSIN 對應自己 TCBLAB.COBOL(CKP02) 的來源。中文註解若顯示異常，先檢查該 DD 的解碼設定；不改整個作業連線，也不翻譯來源。
- 讀完 CCKP 編譯清單的開頭、結尾與各階段訊息摘要，並搜尋全檔診斷代碼。工具若只顯示前段或輸出被截斷，分段讀到最後一行，再判斷訊息是否存在。第一段 Messages 統計不是整份編譯清單的總結。
- 原版 CCKP 的 RC 4 須核對 IGYLI0090-W、IGYSC0205-W、IGYCB7310-W 及來源；不同訊息另列分析。逐項記錄訊息代碼、出現位置、對應程式行或編譯選項、根因與影響；IGYSC0205-W 是前段警告的摘要提醒，請回頭核對前面的詳細警告。只有完整搜尋後才能寫「未出現」，檔案不完整則記「待確認」。其他 14 步應為 RC 0。
- CHECK1、CHECK2 各需七個不重複 CASE（0001–0007），每筆 PASS ALL 400 BYTES，結尾 CHECKED=0007 ERRORS=0000。BEFORE-ID 是該次轉換前的實際輸入；CHECK1 對照初始 id，CHECK2 應等於 CHECK1 的 ACTUAL-ID。ACTUAL-ID、EXPECT-ID 依檢查次數分別對照 once、twice，識別值以雙引號包住，保留引號內全部十個字元及尾端空白。
- 若作業紀錄沒有 SNAP1、SNAP2 或 BEFORE-ID，先核對 JCL 版本，並在報告註明缺少轉換前的資料。
- RUNEMPTY 需有實際執行且 RC 0 的證據。空檔與資料中的 EOF 標記分別核對。
- 保存 host-lab/test-report.md，逐項列出預期、實際 step/DD/訊息與通過、失敗或待確認。失敗時先指出證據與最小修正；保留原始 log，重跑使用新 job ID。

Bob 的靜態檢查不能取代編譯與執行。這些紀錄也不是 IMS transaction log。尚未執行的部分，先記下預期結果，待主機執行後補上。

GENERATE／PRINTDD 使用中文 IBM-937 測資，每筆以單一完整 400-byte 資料行印出；前後雙引號用來保留尾端空白，不屬於資料。中文包含雙位元字元與 SO／SI 控制碼，因此解碼後的字數、畫面欄號不等於主機 byte 位置。GENERATE／SYSOUT 另外顯示 CASE、ID 與 EOF-MARKER-AT-014=YES/NO，表示第 14–16 bytes 是否為 EOF；不直接印出可能切到半個中文字的三個 bytes。CASE 0003 為 YES，所以不轉換；CASE 0005 的 EOF 位於第 12–14 bytes，判斷為 NO，仍轉換。公司、姓名、地址及備註均為虛構中文；未知代碼留空，數字欄位保留數字。這是測資輸出，尚未實作需求中的預覽功能。

## 讀取中文作業輸出

使用 tcb-rse（IBM-1371），在「工作」對自己的 JOB 按右鍵選「全部下載」，保存完整紀錄，例如 host-lab/logs/<job ID>/。保留下載產生的檔名與目錄結構，不選「以二進位全部下載」。開啟下載的 PRINTDD 與編譯清單，確認中文、換行及雙引號內的空白正常；若個別檔案有亂碼，再從 tcb-rse 開啟該 DD，載入全部內容並另存 UTF-8 副本。Alt+Z 可切換畫面自動折行。

若仍顯示舊的異常內容，關閉舊分頁並執行 Developer: Reload Window，再從 tcb-rse 開啟。仍有問題時，可由講師使用已安裝的官方 RSE CLI 指定字碼重新讀取；JOB12345 與 108 必須替換為實際 job ID 與 DD 編號：

```powershell
zowe rse view spool-file-by-id JOB12345 108 --rse-profile tcb-rse --encoding IBM-1371
```

這是排查用替代步驟，不是每項作業的必要前置操作。若下載時已發生錯誤轉碼，單純更換本機開啟編碼無法還原中文；請從 tcb-rse 開啟受影響的 DD，確認文字正常並載入所有頁面後，另存 UTF-8 副本。正常的下載檔可直接使用。編譯仍依教材使用 CODEPAGE(937),DBCS。

若學員選做消除 RC 4 的練習，依 RC4-LAB.md 另存 CKP02R 與個人修正版 JCL；原版基準的 RC 預期與修正版目標分開記錄。

若加入的是第 04 單元 IMS 資料庫練習的作業，改依 IMS-LAB.md 核對，結果另存 host-lab/ims/test-report.md。IMS 作業有自己的步驟，不能套用上述基準作業的 15 步清單。


IMSEVTS 是獨立的 IMS 事件練習，請依 host-lab/IMS-EVENTS.md 與 specs/log-schema.md 核對，閱讀 z-tests/IMSEVT.cbl、z-tests/imsevts.jcl。不要套用 IMSRUN 的步驟清單：IMSEVTS 共 17 步，16 步 RC 0，只有 CUT 預期 U3001，且 CHECKA 必須執行。報告另存 host-lab/ims/events-report.md；只提供部分紀錄時保留待確認，補齊後更新結論。
