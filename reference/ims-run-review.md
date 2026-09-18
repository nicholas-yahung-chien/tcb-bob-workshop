# IMSRUN 執行前核對參考

保存自己的核對結果時可使用 `host-lab/ims/review.md`。本參考依教材的 `z-tests/ims-run.jcl`、`z-tests/IMSCKP.cbl` 與 `host-lab/IMS-LAB.md` 整理，不能代替遠端個人 JCL 的實際核對。

## 程式與資料來源

- 作業名稱為 `TCBIMSP`，`NOTIFY` 使用提交者的 `SYSUID`。
- CGEN、CCKP、CCHK 與 CIMS 分別讀取提交者 `TCBLAB.COBOL` 中的 GENCKP、CKP02、CHKCKP 與 IMSCKP。
- CIMS 編譯獨立的 IMSCKP；IMSRUN 沒有內嵌另一份 IMSCKP 程式。
- 七筆 400-byte 中文測資由 GENERATE 建立。資料庫鍵值 CASEKEY 為四個 bytes，與 CKP02 會轉換的十個 bytes 識別欄位分開。

## IMS 資源與隔離

- 作業內建立 DBD TCBCKDB、載入 PSB TCBCKPL 及更新／查詢 PSB TCBCKPU。
- DBD、PSB、程式庫、資料庫與日誌均使用本作業的暫存資料集；沒有更新共享 IVP 資料庫或 ACBLIB。
- DBLOAD 以 ISRT 載入資料；EXPORT 與 BASECHK 以 GU 讀取；ROLLBACK 與 UPDATE 使用 GHU、REPL，再分別執行 ROLB 與 CHKP。
- 每次完整重跑會重新建立資料庫並載入原始七筆資料，作業結束後由暫存資料集清理完成。

## 26 個步驟

依序核對 ALLOC、A0、B0、A1、B1、A2、B2、CGEN、LGENCKP、CCKP、LCKP02、CCHK、LCHKCKP、CIMS、LIMS、GENERATE、DBLOAD、EXPORT、BASECHK、CONVERT、CHKFILE、ROLLBACK、UPDATE、VERIFY、PROLLBAC、PUPDATE。

CCKP 保留原版 CKP02，可能因編譯警告得到 RC 4；實際原因須讀本次 CCKP／SYSPRINT。其他步驟的結果也必須以提交後的 JES 訊息與 DD 內容確認，不能只依此清單判定成功。

## 提交前仍要確認

1. 遠端個人 `TCBLAB.JCL(IMSRUN)` 是否與教材範本一致。
2. `&SYSUID` 是否會指向目前登入者的 COBOL 資料集。
3. CIMS 的 SYSIN 是否讀取該帳號的 COBOL(IMSCKP)。
4. 課程主機所需的 IMS、COBOL、LE 程式庫及儲存設定是否保持原值。
5. 本次只提交個人 IMSRUN，沒有更改共享 IMS 設定。

提交後另以 `host-lab/ims/test-report.md` 記錄實際 job ID、step、DD、訊息、回傳碼、七筆完整比對，以及 ROLB、CHKP 和 DFSERA10 的證據。
