# Local Metadata 與 Data Dictionary 核對參考

完成掃描與資料字典後，可用下表整理結果，方便後續文件化時查閱。

| 項目 | 由自己的操作補上 |
|---|---|
| Bob／PPZ 版本與模式 | 待填 |
| scan_program 執行證據、來源與時間 | 填入工具紀錄與來源位置 |
| 工具回傳的 metadata 位置 | 待填 |
| Generate data dictionary 的實際入口 | 待填；Z Architect／Z Code 依安裝版本 |
| DD.json 的實際位置 | 待填；保留工作流程產生的原檔 |
| 可閱讀資料字典 | `output/CKP02-data-dictionary.md`；填入產生時間與核對結果 |
| 文件是否使用字典、核對依據 | 填入文件、DD.json 與程式的核對結果 |

CKP02 的核對方向：R-ID-1 為 10 bytes；CH-R-ID-2 代表原識別欄位第 3–10 位；轉換後補兩個空白。IN-REF-REC(14:3) 位於 R-NAME 第 3–5 位，資料內的 EOF 與 READ AT END 分開解釋。請回到自己的 CKP02 定義與段落逐一核對。

DD.json 是工作流程產生的來源資料，保留原樣，不另外翻譯或改寫。請根據 DD.json 與 CKP02 另建 `output/CKP02-data-dictionary.md`，以台灣地區用語的繁體中文整理欄位用途、程式依據及待確認事項。完成後核對 DD.json 未被修改，且 Markdown 文件涵蓋指定程式的相關項目。

業務描述可保留「註解指向公司統編」，不能擴張成「已檢查合法統編」。不明縮寫列待確認，字典生成不等於業務確認。來源修改後重新掃描並核對字典與文件。
