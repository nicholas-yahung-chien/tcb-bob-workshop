# 合作金庫 IBM Bob Workshop

接手不熟悉的程式時，可以先問什麼？這裡從批次需求開始，練習和 Bob 一起閱讀程式、整理文件，再用測試確認結果。

**[開始練習](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/)** · **[下載教材](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases/latest)**

## 開啟工作區

課程備有 30 個學員帳號。上課前先到課程網頁的 [課前準備](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/00-setup.html#account-registration) 展開共用表格，選擇尚未登記的帳號並填入姓名。

主機連線設定已放在根目錄的 `zowe.config.json`，只需將 `YOUR_USER_ID` 換成自己的帳號。`zowe.schema.json` 請一併保留。密碼為「帳號第一個字母大寫、其餘英文字母小寫，再接 `TCBBob@2026`」；例如 `TCB2101` 對應 `Tcb2101TCBBob@2026`。密碼只輸入 Zowe Explorer 的登入欄位，不要貼到 Bob 對話或教材檔案。詳細步驟見 [主機連線](host-lab/CONNECTION.md)。

來源、JCL 提交與中英文作業紀錄均使用 `tcb-rse`（IBM-1371），透過 IBM RSE API 連線。IBM Z Open Editor 與 Zowe Explorer 需保持啟用。

使用 ZIP 解壓後，用 File → Open Folder 開啟。若使用 Git，請直接下載教材分支：

```text
git clone --branch workshop/tcb-2026 --single-branch --depth 1 https://github.com/nicholas-yahung-chien/tcb-bob-workshop.git
```

開啟下載的資料夾，即可開始。課程步驟請閱讀上方「開始練習」連結。

確認 IBM Bob 已登入並啟用 PPZ，主機連線需 Zowe Explorer。[直接下載教材 ZIP](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases/latest/download/tcb-workshop.zip) 可略過 Git。兩種下載方式都包含根目錄的 Zowe 設定檔與 schema。

主流程不需要本機 Python。請將 host-lab/BOB-GUIDE.md 交給 Bob，完成教材檢查、個人 JCL 與實際主機紀錄分析。Git 僅在 Clone 下載時需要；Python 範例保留為另需執行環境的選做練習。

## 怎麼使用這些練習

主機實作從 [個人連線](host-lab/CONNECTION.md) 開始，再依 [CKP02 實作步驟](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/03-testing.html#host) 分析程式、提交 JCL，並下載自己帳號的 JES 紀錄交給 Bob 核對。第 04 單元接著依 [IMS-LAB.md](host-lab/IMS-LAB.md) 完成 IMS 資料庫串接，再依 [IMS-EVENTS.md](host-lab/IMS-EVENTS.md) 執行已備妥的 IMSEVTS，觀察真實 GNP、回復、受控中止與分段耗時；CUT 的 U3001 是指定情境，仍須核對其他步驟。RC 4 修正仍為選做，操作見 [RC4-LAB.md](host-lab/RC4-LAB.md)。

第 05 單元以 CKP02 練習 ZCodeScan、Improve Code 與檔案錯誤處理，依 [CODE-QUALITY.md](host-lab/CODE-QUALITY.md) 建立獨立 CKP02H，修改後僅重新執行 ZCodeScan，不準備 JCL 或上傳主機；CIS14 為延伸審閱。

每個單元先介紹一個情境，再提供可以直接問 Bob 的問題。將頁面列出的檔案用 @ 加入對話，選擇對應模式，就可以開始。看完回覆，再依自己的疑問追問。

提問時可以先想背景、任務、依據和成果。需求規劃單元會用 Enhance prompt 比較改寫前後的差異；你可以保留合適的補充，也可以直接使用頁面的提問範例。文件完成後，再沿著程式分支核對流程與例子。

需求和文件格式放在獨立檔案裡，提問時引用即可：

- `requests/`：業務寄來的需求信件與 Word 申請單，作為需求釐清的起點。
- `DOC-SPEC.md`：文件內容、檔名和檢查方式。
- `specs/testing.md`：COBOL 與 Python 測試。
- `specs/log-schema.md`、`host-lab/CODE-QUALITY.md`：IMS 事件分析與 COBOL 程式碼改善。

## 找到需要的檔案

| 資料夾 | 內容 |
|---|---|
| z-lab | 已備妥的 45 份程式與相依檔案 |
| host-lab | 個人主機連線與 Bob 操作指引；練習時保存自己的 JCL、報告與紀錄 |
| z-tests | 主機已備妥的 GENCKP、CHKCKP、IMSCKP、IMSEVT 之本機來源、測試資料定義、基準 JCL 與 IMS 練習範本 |
| samples | 轉換程式、測試與 JCL 延伸範例 |
| tests | 選做 Python 練習的測試案例 |
| output | 自己完成的文件與程式 |

選做的 Python 轉換範例可以在本機執行。COBOL、IMS 和 JCL 則需要對應環境，測試結果分開記錄。

參考解答不包含在教材中。完成練習後，可從課程網頁「成果與解答」下載獨立 ZIP，先讀 reference/README.md 的單元對照，再比較自己的成果。內容包含 COBOL 需求與文件、主機及 IMS 報告寫法、講師真實紀錄節錄，以及第 05 單元的本機掃描紀錄範例；Python 為選做練習，執行結果請依自己的紀錄填寫。

分析前依 host-lab/PPZ-ANALYSIS.md 建立 Local Metadata 與 DD.json，再另外整理成方便閱讀的繁體中文資料字典；DD.json 保留原樣。第 04 單元另可依 host-lab/IMS-ADMIN.md 從共享 IMS 子系統的真實 STC 紀錄練習管理者視角的判讀。

## 授權與來源

本 repo 同時包含課程自製內容、客戶提供或依客戶範例整理的程式，以及 IBM 產品與工具的操作說明，不能以同一份授權涵蓋全部內容。

- 客戶提供的程式、Copybook、Assembler 與其閱讀版、衍生範例，權利仍歸原權利人；本 repo 不另行授予使用、修改或散布這些內容的權利。
- IBM 產品、文件、商標與程式範例依各自隨附的 IBM 條款使用；收錄操作說明不表示 IBM 為本課程背書，也不改變原有授權。
- 課程自製的網站文字、指引、測試程式與封裝腳本目前未另行採用開放原始碼授權。未取得權利人的明確同意前，不應為整個 repo 套用單一授權。

[IBM Public License 1.0](https://public.dhe.ibm.com/systems/support/system_x_pdf/l_tstd_9ubsml_lenovo_notices.pdf) 的「Original Program」是由 IBM 發布的原始軟體，且條款要求保留指定的 IBM 著作權聲明，因此不適合直接套用到這個由多種來源組成的課程 repo。[IBM International Program License Agreement](https://www.ibm.com/support/pages/ibm-international-program-license-agreement-1) 與 [International License Agreement for Non-Warranted Programs](https://www.ibm.com/docs/en/i/7.4.0?topic=order-software-licensing-documents) 則用來授權特定 IBM 軟體產品，也不是一般 repository 可自行採用的開源授權。若日後要開放課程自製內容，應先將可授權的檔案與客戶、IBM 或其他第三方內容分開，再由權利人為該部分選定授權。
