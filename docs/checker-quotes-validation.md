# 比對輸出改用雙引號

2026-09-15。維護紀錄，不納入教材 ZIP。

依使用者要求，CHKCKP 的 ACTUAL-ID、EXPECT-ID 改用雙引號包住十個字元，例如 `ACTUAL-ID="12345678  "`。COBOL DISPLAY 使用單引號包住字串常數，輸出內容包含雙引號。只有兩行 DISPLAY 變更，完整 400-byte 比對、案例數、讀取狀態、回傳碼及 fixtures 均不變。

TCBINS1 JOB00881、TCB2101 JOB00882、TCB2401 JOB00883 均通過 13 個步驟核對：CCKP 為既有 RC 4，其餘 RC 0。CHECK1、CHECK2 各七筆完整比對通過；以 IBM-1047 讀取的兩份 SYSOUT 均為 ASCII 可表示字元，沒有 NEL、中括號或替代字元。以雙引號擷取十個字元後，ACTUAL 與 EXPECT 的識別值及尾端空白分別等於 fixtures 的 once、twice。

25 個學員及講師帳號的 CHKCKP 成員已在備份並核對舊版本後更新。RSE 上傳 IBM-937，原始 FB80 bytes 與獨立 iconv 結果完全一致。CKP02、GENCKP、JCL 及測試資料沒有更動。

新作業的 CHECK1、CHECK2 可直接以 tcb-jobs（IBM-1047）開啟；含中文的 CCKP/SYSPRINT 仍以 tcb-rse（IBM-937）開啟，該清單的 NEL 限制未解決。既有 job spool 不會因來源更新而改變，需要重新提交原本的 RUN 才產生雙引號格式。GUI 待使用者核對；不以 API 結果宣稱 GUI 已通過。

私有證據：`.work/checker-quotes/`，包含 25 個成員備份、雜湊與三項作業的原始回應及 validation.json。先前隔離嘗試的 ID-BEGIN/ID-END 格式未發布；正式教材採雙引號。
