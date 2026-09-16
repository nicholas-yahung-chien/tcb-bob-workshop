# IMS 真實執行紀錄的閱讀方式

第 04 單元以 IMSEVTS 的實際作業紀錄練習，不再以預製 CSV 分類虛構交易。操作步驟與預期條件見 `host-lab/IMS-EVENTS.md`；請以學員提供的實際路徑讀取紀錄。

| 欄位或來源 | 意義 |
|---|---|
| job ID、step、DD、行號 | 證據位置；不同 job 不可混用 |
| APPLICATION DIAGNOSTIC MODE | 應用程式的練習模式，不是 IMS 系統日誌 |
| OP、CALL、PCB-STATUS | 單一步驟的呼叫順序、DL/I 操作與實際 PCB 狀態；空白狀態以雙引號保留 |
| GE | 本次 GNP 找不到更多子區段；須連同前後紀錄判斷，不能直接認定整個流程失敗 |
| II | 重複新增被拒絕；須再核對 ROLB 與獨立查詢，不能直接宣稱資料已還原 |
| BUSINESS=REJECTED | 本次新增未成功；不等於測試工具本身失敗 |
| END、HARNESS=PASS | 程式正常跑到結尾且符合測試預期，仍需核對 JES 與查詢證據 |
| CASE-BEGIN、GU-BEGIN、GU-END | 主機日期時間，格式 YYYYMMDDhhmmsscc 與時區位移；來源 CURRENT-DATE |
| WAIT-MS | CEE3DLY 呼叫前後的實測時間；要求等待兩秒，但不保證精準兩秒 |
| PRE-GU-MS | 案例開始至 GU 前，包含等待及該段程式處理 |
| GU-MS | GU 呼叫前後的量測值，刻度 10 ms；0 不代表零成本 |
| CASE-TO-GU-END-MS | 案例開始至 GU 返回，等於 PRE-GU-MS + GU-MS；不是整項 job 的執行時間 |
| IEF472I、IEF142I | JES 實際異常終止碼與步驟 RC |
| PDUP／SYSPRINT | DFSERA10 對 IMS 產生的 IEFRDER 二進位日誌所做的列印 |

只有 CUT／SYSOUT 時，可以確認已印出的操作，但正常結束或實際 abend 仍要補查 JES。完整紀錄提供後，以 CUT 的 U3001 與 CHECKA 的查詢結果更新結論。CUT 只讀取，不能拿它證明更新後的異常終止回復。

報告使用 `host-lab/ims/events-report.md`，按各 step 列出實際操作、業務結果、測試結果、資料最後狀態與證據；分開寫已知事項、待查事項及可能原因。沒有實測資料時不填造耗時或結果。不再要求舊版 log-facts.json 的合成事件分類。
