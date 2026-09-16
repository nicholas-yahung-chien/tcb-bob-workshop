# 從系統管理者角度閱讀 IMS 紀錄

這項練習使用共享 IMS 子系統的運作紀錄，練習整理事件、閱讀訊息及安排後續查詢。沿用 tcb-rse／IBM-1371 連線，直接讀取現有工作即可。

## 1. 找到 IMS 區域

在 Zowe Explorer 的「工作 → tcb-rse」設定篩選：Owner 為 IBMUSER、Prefix 為 IMS15*。清除只顯示 OUTPUT 的狀態條件，重新整理後找到下列 ACTIVE 工作。

| 工作名稱 | 角色 |
|---|---|
| IMS15CR1 | Control region，IMS 控制區域 |
| IMS15DL1 | DL/I separate address space，資料庫處理區域 |
| IMS15RC1 | DBRC，資料庫復原控制區域 |

課程主機為 VS01，IMSID 為 IVP1。記下清單中當前的 STC ID；區域重啟後，ID 會改變。這些工作由大家共用，閱讀紀錄時請保持它們持續運作。

## 2. 保存紀錄

1. 逐一開啟三個區域的 JESMSGLG、JESYSMSG、JESJCL。
2. 載入全部內容，確認顯示正常後另存 UTF-8。建議保存於 host-lab/logs/ims-admin/，檔名使用「STC ID-DD 名稱.txt」。再次擷取時加上時間，方便比較。
3. 在同一資料夾建立 collection.md，記下主機、IMSID、工作名稱、STC ID、Owner、DD、取得時間及紀錄涵蓋的日期。
4. 完成後，將 Zowe Explorer 的 Owner 篩選改回自己的帳號。
5. 將紀錄資料夾及本指引加入 Bob 對話。

下載時間與事件發生時間不同，請保留原始時間標示。若 API 顯示 EDT，而 JES 內文採用另一個時間基準，先確認時區再排列事件。

找不到工作時，先檢查篩選條件；若讀取遭拒，保留訊息請講師協助。講師提供紀錄副本時，也記下來源與取得時間。

## 3. Ask：看懂發生了什麼

> 這是剛從主機取得的 IMS 系統紀錄。請幫我看這段時間發生了什麼，有哪些訊息值得留意。請指出時間、訊息代碼和來源檔案；如果還不能判斷原因，告訴我需要再查哪些紀錄。

可以先找 IMS READY、region 啟停及日誌狀態訊息，再對照日期與前後內容。ACTIVE 工作仍在執行，所以還沒有最終 RC；IMS READY 則描述該訊息時點的狀態。想了解目前是否正常，還需要搭配較新的紀錄。

引用訊息時，記下 STC ID、DD 及行號。若看到 DFS2864I，留意它說的是 external trace 資料集切換，與 OLDS 日誌切換是不同的事情。

## 4. Plan：討論接下來查什麼

> 如果我是值班的系統管理者，接下來應該先查什麼？請依剛才的紀錄說明理由，先以不影響系統運作的查詢為主。

需要更多資料時，請講師或管理者提供同一時段的 SYSLOG 節錄及 DISPLAY 回應，並記下指令、時間與 IMSID。學員在本練習閱讀及分析紀錄即可，系統操作由管理者處理。

例如 /DISPLAY OLDS 的 SCHEDULED 表示封存作業已排程，還要繼續查作業是否完成。RATE=0 是該次觀測的寫入速率，需搭配觀測期間解讀。遇到不熟悉的訊息，可請 Bob 查找相應 IMS 版本的 IBM 文件，再核對說明。

## 5. Agent：留下值班交接紀錄

> 請把剛才確認的事件、判斷依據和待查事項整理成值班交接紀錄，存到 host-lab/ims/admin-report.md。保留各份紀錄的來源和取得時間。

報告包含觀測範圍、檔案清單、事件時間線、判斷理由與下一步。還沒有答案的問題先列出來，取得更多紀錄後再更新。

## 三種紀錄怎麼分？

| 紀錄 | 可以看到什麼 |
|---|---|
| 共享 IMS 區域的 JES 紀錄 | 系統啟動、操作及區域訊息，本練習主要閱讀這一類 |
| IMSRUN／IMSEVTS 的程式輸出 | 前面批次練習的 DL/I 呼叫、資料比對與計時 |
| OLDS／SLDS 經工具列印的內容 | IMS 二進位日誌中的詳細紀錄 |

若想深入閱讀二進位日誌，請管理者先準備對應時段的封存 SLDS，再以 DFSERA10 選取及列印需要的內容。這需要另外安排資料與權限；本練習不直接讀取正在使用的 OLDS，也不切換或封存共享日誌。

## 延伸閱讀

- [IMS /DISPLAY OLDS](https://www.ibm.com/docs/en/ims/15.4.0?topic=commands-display-olds-command)
- [DFSERA10](https://www.ibm.com/docs/en/ims/15.4.0?topic=utilities-file-select-formatting-print-utility-dfsera10)
- [IMS 日誌機制](https://www.ibm.com/docs/en/zos-basic-skills?topic=ims-logging)
- [z/OS 診斷資料收集指南](https://www.redbooks.ibm.com/redbooks/pdfs/sg247110.pdf)
