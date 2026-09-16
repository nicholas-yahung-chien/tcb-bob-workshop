"""Publisher-only checks across course prompts, learner export and connection metadata."""
import hashlib
import json
import re
from pathlib import Path
from urllib.parse import unquote, urlsplit
from package_learners import selected

ROOT = Path(__file__).resolve().parents[1]
exported = set(selected()) | {'source-manifest.json'}
for item in json.loads((ROOT/'bank-source/manifest.json').read_text(encoding='utf-8')):
    rel = Path(item['file'])
    suffix = '.cbl' if rel.stem in ('CKP02','CIS14') else '.asm' if rel.stem in ('STANCVT','SYSOCP31') else '.cpy'
    exported.add((Path('z-lab')/rel.with_suffix(suffix)).as_posix())

contexts = json.loads((ROOT/'lessons/prompt-context.json').read_text(encoding='utf-8'))
generated = {'host-lab/run.jcl', 'host-lab/environment.md'}
used = set()
for page in (ROOT/'lessons').glob('*.html'):
    text = page.read_text(encoding='utf-8')
    for stem in re.findall(r'\{\{([^|{}]+)\|[^{}]+\}\}', text):
        used.add(stem)
        assert (ROOT/'prompts'/f'{stem}.md').is_file(), (page, stem)
        for name in contexts[stem]['files']:
            if name in generated or name.startswith(('output/', 'host-lab/logs/', 'reference/')):
                continue
            assert name in exported or any(f.startswith(name.rstrip('/')+'/') for f in exported), (page, stem, name)
    for url in re.findall(r'href="([^"]+)"', text):
        parts = unquote(urlsplit(url).path)
        for branch in ('workshop/tcb-2026', 'main'):
            marker = '/tcb-bob-workshop/blob/'+branch+'/'
            if marker in parts:
                target = parts.split(marker, 1)[1]
                assert target in exported if branch != 'main' else (ROOT/target).is_file(), (page, url)

config = json.loads((ROOT/'zowe.config.json').read_text(encoding='utf-8'))
assert set(config['profiles']) == {'tcb-rse', 'tcb-base'}
assert config['profiles']['tcb-rse']['properties']['encoding'] == 'IBM-1371'
assert 'jobEncoding' not in config['profiles']['tcb-rse']['properties']
assert config['profiles']['tcb-base']['properties']['user'] == 'YOUR_USER_ID'
m = json.loads((ROOT/'z-tests/manifest.json').read_text(encoding='utf-8'))
assert m['connection_encoding'] == 'IBM-1371' and m['connection_profile'] == 'tcb-rse'
assert 'jcl_encoding' not in m, 'Use explicitly historical initial_jcl_transfer_encoding instead'
for name, digest in m['sha256'].items():
    assert hashlib.sha256((ROOT/'z-tests'/name).read_bytes()).hexdigest() == digest, name
active = [ROOT/'DOC-SPEC.md', ROOT/'README.md', ROOT/'SOURCE-MAP.md',
          *(ROOT/'specs').glob('*.md'), *(ROOT/'host-lab').glob('*.md'),
          *(ROOT/'lessons').glob('*.html'),
          *(ROOT/'prompts'/f'{name}.md' for name in used)]
for file in active:
    text = file.read_text(encoding='utf-8')
    for stale in ('tcb-jobs', 'tcb-zosmf', 'output/z-lab', 'output/host-lab',
                  'customer-email.txt', 'specs/change-request.md', 'templates/',
                  '以 IBM-1047 提交', '主機使用 IBM-1047', '檢查程式會核對'):
        assert stale not in text, (file, stale)
print(f'PASS: {len(used)} course prompts; packaged attachments, repository links, encoding and helper hashes.')
