# 合成事件摘要格式

這是本題使用的合成CSV事件摘要，不是IBM原始IMS log格式或真實事件。
event_id 是證據定位鍵；correlation_id 是本教材的關聯鍵。elapsed_ms 是單一事件時間，不能當端到端時間。
狀態字典（僅供本題）：OK=此操作成功；GE=segment未找到；II=重複segment；NORMAL=流程正常結束；FAILED=流程失敗結束。
GE 本身不證明整個交易失敗，須看後續事件。ROLB OK 表示摘要記錄的回復操作成功，不能證明所有外部副作用均已補償。
DEMO-C 只有GU沒有END：結束狀態未知，2500ms是一個慢事件，不能單憑一筆判定資料庫鎖定或網路根因。
任務：建立三條時間線、區分觀察／假設、列出仍需的證據。不得杜撰未提供的timestamp、SQL、dump或客戶資料。
