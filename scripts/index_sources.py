"""Mechanical source index; not a COBOL/HLASM parser or proof of runtime linkage."""
from pathlib import Path
import json
import re

ROOT=Path(__file__).resolve().parents[1]
source=ROOT/'bank-source/reading'
known={p.stem for p in source.rglob('*.TXT')}
index=[]
for file in sorted(source.rglob('*.TXT')):
    lines=file.read_text(encoding='utf-8').splitlines()
    asm=file.name in ('SYSOCP31.TXT','STANCVT.TXT')
    active=[(i,line) for i,line in enumerate(lines,1) if not (line.startswith('*') if asm else len(line)>6 and line[6] in '*/')]
    def matches(pattern):
        found=[]
        for i,line in active:
            m=re.search(pattern,line[:72])
            if m: found.append({'name':m.group(1),'line':i})
        return found
    copies=matches(r'\bCOPY\s+[\'"]?([A-Z0-9_-]+)')
    calls=matches(r'\bCALL\s+[\'"]?([A-Z0-9_-]+)')
    groups=matches(r'^.{7}\s*01\s+([A-Z0-9_-]+)') if not asm else matches(r'^([A-Z0-9]+)\s+(?:CSECT|DSECT|EQU)\b')
    index.append({'file':file.relative_to(source).as_posix(),'lines':len(lines),
                  'language':'HLASM' if asm else 'COBOL/copybook','copy':copies,
                  'missing_copy':sorted({c['name'] for c in copies if c['name'] not in known}),
                  'literal_calls':calls,'groups_or_labels':groups})
dest=ROOT/'docs'; dest.mkdir(exist_ok=True)
(dest/'source-index.json').write_text(json.dumps(index,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
rows=['# 原始碼結構索引','', '自動索引所有45份閱讀版。只辨識文字中的COPY、literal CALL與01/label；不解析巨集、不證明呼叫可達性或runtime設定。完整資訊見source-index.json。','', '| 檔案 | 行數 | 群組／標籤摘要 | 缺少COPY |','|---|---:|---|---|']
for item in index:
    groups=', '.join(g['name'] for g in item['groups_or_labels'][:6])
    if len(item['groups_or_labels'])>6: groups+='…'
    rows.append(f"| {item['file']} | {item['lines']} | {groups} | {', '.join(item['missing_copy']) or '無文字層級缺件'} |")
(dest/'source-index.md').write_text('\n'.join(rows)+'\n',encoding='utf-8')
print(f'Indexed {len(index)} source files')
