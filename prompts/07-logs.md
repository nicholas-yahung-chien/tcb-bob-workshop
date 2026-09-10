請讀AGENTS.md、samples/logs/ims-events.csv與specs/log-schema.md。
使用Agent建立output/log-analysis.md與output/log-facts.json。
依correlation_id整理時間線，每項觀察附event_id；區分已知結果、未知結果、根因假設和需追加的證據。不要把GE當整筆必然失敗，不把ROLB OK推成所有外部動作都已回復，也不要以單一2500ms事件斷言死鎖。
JSON格式為 {"synthetic":true,"completed_normal":[...],"completed_failed":[...],"incomplete":[...],"slow_event_ids":[...],"root_cause_confirmed":false}；前三個陣列填correlation_id，slow定義elapsed_ms>=1000。
明示本題為合成轉譯摘要，不是解析原始IMS binary log；不編造缺少的END事件或timestamp。只寫output/。
