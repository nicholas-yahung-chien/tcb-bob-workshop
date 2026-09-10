# 文件規格

這份規格約定文件要包含哪些內容，以及如何檢查。閱讀程式後，可以請 Bob 依這份規格整理文件，讓不同檔案使用相同的格式。

## 共通寫法

文件使用繁體中文，存放在 `output/`。每份 Markdown 以約 1500 字為目標，表格與例子可依需要增加。

程式的現有行為附上來源檔名和行號；變更建議另列。資料沒有提供的地方，說明還需要什麼資訊。例如程式的欄位宣告能說明長度，實際編碼、資料集屬性與外部備份則需要環境資料才能確認。

原始來源是 `bank-source/reading/CKP02.TXT`。對照範例包括 `samples/cobol/IDSHIFT.cbl`、`IDREC.cpy`、`TESTSHIFT.cbl` 及 `samples/jcl/IDSHIFT.jcl`。兩組程式分別說明，引用時使用完整路徑。

## 架構文件與實作清單

依 `specs/change-request.md` 的 CR-01 需求建立：

| 檔案 | 內容 |
|---|---|
| architecture.md | 現況（As-is）、提案（To-be）、資料流、風險，以及需要補充的資料 |
| checklist.md | 分析、設計、實作、測試、部署、回復；各項寫出負責角色、前置條件與完成標準 |

架構文件分別檢視 COBOL、Java、Database、Transaction、API、Batch、Test。沒有相應程式或規格時，記錄需要確認的問題。清單中的工作尚未執行，核取方塊先留空。

在 architecture.md 最後放一個 JSON 區塊，方便檢查欄位計算與重跑例子。使用下列鍵，數值從原始碼與測試資料推導：

| 鍵 | 要記錄的內容 |
|---|---|
| id_group_bytes | R-ID 群組的總長度，整數 |
| id_field_bytes | 識別欄位的長度，整數 |
| marker_field | 資料內 EOF 標記所在的欄位名稱；只填名稱 |
| rewrite_scope | 每筆讀入都回寫填 all-read-records；僅符合轉換條件才回寫填 eligible-only |
| mainframe_encoding_confirmed | 原始資料能否確認主機編碼，布林值 |
| repeat_input / repeat_once / repeat_twice | CR-01 重跑案例的原值、第一次及第二次結果；各保留十字元，含尾端空白 |

## 程式說明與影響分析

| 檔案 | 內容 |
|---|---|
| program.md | 用途、入口、欄位位置與長度、處理流程、轉換例子、錯誤處理及測試案例 |
| impact-analysis.md | CR-01 直接要改的部分、可能受影響的部分，以及需要補充的資料 |
| facts.json | 下表的欄位資料、重跑結果與來源引文，使用純 JSON |

說明 CKP02 的資料宣告和 IDSHIFT 的 Copybook 用法，並分開描述檔案讀寫與記憶體修改。JCL 的執行對象和需要填入的設定也列入文件。

| facts.json 的鍵 | 型別與用途 |
|---|---|
| record_bytes | 整數；記錄長度 |
| id_bytes | 整數；識別欄位長度，不含附加碼 |
| suffix_position | 整數；附加碼位置，從 1 起算 |
| marker_start / marker_length | 整數；資料內 EOF 的起始位置與長度 |
| padding_positions | 整數陣列；轉換後補入空白的位置 |
| has_file_io | 布林值；CKP02 是否有檔案讀寫 |
| redefines_extra_bytes | 整數；REDEFINES 額外占用的長度 |
| synthetic | 布林值；所描述的 CKP02 是否為合成範例 |
| repeat_input / repeat_once / repeat_twice | CR-01 重跑案例的三個十字元字串，保留空白 |
| evidence | 至少三筆來源引文，分別使用不同的行號 |

每筆 evidence 包含 `file`、`line`、`quote`。file 使用 `bank-source/reading/CKP02.TXT`；line 從 1 起算；quote 取該行實際存在的一段文字，不加行號或改寫。

## 完成後怎麼檢查

請 Bob 執行以下對應檢查。Windows 若使用 Python Launcher，可將 python 改成 py -3。

| 文件 | 檢查 |
|---|---|
| 架構與清單 | `python scripts/verify.py plan` |
| 程式說明與影響分析 | `python scripts/verify.py docs` |

除了檢查結果，也一起閱讀文件中的例子：

1. 逐項加總欄位長度，確認表格與程式宣告相符。
2. 看 IF 的句點、REWRITE 和下一筆 READ，確認流程圖或文字沒有改變其範圍。
3. 將 CR-01 的重跑案例實際推導兩次。第一次之後是否仍符合條件？兩份 Markdown 和 JSON 的說法應相同。
4. 找出讀檔結束與資料內 EOF 的處理位置，確認兩者的說明沒有混在一起。
5. 欄位位置註明是從整筆記錄還是欄位本身起算；空白的實際編碼則依執行環境確認。
6. 打開 JCL，核對 EXEC 和 DD 的實際內容，確認文件描述的是這份檔案。

程式檢查可以找出格式、數值及引文錯誤；正文的解釋仍需對照原始碼。檢查失敗時修正 output，保留來源、規格與測試。
