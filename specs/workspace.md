# 準備工作區

本課程主流程不需要本機 Python。使用 IBM Bob、pp4z 與 Zowe Explorer；使用 ZIP 下載時也不需要 Git。

請依 host-lab/BOB-GUIDE.md 的「一、檢查已備妥的程式」完成工作區準備，不執行 Python 腳本。保留教材程式及已有的學員修改，將實際檢查結果存入 output/workspace-check.md。

完成後開啟 output/z-lab/CKP02.cbl。連線依 host-lab/CONNECTION.md 使用教材預設設定檔。後續 JCL 與測試也依 BOB-GUIDE.md 進行。

後續課程加入檔案時，使用 output/z-lab 下的 .cbl、.cpy 與 .asm。CKP02 使用 output/z-lab/CKP02.cbl；CIS14 使用 output/z-lab/CIS14/CIS14.cbl 與同目錄的 .cpy。教材已直接提供這些檔案，不需要從 TXT 轉換或建立副本；使用根目錄 source-manifest.json 核對完整性。主機 JCL 內嵌的編譯副本則依 host-lab 指引準備。

確認 pp4z 入口時，在 IBM BOB 面板選 Z Code → Start Workflow。工作區選單請選本機教材資料夾（Run Workflow in 加上資料夾名稱），核對顯示的本機路徑。進入 Bob workflows 後，確認 Explain code 與 Generate program documentation 可見；此時不必啟動。程式文件單元再點對應功能的 Start。
