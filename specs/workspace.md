# 準備工作區

使用 VSCode 中的 IBM Bob，並登入已啟用 Premium Package for Z（pp4z）的帳號。本機需要 Git 與 Python 3.10 以上；練習使用 Python 標準庫。

請 Bob 依序執行：

1. `python scripts/preflight.py`：確認環境及原始檔案完整性。
2. `python scripts/prepare_z.py`：在 output/z-lab 建立適合開啟的 .cbl、.cpy 和 .asm 副本。

Windows 若只有 py 指令，使用 `py -3`。完成後開啟 `output/z-lab/CKP02.cbl`。CIS14 和 Copybook 位於 `output/z-lab/CIS14/`。

bank-source 保留原始資料。已有修改過的副本時，準備程序會保留檔案並停止；可將自己的成果另存，再以新資料夾開始。

在 Bob 模式選單確認 Z Code 與 Z Architecture，並從 Start Workflow 確認 Explain code 與 Generate documentation。這些入口由已啟用的 pp4z 提供，環境檢查程式只檢查本機檔案。
