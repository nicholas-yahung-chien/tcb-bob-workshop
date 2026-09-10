請閱讀 AGENTS.md、SOURCE-MAP.md、specs/change-request.md、specs/customer-context.md、bank-source/reading/CKP02.TXT、samples/cobol/IDSHIFT.cbl與IDREC.cpy。
使用 Plan 模式規劃 CR-01，不修改程式、不執行任何主機或外部系統操作。
本次教學範圍已限定為純Python行為模型與文件。未決的正式平台問題列入待確認，不需要等待其答案才完成教學計畫。
請規劃 output/architecture.md 與 output/checklist.md 的完整內容：
- As-is來源事實、To-be提案、資料流、介面、缺件；引用實際檔案與行號。
- 分別分析 COBOL、Java、Database、Transaction、API、Batch、Test 七項。未提供的Java/API/Database實作明示未知，勿宣稱存在。
- 分析→設計→實作→測試→部署→回復清單，含負責角色、依賴與驗收。
- dry-run/write語意、eligible與changed區別、400 bytes與編碼、無I/O、批次原子驗證、重跑非冪等風險、並行控制、備份與回復。
若本版Plan只能存到指定規劃目錄，請遵循工具限制，保留計畫於該目錄或對話，下一步交由Agent輸出兩份正式檔案。現在不要實作normalizer。
