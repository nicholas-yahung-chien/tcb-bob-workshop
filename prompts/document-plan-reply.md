可以，請依剛才的計畫開始寫文件，這次先以 CKP02.cbl 為主，不選做 IDSHIFT。請一併參考 change-application.docx。

我能補充的是：計數用 DISPLAY 印在作業紀錄就夠了；正式排程沒有防止重複執行的機制；資料裡的 EOF 表示最後一筆；試跑與正式結果不同時，需要找出哪些筆不一致。

正式 INPUT1 的配置、如何防止重跑，以及前後資料要怎麼保存和比對，還需要討論，請先列為待確認。程式目前的做法和後續修改建議請分開說明。

請依 DOC-SPEC.md，只保存 output/program.md 與 output/facts.json。欄位位置和重跑的例子請再對照 CKP02.cbl 檢查一次；保留 DD.json、docs 原稿及所有程式與測試素材，不提交主機作業。上述需求回答留在同一段對話，稍後切換 Z Architect 再整理 impact-analysis.md。
