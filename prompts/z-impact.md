請閱讀specs/change-request.md、specs/customer-context.md與output/z-lab/CKP02.cbl，以CR-01的dry-run與批次統計需求進行影響分析。
先明示分析範圍是本機工作區，還是已連線且包含這支程式的Z Understand專案；不使用無關專案推論。
列出直接變更候選、檔案與資料欄位影響、可能的下游影響、需要補充的JCL／資料集／交易／API／Database資訊。
本次只實作Python行為模型與文件；修改主機程式屬後續評估。沒有來源的Java/API/Database相依標為待確認。
每項已確認結論附檔案與行號或實際分析結果；工具不可用或沒有專案時明示限制，不宣稱已完成跨系統分析。只分析，不修改程式。
