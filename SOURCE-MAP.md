# 練習檔案說明

先從 `z-lab/CKP02.cbl` 看起，需要延伸閱讀時，再搭配 samples 裡的 IDSHIFT 比較。CKP02 會讀取和回寫檔案，IDSHIFT 則處理傳入的記憶體記錄。

## 原始程式與閱讀版

教材已在 z-lab 提供 45 份程式與相依檔案，使用 .cbl、.cpy、.asm 副檔名。source-manifest.json 記錄每份檔案的 SHA-256，供完整性核對。教材檔案使用 UTF-8 與 LF 換行；封裝時僅統一換行，不翻譯註解或改寫程式。主機已將同一份 z-lab/CKP02.cbl 以 IBM-937 備妥於自己的 TCBLAB.COBOL(CKP02)，學員直接開啟並核對，不需要上傳。

SYSOCP31 有少量無法以 CP950 解碼的 bytes，閱讀版以反斜線 x 序列保留標示。若要在主機編譯，仍需使用正確編碼的原始來源及對應設定。

## 範例與規格

| 路徑 | 可以用來做什麼 |
|---|---|
| samples/cobol/IDSHIFT.cbl | 閱讀 400 bytes 記錄的轉換子程式 |
| samples/cobol/IDREC.cpy | 查看識別欄位、附加碼和其餘資料的定義 |
| samples/cobol/TESTSHIFT.cbl | 從正常轉換與 EOF 案例開始補測試 |
| samples/jcl/IDSHIFT.jcl | 認識測試作業的 JCL；執行前要填入環境設定 |
| samples/python/normalizer.py | 依需求完成本機轉換範例 |
| samples/python/customer_lookup.py | 練習找出及修正 SQL 注入 |
| samples/logs/ims-events.csv | 閱讀合成的 IMS 事件摘要 |
| host-lab/CONNECTION.md | 以個人帳號透過 IBM RSE API 連接主機，來源、JCL 與中英文作業紀錄統一透過 tcb-rse（IBM-1371）讀取 |
| host-lab/BOB-GUIDE.md | 請 Bob 檢查教材、準備個人 JCL 並核對主機紀錄 |
| host-lab/RC4-LAB.md | 選做：分析編譯警告，另存 CKP02R 修正版，再以新作業驗證 |
| host-lab/IMS-LAB.md | 選做：以作業專用的 IMS DL/I 資料庫串接原版 CKP02，驗證更新、回復與提交 |
| z-tests/IMSCKP.cbl | 遠端 TCBLAB.COBOL(IMSCKP) 的同一份來源，負責教學用 IMS 資料載入、查詢、更新、回復與提交 |
| z-tests/ims-run.jcl | 與遠端已備妥的 TCBLAB.JCL(IMSRUN) 相同；CIMS 讀取 COBOL(IMSCKP)，DBD 與 PSB 定義仍內嵌，不是客戶既有 IMS 定義 |
| z-tests/ | 主機測試用的 GENCKP、CHKCKP、七筆測資、JCL 範本與雜湊清單 |
| samples/reports/sast.json | 對照查詢程式的練習弱點報告 |
| requests/ | Word 需求申請單為主要輸入；EML 保留為同一需求的信件範例 |
| DOC-SPEC.md | 整理架構與程式文件 |
| specs/testing.md | 準備及執行測試 |

samples 是獨立練習範例。閱讀 CIS14、STANCVT 或 SYSOCP31 時，仍以各自的原始程式和相依檔案為準。
