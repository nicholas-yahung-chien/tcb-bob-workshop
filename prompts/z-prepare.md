請閱讀AGENTS.md，確認目前工作區為教材根目錄。
先執行python scripts/preflight.py，再執行python scripts/prepare_z.py。Windows若只有py指令，使用py -3。
只建立output/z-lab內的閱讀副本，不修改bank-source、samples、tests或scripts。檔案已修改時不要覆蓋。
完成後列出CKP02.cbl、CIS14/CIS14.cbl及Copybook所在位置，回報來源雜湊檢查結果。若失敗，指出實際錯誤，不宣稱pp4z或主機執行已通過。
