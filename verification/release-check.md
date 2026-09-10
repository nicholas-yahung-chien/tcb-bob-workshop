# 發布與下載驗收

本工作坊的發布後驗收紀錄維護於[main分支的本頁](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/blob/main/verification/release-check.md)。下載分支及release保留發布時的教材快照。

本機已驗證：11頁網站連結／標題／複製目標、完整45份原始碼及45份閱讀版雜湊、全新工作區備援還原及全部驗收、Git暫存區91個來源相關檔案位元組一致。

網站部署結果見[GitHub Actions](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/actions)。固定教材版本見[Releases](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases)。

## 2026/09/10 正式發布驗收

- [Pages部署34485971778](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/actions/runs/34485971778)成功。Ubuntu／Python 3.12完成來源雜湊、網站建置、11頁檢查及備援答案全部驗收。
- 教材下載分支`workshop/tcb-2026`為獨立歷史，固定commit：`89daa3dd585d901076d911a9c00994c53a0ca8bc`；tag：`workshop-v1.0.0`。
- 從GitHub重新clone上述分支，執行preflight、備援還原、verify all、check_site，全數通過（11+3+6測試、固定事實／引文、45份原始碼及45份閱讀版）。
- 正式網站首頁、需求規劃頁、成果頁、CSS與JavaScript皆HTTP 200；Edge開啟正式工作坊首頁，版面與導航正確。
- [固定版本ZIP](https://github.com/nicholas-yahung-chien/tcb-bob-workshop/releases/download/workshop-v1.0.0/tcb-workshop-v1.0.0.zip) SHA-256：`571541bc06cd158e74e57a270e566f7bd1d581c40071670d3ca415cbe2c7d00b`。

兩場請使用同一tag／commit與全新學員工作區。此頁後續維護發布紀錄，不改動已凍結的教材tag。
