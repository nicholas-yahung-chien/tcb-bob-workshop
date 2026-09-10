# 合成IMS事件摘要分析

這是教學CSV，不是原始IMS binary log。

DEMO-A：E01 GU OK → E02 GNP GE → E03 END NORMAL。結論：摘要顯示正常結束；不能將GE單獨當成整筆失敗。
DEMO-B：E04 GU OK → E05 ISRT II → E06 ROLB OK → E07 END FAILED。結論：出現重複segment狀態，後續回復操作成功，流程失敗。重送是可能假設，尚未有請求／重試證據，不能宣稱根因已確定或外部副作用均回復。
DEMO-C：E08 GU OK耗時2500ms，沒有END。結束狀態未知；需補齊後續事件、觀察窗口、平台追蹤與資源指標，才能排除截斷或查明慢事件原因。

目前沒有證據支持死鎖、網路中斷或資料毀損的定論。event耗時也不是完整交易時間；不應將E08數值直接報成端到端延遲。
