# 合作金庫 IBM Bob Workshop

在VSCode的IBM Bob對話面板搭配Premium Package for Z（pp4z），完成需求規劃、COBOL文件化、測試、事件分析與弱點修補。

**[進入課程網站](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/)** · **[下載教材](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases/latest)**

## 開始使用

1. 在VSCode執行Git: Clone，輸入本repo網址並開啟資料夾。
2. 從分支選單切換至workshop/tcb-2026；也可下載ZIP後開啟資料夾。
3. 開啟IBM BOB面板，確認登入及pp4z啟用。
4. 依[課前準備](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/00-setup.html)選擇模式、加入@檔案並送出Prompt。

需要Git與Python 3.10以上；Python實作只使用標準庫。執行命令由Bob在目前工作區提出，請檢查Permissions提示後核准。

## 課程與成果

| 時段 | 任務 | 成果 |
|---|---|---|
| 14:30–15:00 | 業務新需求規劃 | architecture.md、checklist.md |
| 15:15–16:15 | pp4z程式解讀與文件化、測試、IMS事件、SAST修補 | 文件、程式、測試與分析報告 |

2026/09/21與09/24兩場內容相同。

## 素材目錄

- bank-source/raw：45份合庫原始檔，保留原始位元組。
- bank-source/reading：UTF-8閱讀版；manifest記錄編碼、行數與雜湊。
- samples：COBOL／Copybook／JCL及Python、事件、finding練習。
- specs：需求與資料契約。
- prompts：可貼入Bob對話的任務提示。
- tests：行為及修補驗收。
- reference：完成實作後可比較的參考解答。
- output：自己的產出；不納入版本控制。

pp4z使用output/z-lab中的語言副檔名閱讀副本；原始碼保持不變。Python模型與合成事件的檢查不代替COBOL編譯、IMS執行或正式SAST複掃。原始碼權利歸原權利人，本repo不另行授予原始程式授權。
