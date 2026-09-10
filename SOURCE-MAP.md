# 練習檔案說明

先從 `bank-source/reading/CKP02.TXT` 看起，再搭配 samples 裡的 IDSHIFT 比較。CKP02 會讀取和回寫檔案，IDSHIFT 則處理傳入的記憶體記錄。

## 原始程式與閱讀版

`bank-source/raw/` 保存 45 份原始 TXT；`bank-source/reading/` 是 UTF-8 閱讀版。manifest.json 記錄檔案雜湊、編碼與行數，方便確認拿到的內容一致。

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
| samples/reports/sast.json | 對照查詢程式的練習弱點報告 |
| specs/change-request.md | 閱讀預覽與統計需求 |
| DOC-SPEC.md | 整理架構與程式文件 |
| specs/testing.md | 準備及執行測試 |

samples 是獨立練習範例。閱讀 CIS14、STANCVT 或 SYSOCP31 時，仍以各自的原始程式和相依檔案為準。
