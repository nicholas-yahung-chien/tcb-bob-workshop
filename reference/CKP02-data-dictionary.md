# CKP02 可閱讀資料字典

本文件示範如何依工作流程產生的 DD.json 與 CKP02 原始碼，整理成方便閱讀的資料字典。DD.json 保留原樣；欄位長度、重疊定義與程式行為另以 CKP02 核對。

## 記錄與主要欄位

| 名稱 | 定義與位置 | 用途 | 程式依據 |
|---|---|---|---|
| IN-REF-REC | 400 bytes 的輸入記錄 | 每次 READ 取得的完整記錄，也是 REWRITE 回寫的範圍 | CKP02 第 22–26、75–76、86 行 |
| R-ID-1 | PIC X(10)，IN-REF-REC 第 1–10 bytes | 目前的十個 bytes 識別欄位；符合條件時會被轉換結果取代 | 第 27–28、95 行 |
| CH-R-ID-1 | PIC XX，與 R-ID-1 前兩個 bytes 重疊 | 提供條件名稱 CH-RPD-KEY 使用 | 第 29–31 行 |
| CH-RPD-KEY | 條件名稱，值為 `00` | 判斷識別欄位前兩個 bytes 是否為 `00` | 第 31、82 行 |
| CH-R-ID-2 | PIC X(8)，與 R-ID-1 第 3–10 bytes 重疊 | 符合條件時移入 RPD-KEY，成為轉換後識別值的前八個 bytes | 第 29、32、94 行 |
| R-ID-2 | PIC X，IN-REF-REC 第 11 byte | R-ID 群組的下一個欄位；本次轉換不修改 | 第 27、33 行 |
| R-NAME | PIC X(40)，自第 12 byte 起 | `IN-REF-REC(14:3)` 落在 R-NAME 第 3–5 bytes；值為 `EOF` 時略過識別值轉換 | 第 34、83 行 |

## 工作欄位

| 名稱 | 定義 | 用途 | 程式依據 |
|---|---|---|---|
| EOF | PIC 99，初值 0 | 控制主迴圈；READ 遇到 AT END 時改為 1。這個欄位不是資料記錄內的 `EOF` 三個 bytes | 第 55、67、75–76、88–89 行 |
| CHANGE-RPD-KEY | 十個 bytes 群組 | 組合 RPD-KEY 與兩個空白，之後移入 R-ID-1 | 第 56–58、95 行 |
| RPD-KEY | PIC X(8) | 暫存原識別欄位第 3–10 bytes | 第 57、94 行 |
| RPD-SPACE | PIC XX，初值為空白 | 提供轉換後識別值末尾的兩個空白 | 第 58 行 |

## 轉換規則

當 CH-RPD-KEY 成立，而且 IN-REF-REC 第 14–16 bytes 不等於 `EOF` 時，程式將 CH-R-ID-2 移入 RPD-KEY，再把 CHANGE-RPD-KEY 移入 R-ID-1。結果相當於移除原識別欄位前兩個 `0`，保留後八個 bytes，末尾補兩個空白。無論是否轉換，程式都會執行 REWRITE。

## 待確認事項

- 原始註解提到公司統編，但程式只檢查前兩個 bytes 與資料內的 `EOF`，沒有驗證統編格式或檢查碼。
- `RPD`、`R-ID-2` 及其他記錄欄位的正式業務名稱，需要由業務資料定義補充。
- `RECORD CONTAINS 400 CHARACTERS` 是來源中的宣告；本課程以 400 bytes 固定長度記錄進行測試。正式資料集屬性仍須由執行環境確認。
