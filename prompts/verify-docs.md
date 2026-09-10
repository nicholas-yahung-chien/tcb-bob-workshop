請在目前教材工作區執行python scripts/verify.py docs。Windows若只有py指令，改用py -3。
再對照program.md、impact-analysis.md及facts.json，核對0000123456→00123456加兩空白→123456加四空白的反例。第一次仍以00開頭，第二次可能再次轉換；若正文與此推導矛盾，列為尚未通過內容核對，不以JSON通過代替正文審查。
展開實際執行結果，回報exit code、通過與失敗項目；不要修改來源或驗收程式。若檢查失敗，先說明原因與最小修正建議，等我確認後再改output。
