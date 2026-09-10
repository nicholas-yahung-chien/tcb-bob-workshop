# 測試報告參考模板

本模板搭配reference/normalizer.py與test_authored.py；實際講師版本驗證紀錄見verification/report.md。
學員執行`python scripts/verify.py unit`後，填入自己的日期、Python版本、命令、通過數、失敗項目與修改。

獨立驗收測試涵蓋完整400 bytes、EOF精確位置、非00、非數字內容、非法輸入、dry-run/write、空批及非冪等重跑。額外測試應避免只測型別或直接複製實作。

這些是Python純函式測試，不是COBOL編譯、JCL提交、IMS執行或正式銀行驗收；未執行項目保持待驗證。
