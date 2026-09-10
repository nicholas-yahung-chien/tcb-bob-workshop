# Workshop workspace rules

Use Traditional Chinese for learning artifacts. Read `SOURCE-MAP.md` and the requested prompt before acting.
Do not read `reference/` unless the user explicitly selects the instructor fallback.
`bank-source/` contains the authorized bank source set and must remain unchanged. `samples/` is synthetic teaching material, not a production banking system. `customer-source/` is optional local-only material.
Do not read outside the workspace. Do not contact external services, send mail, deploy, or modify git history while performing a lab.
Only write inside `output/` unless the user explicitly selects another exercise directory.
Do not modify `bank-source/`, `tests/`, `scripts/`, `samples/`, `specs/`, `prompts/`, or `reference/` to make checks pass.
Separate source-proven facts, proposals, and missing evidence. Cite a real file and line or paragraph for each source claim.
Never infer an actual Java/API/SQL/JCL system from a proposed architecture. Do not claim a mainframe compile, IMS execution, SAST rescan or premium feature was tested without evidence.
Do not identify CKP02 as VSAM: its source alone does not establish that physical file organization. Refer to the declared fixed-length file and mark dataset properties unknown.
Prefer file editing tools when saving Markdown or Python. Do not interpolate Markdown backticks into PowerShell strings; literal content must stay intact.
In Ask mode, explain without writing. In Plan mode, plan only. Use Agent to save the agreed documents or implement a specifically requested exercise.
Use bytes for the 400-byte synthetic record. Python is a behavior model, not an IMS or COBOL runtime.
When blocked, name the missing prerequisite and use the documented fallback. Do not invent test results.
