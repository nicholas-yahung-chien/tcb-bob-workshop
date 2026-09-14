# 在 Bob 完成準備與測試

本流程使用 Bob 的檔案操作與系統既有工具，不執行 Python、不安裝 Python，也不另寫 Python 取代舊腳本。程式執行與資料比對由 z/OS 完成，Bob 負責準備、審閱與分析證據。

## 一、檢查已備妥的程式

1. 閱讀 SOURCE-MAP.md 與 source-manifest.json，確認 z-lab 中的 45 份 .cbl、.cpy、.asm 檔案存在，並確認 fixtures.json、templates/run.jcl、根目錄 Zowe 設定與 schema 齊全。檔案已隨教材提供，不複製、不轉檔，也不新增另一套程式。
2. 使用系統既有雜湊工具（Windows 可用 Get-FileHash）核對 manifest 各 file 的 SHA-256。工具不可用時記錄「雜湊未驗證」，不能把閱讀內容當成完整性驗證。
3. 缺檔或雜湊不同時，列出路徑並請學員確認是否修改過；保留修改，不覆寫，也不自行補寫原始碼。需要還原時重新下載教材並解壓到另一個資料夾比較。
4. 保存 output/workspace-check.md，列出實際檢查方法、結果與未確認事項。請學員開啟 z-lab/CKP02.cbl，確認 pp4z 功能。檔案檢查不代表已登入主機或啟用 pp4z。

## 二、建立個人 JCL

1. 先確認 host-lab/environment.md 存在；若不存在，請學員依 CONNECTION.md 的「建立個人作業配置」完成文件並核對後，再繼續，不猜測配置。讀取並核對帳號、來源連線 tcb-zosmf（IBM-937）、作業連線 tcb-jobs（IBM-1047）、來源資料集、job 名稱、volume 與 storage class，不得含待填文字。job 名稱必須以 TCB 開頭、共 4–8 個大寫英文字母或數字；缺少時先詢問。範本使用 DEVVS1、SCNOSMS，若配置不同，先指出落差，不猜替代值。
2. 確認學員已依課程網頁把 z-lab/CKP02.cbl 存入自己帳號的 <帳號>.TCBLAB.SRC937（PS、FB、LRECL=80），並以 tcb-zosmf 重新讀取核對；尚未確認時先帶學員完成此步。保留本機 UTF-8、LF 及中文註解；不翻譯、不另存 CKP02.cbl，不以 binary 模式上傳。這是文字傳輸編碼設定，不是替資料集加上 CCSID 標籤。
3. 從 templates/run.jcl 建立 host-lab/run.jcl，將第一行 TCBP001 換成個人 job 名稱，將 YOURUSER.TCBLAB.SRC937 換成自己的來源資料集；確認 HLQ 與登入帳號相同。已有檔案先比較，不覆寫學員成果。CCKP 的 SYSIN 必須讀取此資料集，並保留 CODEPAGE(937),DBCS；不得改回內嵌 CKP02。只有 GENCKP、CHKCKP 兩支測試輔助程式保留在 JCL 內，核對它們與 templates 中同名檔案一致，不必複製 .cbl 至 host-lab。
4. 確認每行不超過 72 欄，//、/* 位置及 IF/ENDIF 配對正確。核對編譯器 IGY.V6R4M0.SIGYCOMP、LE 的 CEE.SCEELKED 與 CEE.SCEERUN。保留作業獨立的 && 暫存資料集、FB 與 LRECL=400，不新增共用永久資料集或 IMS 指令。
5. 對照 fixtures.json 的七筆 id、marker_position、once、twice，確認 GENCKP 建立測資、兩組預期與空檔；CHKCKP 比對完整 400 bytes、筆數與讀取狀態。不修改預期值來讓測試通過。
6. 將變更與檢查證據存入 host-lab/jcl-review.md。可使用系統文字工具量測行長；未量測的項目如實標記。帶學員看編譯、連結、測資與測試步驟，不宣稱已在主機通過。

由學員使用 tcb-jobs（IBM-1047）連線及 Submit as JCL 提交，記錄 job ID，再下載紀錄。

## 三、分析實際測試

讀取實際 run.jcl、fixtures.json 與 host-lab/logs/<job ID>/ 的 JESMSGLG、JESYSMSG、CCKP/SYSPRINT、CHECK1/SYSOUT、CHECK2/SYSOUT。同名 DD 依 step 分開存放。缺檔時請學員下載，不能借用其他作業結果。

- 記錄 owner、job 名稱、job ID 與紀錄時間。
- 核對 ALLOC、CGEN、LGENCKP、CCKP、LCKP02、CCHK、LCHKCKP、GENERATE、RUNONCE、CHECK1、RUNTWICE、CHECK2、RUNEMPTY 共 13 步是否實際執行。跳過的步驟不能算通過。
- 從 CCKP/SYSPRINT 確認 CODEPAGE(937)、DBCS，以及 SYSIN 對應自己上傳的來源。中文註解若顯示異常，先檢查該 DD 的解碼設定；不改整個作業連線，也不翻譯來源。
- CCKP 的 RC 4 須核對 IGYLI0090-W、IGYSC0205-W、IGYCB7310-W 及來源；不同訊息另列分析。其他 12 步應為 RC 0。
- CHECK1、CHECK2 各需七個不重複 CASE（0001–0007），每筆 PASS ALL 400 BYTES，結尾 CHECKED=0007 ERRORS=0000。ACTUAL-ID、EXPECT-ID 分別對照 once、twice，保留值中的空白。
- RUNEMPTY 需有實際執行且 RC 0 的證據。空檔與資料中的 EOF 標記分別核對。
- 保存 host-lab/test-report.md，逐項列出預期、實際 step/DD/訊息與通過、失敗或待確認。失敗時先指出證據與最小修正；保留原始 log，重跑使用新 job ID。

Bob 的靜態檢查不能取代編譯與執行。這些紀錄也不是 IMS transaction log。沒有主機證據就保留待執行，不生成模擬成功紀錄。
