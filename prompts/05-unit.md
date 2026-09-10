請閱讀 AGENTS.md、specs/change-request.md、samples/cobol/IDSHIFT.cbl、samples/cobol/IDREC.cpy、samples/python/normalizer.py 及 tests/test_normalizer.py。
使用Agent，在output/normalizer.py完成transform與process，完全依CR-01介面契約；只用Python標準庫，不做任何I/O，不改來源或測試。
在output/test_authored.py額外撰寫三個unittest即可：測完整record保留、資料中EOF仍可處理下一筆、dry-run不改caller資料；不要只檢查回傳型別，也不要增加不必要的測試數。
先建立output/test-report.md，將狀態標為待執行；再執行 python scripts/verify.py unit，若失敗修正output/程式再執行。不得修改scripts/、tests/、specs/來過關。
特別核對eligible與changed的定義；本題兩者相等，written表示模型套用筆數而不是實體REWRITE次數。空資料、非法長度、型別錯誤、尾端任意bytes都要處理。
完成後用檔案編輯工具更新output/test-report.md，約300中文字：實際命令、通過或失敗、失敗原因與修正、尚未執行的COBOL/IMS驗證。不捏造執行紀錄，保留Markdown原文與反引號。
