# 每次轉換前的實際資料快照

2026-09-15，維護紀錄，不納入學員 ZIP。

## 行為

RUN 新增 SNAP1、SNAP2，使用 IEBGENER 將當時的 &&WORK 完整複製到 &&BEFORE1、&&BEFORE2。SNAP1 在 RUNONCE 前；SNAP2 在 CHECK1 通過後、RUNTWICE 前。各快照步驟 RC 0 才進行對應轉換，全部資料皆為每項作業獨立的 FB400 暫存資料集。

CHECK1 的 BEFOREDD 指向 BEFORE1，CHECK2 指向 BEFORE2；兩者都不指向預期結果 EXP1／EXP2。CHKCKP 同步讀取 BEFOREDD、ACTUALDD、EXPECTDD，檢查三者讀取狀態與筆數。BEFORE-ID 印出該次執行前實際值，ACTUAL-ID 印出執行後值，EXPECT-ID 印出預期值；仍以 ACTUAL 與 EXPECT 的完整 400 bytes 決定 PASS。三個欄位均使用雙引號，保留十個字元及尾端空白。

CKP02、GENCKP、fixtures 與預期資料不變。這次增加執行前快照與結果顯示，沒有新增需求單中的預覽模式。

## 驗證

- TCBINS1 JOB00888：15 個步驟均執行；SNAP1、SNAP2 RC 0，CCKP 是既有警告 RC 4，其餘 RC 0。兩次各七筆完整資料比對及空檔測試通過。
- CHECK1 的 BEFORE 等於初始 id，CHECK2 的 BEFORE 等於 CHECK1 的實際 ACTUAL；七筆均逐一核對全部十個字元，包含空白。第 4 筆為 `0000123456` → `00123456  ` → `123456    `。
- CHECK1／CHECK2 以 IBM-1047 讀取只有 ASCII 可表示字元，沒有 NEL 或替代字元。
- TCBINS1 JOB00889 為隔離負向測試：只將該項提交內容的 CHECK1 BEFOREDD 改指向空檔，不修改發布 JCL。CHKCKP 回報 `READ OR COUNT FAILED 00 00 10`、RC 8；SNAP2 與 RUNTWICE 未執行，證明缺少 BEFORE 記錄不會誤報成功。
- 25 個帳號的 CHKCKP、RUN 共 50 個成員已完成上傳、原始位元組及 RSE 下載比對。套用後 TCB2101 JOB00916、TCB2401 JOB00917 均通過相同的 15 步、兩次七筆、空檔與 BEFORE/ACTUAL/EXPECT 十字元檢查。

更新主機前先備份並核對 CHKCKP 與 RUN 舊雜湊；RSE 上傳後使用原始 FB80 位元組與獨立 iconv 結果比對，再以 RSE 下載核對全部記錄。CKP02 與 GENCKP 成員未寫入。個人本機 RUN 僅在符合上版範本時更新，原檔另外備份。

私有證據在 `.work/before-snapshot-validation/`。舊作業輸出保持原樣；學員須提交更新後的 RUN 才會看到 BEFORE-ID。API 驗證不代表已由使用者完成 GUI 驗證。
