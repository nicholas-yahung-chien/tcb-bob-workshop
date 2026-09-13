# 在 Bob 完成準備與測試

本流程使用 Bob 的檔案操作與系統既有工具，不執行 Python、不安裝 Python，也不另寫 Python 取代舊腳本。程式執行與資料比對由 z/OS 完成，Bob 負責準備、審閱與分析證據。

## 一、檢查教材與準備副本

1. 閱讀 SOURCE-MAP.md 與 bank-source/manifest.json，逐筆確認 raw、reading 各 45 份來源存在，並確認 fixtures.json、templates/run.jcl、根目錄 Zowe 設定與 schema 齊全。缺檔時請學員重新取得完整教材，不補寫原始碼。
2. 使用系統既有雜湊工具（Windows 可用 Get-FileHash）核對 raw 的 sha256 與 reading 的 reading_sha256。工具不可用時記錄「雜湊未驗證」，不能把閱讀內容當成完整性驗證。
3. 將 reading 的 TXT 複製至 output/z-lab，保留相對目錄與原始位元組。CKP02、CIS14 改為 .cbl；STANCVT、SYSOCP31 改為 .asm；其他改為 .cpy。已有相同副本則沿用，有差異則保留學員修改並說明，不覆寫。
4. 保存 output/workspace-check.md，列出來源與目標、實際檢查方法、結果和未確認事項。請學員開啟 output/z-lab/CKP02.cbl，確認 pp4z 功能。檔案檢查不代表已登入主機或啟用 pp4z。

## 二、建立個人 JCL

1. 先確認 output/host-lab/environment.md 存在；若不存在，請學員依 CONNECTION.md 的「建立個人作業配置」完成文件並核對後，再繼續，不猜測配置。讀取並核對帳號、Zowe 連線、job 名稱、volume 與 storage class，不得含待填文字。job 名稱必須以 TCB 開頭、共 4–8 個大寫英文字母或數字；缺少時先詢問。範本使用 DEVVS1、SCNOSMS，若配置不同，先指出落差，不猜替代值。
2. 複製 host-lab/templates 的三份 .cbl 和 run.jcl 至 output/host-lab，只將 JCL 第一行的 TCBP001 換成個人 job 名稱。已有檔案先比較，不覆寫學員成果。JCL 已內嵌來源，不需另外上傳程式。
3. 核對 CKP02 副本與銀行來源：只翻譯中文註解，執行敘述不變；核對 JCL 內嵌來源與副本。不要重新生成銀行邏輯。
4. 確認每行不超過 72 欄，//、/* 位置及 IF/ENDIF 配對正確。核對編譯器 IGY.V6R4M0.SIGYCOMP、LE 的 CEE.SCEELKED 與 CEE.SCEERUN。保留作業獨立的 && 暫存資料集、FB 與 LRECL=400，不新增共用永久資料集或 IMS 指令。
5. 對照 fixtures.json 的七筆 id、marker_position、once、twice，確認 GENCKP 建立測資、兩組預期與空檔；CHKCKP 比對完整 400 bytes、筆數與讀取狀態。不修改預期值來讓測試通過。
6. 將變更與檢查證據存入 output/host-lab/jcl-review.md。可使用系統文字工具量測行長；未量測的項目如實標記。帶學員看編譯、連結、測資與測試步驟，不宣稱已在主機通過。

由學員使用 Submit as JCL 提交，記錄 job ID，再下載紀錄。

## 三、分析實際測試

讀取實際 run.jcl、fixtures.json 與 output/host-lab/logs/<job ID>/ 的 JESMSGLG、JESYSMSG、CCKP/SYSPRINT、CHECK1/SYSOUT、CHECK2/SYSOUT。同名 DD 依 step 分開存放。缺檔時請學員下載，不能借用其他作業結果。

- 記錄 owner、job 名稱、job ID 與紀錄時間。
- 核對 ALLOC、CGEN、LGENCKP、CCKP、LCKP02、CCHK、LCHKCKP、GENERATE、RUNONCE、CHECK1、RUNTWICE、CHECK2、RUNEMPTY 共 13 步是否實際執行。跳過的步驟不能算通過。
- CCKP 的 RC 4 須核對 IGYLI0090-W、IGYSC0205-W、IGYCB7310-W 及來源；不同訊息另列分析。其他 12 步應為 RC 0。
- CHECK1、CHECK2 各需七個不重複 CASE（0001–0007），每筆 PASS ALL 400 BYTES，結尾 CHECKED=0007 ERRORS=0000。ACTUAL-ID、EXPECT-ID 分別對照 once、twice，保留值中的空白。
- RUNEMPTY 需有實際執行且 RC 0 的證據。空檔與資料中的 EOF 標記分別核對。
- 保存 output/host-lab/test-report.md，逐項列出預期、實際 step/DD/訊息與通過、失敗或待確認。失敗時先指出證據與最小修正；保留原始 log，重跑使用新 job ID。

Bob 的靜態檢查不能取代編譯與執行。這些紀錄也不是 IMS transaction log。沒有主機證據就保留待執行，不生成模擬成功紀錄。
