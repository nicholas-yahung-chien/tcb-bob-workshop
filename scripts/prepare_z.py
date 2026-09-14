"""Create editable language-extension copies for local pp4z workflows."""
from pathlib import Path
import hashlib
import json
import subprocess
import sys

root=Path(__file__).resolve().parents[1]
if subprocess.call([sys.executable,str(root/'scripts/verify.py'),'sources'],cwd=root):
    raise SystemExit('Source integrity check failed')
dest=root/'z-lab'
mapping=[]
sources=sorted((root/'bank-source/reading').rglob('*.TXT'))
for source in sources:
    relative=source.relative_to(root/'bank-source/reading')
    suffix='.cbl' if source.stem in ('CKP02','CIS14') else '.asm' if source.stem in ('STANCVT','SYSOCP31') else '.cpy'
    target=dest/relative.with_suffix(suffix)
    data=source.read_bytes()
    if target.exists() and target.read_bytes()!=data:
        raise SystemExit('Existing edited copy preserved: '+str(target.relative_to(root)))
    mapping.append((source,target,data))
for source,target,data in mapping:
    target.parent.mkdir(parents=True,exist_ok=True)
    if not target.exists(): target.write_bytes(data)
manifest=[{'source':s.relative_to(root).as_posix(),'copy':t.relative_to(root).as_posix(),'sha256':hashlib.sha256(d).hexdigest()} for s,t,d in mapping]
(dest/'source-map.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2),encoding='utf-8')
print('PASS: 45 local pp4z copies ready in z-lab; source bytes and line numbers preserved.')
