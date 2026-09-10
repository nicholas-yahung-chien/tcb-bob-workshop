# 合作金庫 IBM Bob Workshop

接手不熟悉的程式時，可以先問什麼？這裡從批次需求開始，練習和 Bob 一起閱讀程式、整理文件，再用測試確認結果。

**[開始練習](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/)** · **[下載教材](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases/latest)**

## 開啟工作區

在 VSCode 用 Git: Clone 下載這個 repo，開啟後切換到 `workshop/tcb-2026` 分支。也可以下載 ZIP，解壓後用 File → Open Folder 開啟。

準備好 Git、Python 3.10 以上版本，以及已登入並啟用 pp4z 的 IBM Bob，接著從[課前準備](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/00-setup.html)開始。

## 怎麼使用這些練習

每個單元先介紹一個情境，再提供可以直接問 Bob 的問題。將頁面列出的檔案用 @ 加入對話，選擇對應模式，就可以開始。看完回覆，再依自己的疑問追問。

需求和文件格式放在獨立檔案裡，提問時引用即可：

- `specs/change-request.md`：這次要解決什麼問題，以及範例介面。
- `DOC-SPEC.md`：文件內容、檔名和檢查方式。
- `specs/testing.md`：COBOL 與 Python 測試。
- `specs/log-schema.md`、`specs/sast-task.md`：事件分析和查詢修正。

## 找到需要的檔案

| 資料夾 | 內容 |
|---|---|
| bank-source | 45 份合庫原始檔及 UTF-8 閱讀版 |
| samples | 轉換程式、測試、JCL、事件及查詢練習 |
| prompts | 各單元的提問範例 |
| reference | 可以比較的參考解答 |
| output | 自己完成的文件與程式 |

Python 與 SQLite 可以在本機執行。COBOL、IMS 和 JCL 則需要對應環境，測試結果分開記錄。

原始碼權利歸原權利人，本 repo 不另行授予原始程式授權。
