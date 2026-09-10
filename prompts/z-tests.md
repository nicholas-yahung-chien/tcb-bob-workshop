請閱讀samples/cobol/IDSHIFT.cbl、samples/cobol/IDREC.cpy、samples/cobol/TESTSHIFT.cbl與specs/change-request.md。
分析現有COBOL測試driver已涵蓋的正常／EOF案例，再設計非00前綴、近鄰EOF、尾端bytes保留與非冪等重跑案例。
將測試矩陣存入output/cobol-test-plan.md，包含輸入、完整預期記錄、判定方式、所需編譯與執行條件。依現有driver風格建立output/TESTSHIFT-EXT.cbl，保留正常與EOF案例，加入上述邊界案例；失敗時印出案例名稱並設定非零RETURN-CODE。
只有實際具備編譯器且執行成功才記為通過；未執行的COBOL測試標為測試設計。不要以Python模型結果替代主機執行結果。只寫output。
