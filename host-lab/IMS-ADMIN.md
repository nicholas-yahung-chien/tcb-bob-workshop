# 從系統管理者角度閱讀 IMS 子系統紀錄

本練習讀取共享 IMS 子系統現有的真實紀錄，練習辨認事件、整理時間線與提出後續查詢。沿用 tcb-rse／IBM-1371。沒有新增測試程式，也不需要重跑 IMSRUN 或 IMSEVTS；兩者是獨立批次資料庫練習，不能取代共享 control region 的證據。

## 已驗證的環境與範圍

2026-09-17 唯讀盤點，主機 VS01 回應 IMSID IVP1：

| 區域 | 工作名稱 | 當時的 STC ID |
|---|---|---|
| Control region | IMS15CR1 | STC00624 |
| DL/I separate address space | IMS15DL1 | STC00625 |
| DBRC | IMS15RC1 | STC00626 |

33 個講師與學員帳號已逐一透過 RSE API 讀取 control region 的 JESMSGLG。另以學員帳號讀回上述三區域的 JESMSGLG、JESYSMSG、JESJCL。這驗證指定紀錄可讀取，不代表已授予任何控制台操作權限。本次沒有新增或擴大 RACF 權限。

工作重啟後 ID 可能改變。請核對當前 ACTIVE 工作與日期，不把表中的 ID 當成永久設定，也不要取消、清除或重新提交這些共享工作。

## 1. 學員從遠端取得紀錄

1. 在 Zowe Explorer 的「工作 → tcb-rse」調整搜尋條件：Owner 為 IBMUSER、Prefix 為 IMS15*，清除僅顯示 OUTPUT 的狀態篩選。依版本的篩選介面操作，重新整理。
2. 找到目前 ACTIVE 的 IMS15CR1、IMS15DL1、IMS15RC1。若找不到，先核對篩選與目前工作名稱，請講師確認；不要改動共享系統。
3. 開啟各自的 JESMSGLG、JESYSMSG、JESJCL，載入完整內容，確認無亂碼後另存 UTF-8。建議用「STC ID-DD 名稱.txt」命名並保存在 host-lab/logs/ims-admin/。同一 DD 再次擷取時以時間另存，保留前一份觀測。
4. 建立簡短的 collection.md，記錄主機、IMSID、工作名稱／ID、Owner、DD、擷取時間、檔案涵蓋日期與時間基準、是否已載入全部頁面。下載時間不等於事件發生時間；API 顯示的 EDT 與 JES 本文時間不可直接假定相同。
5. 完成後把 Zowe Explorer 的 Owner 篩選改回自己的帳號。將實際保存的紀錄資料夾及本指引加入 Bob；只附本指引不能分析自己尚未提供的紀錄。

讀取不到時記下拒絕訊息，請講師提供該時段的真實紀錄副本並註明擷取者及時間。不改用模擬 CSV，也不使用其他學員的批次作業假裝是 control region。

## 2. Ask：理解時間線

> 這是剛從主機取得的 IMS 系統紀錄。請幫我看這段時間發生了什麼，有哪些訊息值得留意。請指出時間、訊息代碼和來源檔案；如果還不能判斷原因，告訴我需要再查哪些紀錄。

先核對日期分隔、來源區域與訊息，再整理啟動、region 啟停、警告與日誌狀態。引用 STC ID、DD、行號及完整訊息代碼。ACTIVE 工作沒有最終 RC，不能套用已結束批次作業的成功條件。舊的 IMS READY 只證明當時曾就緒，不保證現在的健康狀態。

本次實際取得過 DFS996I、DFS551I、DFS552I、DFS2864I 以及 /DISPLAY OLDS 的回應；你取得的期間可能不同。先找出自己檔案是否存在，不照抄預定結論。DFS2864I 描述 external trace 資料集切換，不要混同 OLDS 日誌切換，也不能只憑這則訊息宣稱資料遺失。

## 3. Plan：安排唯讀調查

> 如果我是值班的系統管理者，接下來應該先查什麼？請依剛才的紀錄說明理由，先以不影響系統運作的查詢為主。

必要時由講師／已授權管理者補充同一時段的 SYSLOG 節錄及 DISPLAY 回應，保存完整指令、回應、時間與 IMSID。本次盤點使用 D A,IMS15* 與 /DIS OLDS ALL；它們不是要求學員執行的步驟。取得 SYSLOG 的介面與權限尚未列為本練習已驗證的學員功能。

已觀測的 /DISPLAY OLDS 回應包含 IN USE、AVAILABLE 與 SCHEDULED。SCHEDULED 不等於 archive 已完成；單一時點的 RATE=0 也不能證明沒有業務活動。分析應依對應 IMS 版本的官方訊息／指令文件核對，不能因訊息代碼包含 I 就忽略內容。

本練習只分析及規劃查詢，不發出 START、STOP、切換 OLDS、修改 RECON 或啟用 trace 等改變系統狀態的操作。

## 4. Agent：保存值班交接紀錄

> 請把剛才確認的事件、判斷依據和待查事項整理成值班交接紀錄，存到 host-lab/ims/admin-report.md。保留各份紀錄的來源和取得時間。

報告包含：觀測範圍、紀錄清單、事件時間線、已確認事項、推測及依據、缺少的證據、後續唯讀查詢。每項結論能回到自己的原始紀錄；目前未提供的資料就標待確認。

## 深入二進位系統日誌：有前置條件的延伸

IMS OLDS／SLDS 與 JES 訊息不是同一種資料。DFSERA10 可選取日誌紀錄，輸出字元與十六進位列印；應依紀錄類型及需要的格式化出口判讀，不把十六進位列印直接當成可閱讀的交易報告。

本次已確認活動 OLDS 狀態，但 IMS15.* 目錄查詢未識別到可用的封存 SLDS，亦未完成 archive 作業／RECON 對照；不代表整部主機不存在 SLDS。因此尚不提供可直接提交的共享系統日誌列印 JCL。

後續由管理者確認目標時段、已封存 SLDS 名稱、資料敏感性、唯讀權限與適當選取條件，再準備 DFSERA10 列印。活動 OLDS 不直接當成學員輸入，也不為課堂強制切換或封存共享日誌。未備妥 SLDS 時，完成前面的 JES 區域紀錄閱讀即可，報告標明未分析二進位日誌。

## IBM 官方依據

- [IMS /DISPLAY OLDS](https://www.ibm.com/docs/en/ims/15.4.0?topic=commands-display-olds-command)
- [DFSERA10](https://www.ibm.com/docs/en/ims/15.4.0?topic=utilities-file-select-formatting-print-utility-dfsera10)
- [IMS 日誌機制](https://www.ibm.com/docs/en/zos-basic-skills?topic=ims-logging)
- [z/OS 診斷資料收集指南](https://www.redbooks.ibm.com/redbooks/pdfs/sg247110.pdf)

以上引用說明操作原理；實際 IMS 執行版本需由環境資料確認，不以 library 路徑中的版本字樣代替執行版本證據。
