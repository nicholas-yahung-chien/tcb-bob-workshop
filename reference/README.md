# 參考文件怎麼使用

這份參考包含：01 需求規劃、02 COBOL 文件化、03 CKP02 基準作業、04 主機紀錄與 IMS 練習、05 本機程式改善與 ZCodeScan 重掃描。可用來比較文件寫法、推導與核對方式。請保留自己的成果，挑選有幫助的內容調整。

| 單元 | 參考檔案 | 學員成果位置與用途 |
|---|---|---|
| 01 | architecture.md、checklist.md | output/；COBOL 預覽提案及尚待完成的工作 |
| 02 | program.md、facts.json、impact-analysis.md、development-summary.md | output/；現有行為、變更影響及白話開發說明 |
| 03 | jcl-review.md、host-test-report.md | host-lab/jcl-review.md、host-lab/test-report.md；既有 RUN 的核對範例 |
| 03 COBOL 延伸（選做） | cobol-test-plan.md、TESTSHIFT-EXT.cbl | output/；IDSHIFT 的完整記錄、相鄰 EOF 與重跑測試；尚待 COBOL 環境執行 |
| 04 RC 4 選做 | rc4-review.md | host-lab/rc4/；警告分析與修正版證據的寫法 |
| 04 IMSRUN | ims-run-review.md、ims-test-report.md | host-lab/ims/review.md、test-report.md；提交前核對、IMS 資料串接、回復與提交 |
| 04 IMSEVTS | ims-events-report.md | host-lab/ims/events-report.md；父子區段、受控中止及耗時 |
| 04 講師實例 | observed-ims-example.md | JOB01118 的原始訊息節錄與判讀，不是自己的執行證據 |
| 04 共享 IMS 區域 | ims-admin-report.md、ims-admin-observed-report.md | host-lab/ims/admin-report.md；值班報告架構與實際 STC 紀錄判讀範例 |
| 05 | code-quality-review.md | host-lab/hardening/review.md；實際掃描及修改理由 |
| 延伸閱讀 | customer-analysis.md、idshift-notes.md | CIS14 審閱及 IDSHIFT 比較，依選做項目閱讀 |
| Python 選做 | normalizer.py、test_authored.py、test-report.md | output/；ASCII bytes 行為模型，非主機程式 |
| 部署討論 | change-ticket.md | 未來上線工作單，不是第 05 單元的執行要求 |

「預期」是從教材來源推導的核對目標，不是已通過。報告中的「待填」由自己的 job ID、step、DD、行號或掃描訊息補上。執行結果請填入自己的 job ID、時間與掃描訊息。現有基準作業、預覽提案與 CKP02H 改善是三個不同範圍。

第 05 單元只修改本機 CKP02H 並重新掃描，不提供統一修正版、不產生或上傳 JCL、不執行主機作業。掃描有不同結果是正常的，需說明修改與保留項目的理由。

比較時依課程網頁選擇相應文件；工作流程產出的 docs/ 文件保留原位。第 03 單元原版 RUN 與第 04 單元已選做的主機練習仍按各自指引進行。

metadata-dd-review.md 提供 Local Metadata 與 Data Dictionary 核對方式。參考 ZIP 不附固定的 DD.json，因為內容會隨實際選取的程式與掃描結果而不同；請核對自己產生的檔案並整理欄位說明。ims-admin-report.md 提供共享 IMS 子系統值班報告架構，ims-admin-observed-report.md 則示範如何引用實際 STC 訊息。請依自己的掃描與紀錄填寫。
