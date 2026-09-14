# 合作金庫 IBM Bob Workshop

接手不熟悉的程式時，可以先問什麼？這裡從批次需求開始，練習和 Bob 一起閱讀程式、整理文件，再用測試確認結果。

**[開始練習](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/)** · **[下載教材](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases/latest)**

## 開啟工作區

主機連線設定已放在根目錄的 `zowe.config.json`，只需將 `YOUR_USER_ID` 換成自己的帳號。`zowe.schema.json` 請一併保留；密碼透過 Zowe 認證介面輸入。詳細步驟見 [主機連線](host-lab/CONNECTION.md)。

使用 ZIP 解壓後，用 File → Open Folder 開啟。若使用 Git，請直接下載教材分支：

```text
git clone --branch workshop/tcb-2026 --single-branch --depth 1 https://github.com/nicholas-yahung-chien/tcb-bob-workshop.git
```

開啟下載的資料夾，即可開始。課程步驟請閱讀上方「開始練習」連結。

確認 IBM Bob 已登入並啟用 pp4z，主機連線需 Zowe Explorer。Git 只在 Git: Clone 下載時需要；[直接下載教材 ZIP](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases/latest/download/tcb-workshop.zip) 可略過 Git。兩種下載方式都包含根目錄的 Zowe 設定檔與 schema。

主流程不需要本機 Python。請將 host-lab/BOB-GUIDE.md 交給 Bob，完成教材檢查、個人 JCL 與實際主機紀錄分析。Git 僅在 Clone 下載時需要；Python 範例保留為另需執行環境的選做練習。

## 怎麼使用這些練習

主機實作從 [個人連線](host-lab/CONNECTION.md) 開始，再依 [CKP02 實作步驟](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/03-testing.html#host) 分析程式、提交 JCL，並下載自己帳號的 JES 紀錄交給 Bob 核對。IMS 事件 CSV 與 SQLite 弱點修補是另外的延伸練習。

每個單元先介紹一個情境，再提供可以直接問 Bob 的問題。將頁面列出的檔案用 @ 加入對話，選擇對應模式，就可以開始。看完回覆，再依自己的疑問追問。

提問時可以先想背景、任務、依據和成果。需求規劃單元會用 Enhance prompt 比較改寫前後的差異；你可以保留合適的補充，也可以直接使用頁面的提問範例。文件完成後，再沿著程式分支核對流程與例子。

需求和文件格式放在獨立檔案裡，提問時引用即可：

- `specs/change-request.md`：這次要解決什麼問題，以及範例介面。
- `DOC-SPEC.md`：文件內容、檔名和檢查方式。
- `specs/testing.md`：COBOL 與 Python 測試。
- `specs/log-schema.md`、`specs/sast-task.md`：事件分析和查詢修正。

## 找到需要的檔案

| 資料夾 | 內容 |
|---|---|
| z-lab | 已備妥的 45 份程式與相依檔案 |
| host-lab | 個人主機連線、CKP02 JCL 範本、測資與 Bob 操作指引 |
| samples | 轉換程式、測試、JCL、事件及查詢練習 |
| tests | 選做 Python 練習的測試案例 |
| scripts/verify.py | 選做練習使用的驗收工具 |
| output | 自己完成的文件與程式 |

Python 與 SQLite 可以在本機執行。COBOL、IMS 和 JCL 則需要對應環境，測試結果分開記錄。

參考解答不包含在教材中。完成練習後，可從課程網頁「成果與解答」下載獨立 ZIP，再依頁面指引比較自己的成果。

原始碼權利歸原權利人，本 repo 不另行授予原始程式授權。
