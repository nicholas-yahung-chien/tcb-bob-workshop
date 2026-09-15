# GENERATE 原始資料輸出驗證

2026-09-15：GENCKP 在 WRITE 前印出實際 REC-A，七筆各 400 bytes 分成五段各 80 bytes，保留雙引號內所有空白。另列 ID 與第 14–16 位。CKP02、測資與預期結果、RUN 均未修改。

經 RSE API 提交並讀取實際 spool：TCBINS1 JOB00919、TCB2101 JOB00944、TCB2401 JOB00945 均通過。每項作業的 GENERATE／SYSOUT 重新串接五段後，七筆共 2,800 bytes 全部符合原始測資，無截斷、NEL 或非 ASCII 字元。CASE 0003 的第 14–16 位為 EOF；CASE 0005 為 FQQ。

各項作業均執行完整 15 步，CCKP RC 4，其餘 RC 0。CHECK1、CHECK2 各七筆 PASS ALL 400 BYTES、ERRORS=0000；CHECK2 的 BEFORE-ID 等於 CHECK1 的 ACTUAL-ID；RUNEMPTY RC 0。

25 個課程帳號的 GENCKP 已更新並以主機二進位內容核對 IBM-937 編碼一致。更新前先確認既有成員符合上版內容，原始二進位備份及 spool 驗證保存在維護工作目錄，不納入學員 ZIP。學員端 GUI 顯示仍由實際操作確認。
