# CR-01 架構參考答案

## As-is：來源事實

CKP02是400字元定長檔更新程式（bank-source/reading/CKP02.TXT:25）；OPEN I-O（73）、READ（75/88）、REWRITE（86）。第82–84行的IF句點先結束，REWRITE不在條件內。第14–16位資料為EOF時只略過轉換。第94–95行將舊第3–10位加兩空白移回前十位；R-ID群組為10+1=11，各欄位長度要一併計入。

## To-be：預覽功能提案

合成bytes → 全批驗證 → 純函式轉換 → 統計 → dry-run原資料副本／write模式回傳轉換副本。
這是Python行為模型，不對來源檔REWRITE，不是已部署的主機架構。輸入400 bytes；回傳records/total/eligible/changed/unchanged/written/dry_run。eligible和changed概念不同，但本規則值相等；written為模型異動筆數，不能當CKP02實體寫入次數。

| 分析領域 | 已知／提案／缺件 | 負責確認角色 |
|---|---|---|
| COBOL | CKP02為已知來源；新增dry-run需分析OPEN與REWRITE路徑；本次不改原始程式 | 主機開發 |
| Java | 未提供；若未來以Java啟動批次，才需確認bytes與錯誤介面 | 整合開發 |
| Database | CKP02未見SQL/IMS呼叫；CIS14有IMS但未證明直接相連；Db2 schema 需另行取得 | DBA/IMS管理 |
| Transaction | CKP02未見checkpoint；全批一致性與中斷回復待設計 | 主機平台 |
| API | 未提供實際API；未來API化屬提案，須版本化與授權 | API負責人 |
| Batch | 定長檔、EOF、排程重跑與並行需釐清；正式JCL未提供 | 批次維運 |
| Test | 執行本機byte模型；主機編譯、code page、FD與REWRITE需另外驗證 | QA/主機開發 |

## 風險與回復

00開頭的key第一次轉換後仍可能以00開頭，重跑可能再次變更，因此需要測試連續執行的結果。正式部署需核對輸入版本、備份與hash、禁止同檔並行更新、定義失敗停止與回復到整批一致版本。編碼以實際主機code page為準，ASCII模型不覆蓋DBCS/EBCDIC。統計只記計數，不記完整客戶資料。

## 還需要哪些資料

正式JCL、編譯選項、真實測資、批次調度、寫檔權限、備份位置、PSB/DBD與整合介面均待相關角色確認。範例 JCL只呼叫合成TESTSHIFT，不是CKP02正式job。

## 來源核對

```json
{"id_group_bytes":11,"id_field_bytes":10,"marker_field":"R-NAME","rewrite_scope":"all-read-records","mainframe_encoding_confirmed":false,"repeat_input":"0000123456","repeat_once":"00123456  ","repeat_twice":"123456    "}
```
