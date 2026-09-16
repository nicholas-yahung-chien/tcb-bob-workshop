# IMSEVTS 事件分析參考

保存為 host-lab/ims/events-report.md，依 IMS-EVENTS.md、specs/log-schema.md 與自己的完整 job 紀錄填寫。本例不使用合成 CSV，不提供假 job ID 或耗時數字。

## 只取得 CUT／SYSOUT 時

若看到 GU 成功但缺少 END MODE=CUT，可說「目前可確認讀取結果，尚不能只憑這份輸出確定如何結束」。準備呼叫 U3001 的文字只是意圖，仍要 JES 的實際終止碼及後續 CHECKA。

## 補齊同一 job 後

| 情境 | 應據以更新結論的證據 |
|---|---|
| NORMAL | GU 父區段、GNP 明細及後續 GE；正常結束與 RC 0。GE 在本情境是查詢結束。 |
| DUP | 重複新增得到 II，ROLB 後查回父區段全部 400 bytes 與子區段；測試 RC 0 不代表業務新增成功。 |
| CHECKB | 另一執行步驟重新比對父子資料，證明回復後狀態。 |
| DELAY | 分別記錄 WAIT-MS、PRE-GU-MS、GU-MS、CASE-TO-GU-END-MS 的實際值。等待安排在 GU 前，不能解釋為 GU 被鎖住兩秒。 |
| CUT | JES 的 IEF472I／USER=3001 支持實際受控中止；不是單憑程式文字。 |
| CHECKA | CUT 為指定 U3001 後確實執行、RC 0，核對資料不變。 |
| PDUP | DFSERA10 的真實 IMS 日誌列印，與應用程式診斷分開。 |

完整步驟為 ALLOC、A0、B0、A1、B1、A2、B2、CIMS、LIMS、DBLOAD、NORMAL、DUP、CHECKB、DELAY、PDUP、CUT、CHECKA，共 17 步。預期 16 步 RC 0，只有 CUT U3001；缺件或其他異常不得當成通過。每行結論填入實際 job、step、DD 與訊息位置。

計時刻度為 10 ms，GU-MS=0 不表示零耗時，等待也不要求恰好 2000 ms。時鐘與範圍限制依 log-schema.md 解讀，不以此認定正式環境效能或根因。

OP 只在單一步驟內編號，非 IMS 原生交易 ID。此程式不執行 CKP02；父子資料是獨立英數測試模型。CUT 前沒有更新，CHECKA 驗證資料未變，不證明帶更新的 ABEND 自動回復。完整重跑重新建庫，作業結束清除暫存資料，無需人工清除共享資源。

取得完整證據後更新先前「待確認」，而不是永遠保留未知；沒有取得就不填成功。實際判讀可能與預期不同，應保留原文並說明差異。
