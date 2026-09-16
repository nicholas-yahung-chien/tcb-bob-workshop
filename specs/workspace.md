# 準備工作區

本課程主流程不需要本機 Python。使用 IBM Bob、PPZ 與 Zowe Explorer；使用 ZIP 下載時也不需要 Git。

請依 host-lab/BOB-GUIDE.md 的「一、檢查已備妥的程式」完成工作區準備，不執行 Python 腳本。保留教材程式及已有的學員修改，將實際檢查結果存入 output/workspace-check.md。

完成後開啟 z-lab/CKP02.cbl。連線依 host-lab/CONNECTION.md 使用教材預設設定檔。後續 JCL 與測試也依 BOB-GUIDE.md 進行。

後續課程加入檔案時，使用 z-lab 下的 .cbl、.cpy 與 .asm。CKP02 使用 z-lab/CKP02.cbl；CIS14 使用 z-lab/CIS14/CIS14.cbl 與同目錄的 .cpy。教材已直接提供這些檔案，不需要從 TXT 轉換或建立副本；使用根目錄 source-manifest.json 核對完整性。主機已在自己的 TCBLAB.COBOL 準備 CKP02、GENCKP、CHKCKP 三個同名成員；TCBLAB.JCL(RUN) 是已填妥個人帳號的作業。來源、JCL 與中英文紀錄的操作統一使用 tcb-rse（IBM-1371）。既有來源的 CODEPAGE(937),DBCS 編譯選項依範本保留。依 host-lab 指引開啟並核對即可，不需要上傳或貼上。保留本機 UTF-8、LF 與所有中文註解。

確認 PPZ 入口時，在 IBM BOB 面板選 Z Code → Start Workflow。工作區選單請選本機教材資料夾（Run Workflow in 加上資料夾名稱），核對顯示的本機路徑。進入 Bob workflows 後，確認 Explain code 與 Generate program documentation 可見；此時不必啟動。程式文件單元再點對應功能的 Start。

主機測試材料集中在 z-tests/：GENCKP.cbl、CHKCKP.cbl、fixtures.json、run.jcl 與 manifest.json。確認五份檔案齊全；個人配置、從主機另存的 JCL、報告與紀錄放在 host-lab/。environment.md 與個人 run.jcl 不包含在共用教材 ZIP：前者依第 00 單元建立，後者僅在本機缺檔時依第 03 單元下載一次。

選做第 04 單元延伸練習時，另確認 host-lab/RC4-LAB.md、host-lab/IMS-LAB.md 、z-tests/ims-run.jcl 與 z-tests/IMSCKP.cbl。IMS 範本內含教學用 DBD 與 PSB，CIMS 讀取已備妥的遠端 COBOL(IMSCKP) 獨立來源，同一份作業已備妥於自己的 TCBLAB.JCL(IMSRUN)，不需學員重新產生或上傳。核對結果與報告放在 host-lab/ims；只有自行修改時才另存個人 JCL。它不取代基準 run.jcl，也不是客戶正式 IMS 環境的配置。

確認 `.bob/skills/cobol-explain-zh-tw/SKILL.md` 與 `.bob/skills/program-docs-zh-tw/SKILL.md` 齊全；保留 `.bob/rules/language.md`。Explain code 使用前者，請學員在 Bob Settings → Skills 核對它為 Workspace 且 Active 已開啟。Generate program documentation 已在課程環境確認能直接產生中文正文，直接使用產生的文件，不要求再呼叫翻譯技能。後者只在學員需要翻譯英文正文時作為備援。檔案存在不等於已確認技能啟用，不要在準備階段自動執行工作流程。
