# 合成事件摘要格式

這是本題使用的合成CSV事件摘要，不是IBM原始IMS log格式或真實事件。
event_id 是證據定位鍵；correlation_id 是本教材的關聯鍵。elapsed_ms 是單一事件時間，不能當端到端時間。
狀態字典（僅供本題）：OK=此操作成功；GE=segment未找到；II=重複segment；NORMAL=流程正常結束；FAILED=流程失敗結束。
GE 本身不證明整個交易失敗，須看後續事件。ROLB OK 表示摘要記錄的回復操作成功，不能證明所有外部副作用均已補償。
DEMO-C 只有GU沒有END：結束狀態未知，2500ms是一個慢事件，不能單憑一筆判定資料庫鎖定或網路根因。
依現有事件建立三條時間線，分開記錄觀察與可能原因。若需要其他時間記錄、SQL 或 dump 才能判斷，列入待查資料。

## 分析報告

產出 `output/log-analysis.md` 和 `output/log-facts.json`。報告依 correlation_id 整理時間線，各項觀察附 event_id；分開記錄已知結果、待查事項與可能原因。

JSON 使用以下六個鍵，文字說明放在 Markdown：

| 鍵 | 內容 |
|---|---|
| synthetic | 布林值；是否為合成事件 |
| completed_normal | 正常結束的 correlation_id 陣列 |
| completed_failed | 失敗結束的 correlation_id 陣列 |
| incomplete | 缺少結束記錄的 correlation_id 陣列 |
| slow_event_ids | elapsed_ms 大於等於 1000 的 event_id 陣列 |
| root_cause_confirmed | 布林值；現有記錄是否足以確認根因 |

完成後執行 `python scripts/verify.py logs`，再閱讀時間線與結論是否一致。Windows 若只有 py 指令，使用 py -3。檢查失敗時修正 output 的分析檔。
