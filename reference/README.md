# 參考文件怎麼使用

本套參考對齊目前課程：01 需求規劃、02 COBOL 文件化、03 CKP02 基準作業、04 主機紀錄與真實 IMS 延伸、05 本機程式改善與 ZCodeScan 重掃描。這些是文件寫法、推導及核對方式，並非學員作業的實測報告。請保留自己的結果，不整份覆蓋。

| 單元 | 參考檔案 | 學員成果位置與用途 |
|---|---|---|
| 01 | architecture.md、checklist.md | output/；COBOL 預覽提案及尚待完成的工作 |
| 02 | program.md、facts.json、impact-analysis.md、development-summary.md | output/；現有行為、變更影響及白話開發說明 |
| 03 | jcl-review.md、host-test-report.md | host-lab/jcl-review.md、host-lab/test-report.md；既有 RUN 的核對範例 |
| 04 RC 4 選做 | rc4-review.md | host-lab/rc4/；警告分析與修正版證據的寫法 |
| 04 IMSRUN 選做 | ims-test-report.md | host-lab/ims/test-report.md；IMS 資料串接、回復與提交 |
| 04 IMSEVTS 選做 | ims-events-report.md | host-lab/ims/events-report.md；父子區段、受控中止及耗時 |
| 04 講師實例 | observed-ims-example.md | JOB01118 的原始訊息節錄與判讀，不是自己的執行證據 |
| 05 | code-quality-review.md | host-lab/hardening/review.md；實際掃描及修改理由 |
| 延伸閱讀 | customer-analysis.md、idshift-notes.md | CIS14 審閱及 IDSHIFT 比較，依選做項目閱讀 |
| Python 選做 | normalizer.py、test_authored.py、test-report.md | output/；ASCII bytes 行為模型，非主機程式 |
| 部署討論 | change-ticket.md | 未來上線工作單，不是第 05 單元的執行要求 |

「預期」是從教材來源推導的核對目標，不是已通過。報告中的「待填」由自己的 job ID、step、DD、行號或掃描訊息補上。範例不提供可冒充實測的 job ID、時間、固定 ZCodeScan 警告數或成功紀錄。現有基準作業、預覽提案與 CKP02H 改善是三個不同範圍。

第 05 單元只修改本機 CKP02H 並重新掃描，不提供統一修正版、不產生或上傳 JCL、不執行主機作業。掃描有不同結果是正常的，需說明修改與保留項目的理由。

本 ZIP 不含舊 SQL 注入或合成 IMS CSV 解答，也不需要 scripts/verify.py。比較時依課程網頁選擇相應文件；工作流程產出的 docs/ 文件保留原位。第 03 單元原版 RUN 與第 04 單元已選做的主機練習仍按各自指引進行。
