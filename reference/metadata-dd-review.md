# Local Metadata 與 Data Dictionary 核對參考

這是核對方式，不是工具執行成果。不提供預製 metadata database 或冒充工作流程產出的 DD.json。

| 項目 | 由自己的操作補上 |
|---|---|
| Bob／PPZ 版本與模式 | 待填 |
| scan_program 執行證據、來源與時間 | 待填；僅來源審閱不能填成掃描成功 |
| 工具回傳的 metadata 位置 | 待填 |
| Generate data dictionary 的實際入口 | 待填；Z Architect／Z Code 依安裝版本 |
| DD.json 的實際位置與人工確認 | 待填 |
| 文件是否使用字典、核對依據 | 待填；檔案存在不等於已被使用 |

CKP02 的核對方向：R-ID-1 為 10 bytes；CH-R-ID-2 代表原識別欄位第 3–10 位；轉換後補兩個空白。IN-REF-REC(14:3) 位於 R-NAME 第 3–5 位，資料內的 EOF 與 READ AT END 分開解釋。請回到自己的 CKP02 定義與段落逐一核對。

業務描述可保留「註解指向公司統編」，不能擴張成「已檢查合法統編」。不明縮寫列待確認，字典生成不等於業務確認。來源修改後重新掃描並核對字典與文件。
