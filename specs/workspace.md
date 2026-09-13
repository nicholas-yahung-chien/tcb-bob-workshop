# 準備工作區

使用 VSCode 中的 IBM Bob，並登入已啟用 Premium Package for Z（pp4z）的帳號。Git 與 Python 是課程依用途需要的額外工具，不因安裝 Bob 就保證可用。Git 只在 Git: Clone 下載時需要，使用教材 ZIP 可略過。下列準備步驟、主機 JCL 產生器與 Python 延伸練習需要本機 Python 3.10 以上（不是 3.1），只使用標準庫，不需安裝 pip 套件。

先在終端機確認 `python --version`；Windows 可用 `py -3 --version`，macOS／Linux 可用 `python3 --version`。找不到相容版本時先停在環境準備，依電腦的安裝規範安裝或選取既有 Python，不宣稱 Bob 已代為提供執行環境。

請 Bob 依序執行：

1. `python scripts/preflight.py`：確認環境及原始檔案完整性。
2. `python scripts/prepare_z.py`：在 output/z-lab 建立適合開啟的 .cbl、.cpy 和 .asm 副本。

Windows 若只有 py 指令，使用 `py -3`；macOS／Linux 可改用 `python3`。完成後開啟 `output/z-lab/CKP02.cbl`。CIS14 和 Copybook 位於 `output/z-lab/CIS14/`。

bank-source 保留原始資料。已有修改過的副本時，準備程序會保留檔案並停止；可將自己的成果另存，再以新資料夾開始。

在 Bob 模式選單確認 Z Code 與 Z Architecture，並從 Start Workflow 確認 Explain code 與 Generate documentation。這些入口由已啟用的 pp4z 提供，環境檢查程式只檢查本機檔案。
