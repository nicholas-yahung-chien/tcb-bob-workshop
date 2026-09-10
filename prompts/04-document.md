請閱讀 AGENTS.md、SOURCE-MAP.md、specs/change-request.md、bank-source/reading/CKP02.TXT，以及samples/cobol/IDSHIFT.cbl、IDREC.cpy、TESTSHIFT.cbl、samples/jcl/IDSHIFT.jcl。
使用Agent，只建立 output/program.md、output/impact-analysis.md、output/facts.json。
program.md以CKP02為主，包含用途、入口、欄位表（起訖位置/長度）、流程、轉換前後例子、錯誤與限制、測試矩陣。說明其欄位內嵌而非COPY引入；另外對照IDSHIFT的copybook。每個來源結論附實際檔案及行號。
impact-analysis.md依CR-01列直接影響、可能影響、缺件與需確認角色；明示CKP02每筆REWRITE、IDSHIFT子程式無I/O、JCL只是不可直接提交的骨架。Java/API/Database的實際相依未提供；別自行新增。
facts.json必須是純JSON，鍵為 record_bytes、id_bytes、suffix_position、marker_start、marker_length、padding_positions、has_file_io、redefines_extra_bytes、synthetic、evidence。
前九項依原始CKP02填入數值、布林或位置陣列；synthetic應表示CKP02是否為合成來源。evidence是至少三筆物件的陣列，每筆有file、line（1-based整數）、quote（該行的原始文字片段），必須真實存在於bank-source/reading/CKP02.TXT。
提醒：REDEFINES不重複計算；payload389 bytes包含第14–16位。只寫output/，勿改測試或來源。
每份Markdown以1500中文字為目標。交付前確認：CKP02的R-ID=11，R-ID-1=10；R-NAME在12–51，因此EOF檢查在R-NAME內。不要宣稱原始主機code page為ASCII；Python才使用ASCII模型。重跑可能再次轉換，不保證冪等。
quote請只取不含前導縮排的精確原文子字串，不自行補空格。寫完執行python scripts/verify.py docs；不通過則僅修正output/後再驗證，直到通過或清楚回報阻礙。不能以VSAM或其他未提供的檔案組織當確定事實。
