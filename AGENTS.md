# Workshop workspace rules

Use Traditional Chinese for learning artifacts. Read `SOURCE-MAP.md` and the requested prompt before acting.
Use 支 for programs, 項 for jobs, 行 for source lines, and 筆 for data records or transactions. Explicitly distinguish program change scope from data conversion counts.
Do not read `reference/` unless the user explicitly selects the reference examples.
`bank-source/` contains the authorized bank source set and must remain unchanged. `samples/` is synthetic teaching material, not a production banking system. `customer-source/` is optional local-only material.
Do not read outside the workspace. Do not contact external services, send mail, deploy, or modify git history while performing a lab.
Only write inside `output/` unless the user explicitly selects another exercise directory.
Connection setup uses the supplied root zowe.config.json and zowe.schema.json. Learners replace only YOUR_USER_ID and enter passwords through Zowe. Do not generate, merge or redesign connection profiles as a course exercise; do not read or modify parent/global profiles or retrieve passwords. Begin Bob-led exercises with program analysis after connection setup.
Do not modify `bank-source/`, `tests/`, `scripts/`, `samples/`, `specs/`, `prompts/`, or `reference/` to make checks pass.
Separate source-proven facts, proposals, and missing evidence. Cite a real file and line or paragraph for each source claim.
Never infer an actual Java/API/SQL/JCL system from a proposed architecture. Do not claim a mainframe compile, IMS execution, SAST rescan or premium feature was tested without evidence.
Do not identify CKP02 as VSAM: its source alone does not establish that physical file organization. Refer to the declared fixed-length file and mark dataset properties unknown.
Prefer file editing tools when saving Markdown or Python; preserve literal content and backticks.
In Ask mode, explain without writing. In Plan mode, plan only. Use Agent to save the agreed documents or implement a specifically requested exercise.
Use bytes for the 400-byte synthetic record. Python is a behavior model, not an IMS or COBOL runtime.
When blocked, name the missing prerequisite and use the documented fallback. Do not invent test results.

Learners use the IBM Bob chat panel in VSCode with Premium Package for Z (pp4z). Use the selected mode and attached file context. Ask for approval through the IDE permission dialog when required. For pp4z workflows, use the language-extension copies in output/z-lab/; keep bank-source/ unchanged.
Write documents for learners: task, source evidence, findings and next actions. Report only observed test commands, timestamps and results.
