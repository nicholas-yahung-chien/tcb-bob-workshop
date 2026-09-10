# 合作金庫 IBM Bob Workshop

2026/09/21（一）、09/24（四），兩場內容相同。此repo提供Nicholas Chien負責的30分鐘需求規劃與共同授課60分鐘COBOL實作教材。

**[進入教學網站](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/)** · [工作坊索引](https://nicholas-yahung-chien.github.io/tcb-bob-workshop/workshops/tcb/) · [驗證報告](verification/report.md)

## 學員開始

```sh
git clone --single-branch --branch workshop/tcb-2026 https://github.com/nicholas-yahung-chien/tcb-bob-workshop.git tcb-bob-workshop
cd tcb-bob-workshop
python scripts/preflight.py
```

需要Python 3.10+、Git與可用的Bob IDE或Shell；無Python套件依賴。以Bob開啟此資料夾，依網站順序貼上prompts/內容。Windows可用`py -3`取代`python`。

## 交付與操作

| 時段 | 負責 | 產出 |
|---|---|---|
| 14:30–15:00 | Nicholas | output/architecture.md、checklist.md |
| 15:15–16:15 | Jackson / Nicholas | program.md、impact-analysis.md、行為模型與單元測試；IMS/SAST短示範 |

13:30入門與16:15 Q&A由Haowen負責；agenda至16:45，活動標示至17:00，最後15分鐘未排定。

- `bank-source/raw/`：經使用者確認可公開的45份合庫原始碼，原始bytes保留。
- `bank-source/reading/`：UTF-8閱讀版；編碼例外詳manifest。
- `samples/`：另編的合成COBOL／Python／JCL／log／SAST範例。
- `specs/`：假設需求、介面契約、素材背景。
- `prompts/`：可直接複製的Ask／Plan／Agent操作。
- `tests/`、`scripts/verify.py`：獨立驗收；不要修改以通過測試。
- `reference/`：講師參考與離線備援。
- `site/`：可直接離線開啟的靜態教學網站。
- `output/`：學員產出，不進git。

```sh
python scripts/verify.py plan
python scripts/verify.py docs
python scripts/verify.py unit
python scripts/verify.py logs
python scripts/verify.py sast
```

各驗收須先完成對應產出。文件仍須人工核對來源是否支持結論。Bob生成文字可能不同，固定的是來源事實、介面、測試與成果規準，不保證逐字一致。

## 講師與維護者

離線打開`site/workshops/tcb/07-instructor.html`。完整課程包含逐分鐘安排、Premium路徑與一般Bob替代、常見失敗修正、兩場重置步驟。

```sh
python scripts/build_site.py
python scripts/check_site.py
python -m http.server 8765 --directory site
```

建站使用Python標準庫；main透過GitHub Actions部署site/。`workshop/tcb-2026`是獨立歷史的學員下載分支，發布後需明確同步新版本，不能把它merge回main。使用release tag固定兩場的教材版本。

## 驗證界線

講師可在 Windows、已透過 npm 安裝 Bob Shell 的環境，以 `python scripts/rehearse.py rehearsal-01` 建立全新演練工作區並依序呼叫七個提示。API key 由程序環境或 Windows 使用者環境讀取；不寫入教材。每步最多 45 回合、600 秒；這是離線課前演練工具，完整執行會產生模型用量。詳細輸出留在被 Git 忽略的 `verification/raw/`，結果與工作區分開保存。命令成功不代表內容正確，仍需核對驗收結果與人工規準。

Bob Shell製作基準2.0.2。Python行為模型與本機SQLite可執行；本環境未驗證COBOL編譯、IMS runtime、真實主機log、Premium授權／Z專用工具或Fortify/Checkmarx複掃。合成JCL不可直接提交正式主機。

原始程式的權利仍屬原權利人，公開此份教材不代表另授予任意再利用授權。工作單截圖及報名名單不在此repo，改以空白工作單模板提供練習。

網站風格與教學層級參考[Haowen的IBM Bob Workshop Hub](https://hw.is-a.dev/ibm-bobathon/)及[原repo](https://github.com/howard-haowen/ibm-bobathon)；本站教材、範例與驗收工具另行製作。Codex與IBM Bob Shell共同參與規劃、分析及演練。
