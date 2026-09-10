# CR-01 影響分析參考答案

直接來源：bank-source/reading/CKP02.TXT:73的OPEN I-O與86的REWRITE，是正式dry-run設計需檢視的I/O點；82–84是條件，94–95是轉換。新增統計保留 400 字元的記錄佈局，另以計數或受控輸出記錄結果。

本機實作影響output/normalizer.py、測試與文件；samples/cobol/IDSHIFT.cbl是純子程式對照，無READ/REWRITE/IMS。samples/jcl/IDSHIFT.jcl是TESTSHIFT骨架，不是合庫正式JCL。

可能影響：排程、下游取檔、重跑與備份策略。未提供實際Java、API、Database介面，這些介面仍待補充資料。CIS14有IMS相依並不證明與CKP02串接。

主機開發確認檔案屬性與編譯選項；維運確認單一執行、備份、回復及非冪等重跑；整合團隊確認下游契約；QA確認code page、DBCS、I/O失敗與邊界測試。正式部署與平台SAST複掃均未執行。
