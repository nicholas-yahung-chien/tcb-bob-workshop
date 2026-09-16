"""Export only learner-required tracked files; never package the working directory."""
from pathlib import Path
import argparse, subprocess, zipfile, json, hashlib
ROOT=Path(__file__).resolve().parents[1]
DIRS=('samples/','specs/','tests/','requests/')
FILES={'.bob/skills/data-dictionary-zh-tw/SKILL.md','.bob/rules/language.md','.bob/skills/cobol-explain-zh-tw/SKILL.md','.bob/skills/program-docs-zh-tw/SKILL.md','AGENTS.md','README.md','SOURCE-MAP.md','DOC-SPEC.md','zowe.config.json','zowe.schema.json','.gitignore','.gitattributes',
'host-lab/BOB-GUIDE.md','host-lab/CONNECTION.md','host-lab/README.md','host-lab/RC4-LAB.md','host-lab/IMS-LAB.md','z-tests/ims-run.jcl','z-tests/fixtures.json',
'z-tests/GENCKP.cbl','z-tests/CHKCKP.cbl','z-tests/IMSCKP.cbl','z-tests/run.jcl','z-tests/manifest.json',
'host-lab/PPZ-ANALYSIS.md','host-lab/IMS-ADMIN.md','host-lab/CODE-QUALITY.md','host-lab/IMS-EVENTS.md','z-tests/IMSEVT.cbl','z-tests/imsevts.jcl'}
def selected():
 names=subprocess.check_output(['git','ls-files'],cwd=ROOT,text=True).splitlines()
 return [n for n in names if (n in FILES or n.startswith(DIRS))
         and n not in {'samples/logs/ims-events.csv', 'samples/python/customer_lookup.py', 'samples/reports/sast.json', 'tests/test_lookup.py', 'specs/sast-task.md'}]
def export(dest,archive):
 names=selected()
 assert all(n.split('/')[0] not in {'.github','site','web','lessons','docs','output'} for n in names)
 assert not any(n.startswith('scripts/') for n in names)
 for n in names:
  data=(ROOT/n).read_bytes()
  if n.startswith('reference/'):
   data=data.replace(b'bank-source/reading/CKP02.TXT',b'z-lab/CKP02.cbl')
  p=dest/n; p.parent.mkdir(parents=True,exist_ok=True); p.write_bytes(data)
 manifest=[]
 original=json.loads((ROOT/'bank-source/manifest.json').read_text(encoding='utf-8'))
 for item in original:
  rel=Path(item['file'])
  suffix='.cbl' if rel.stem in ('CKP02','CIS14') else '.asm' if rel.stem in ('STANCVT','SYSOCP31') else '.cpy'
  name=(Path('z-lab')/rel.with_suffix(suffix)).as_posix()
  data=(ROOT/'bank-source/reading'/rel).read_bytes()
  assert hashlib.sha256(data).hexdigest()==item['reading_sha256']
  data=data.replace(b'\r\n',b'\n')  # UTF-8/LF for the same source on Windows and z/OSMF
  target=dest/name; target.parent.mkdir(parents=True,exist_ok=True); target.write_bytes(data)
  names.append(name); manifest.append({'file':name,'sha256':hashlib.sha256(data).hexdigest()})
 assert len(manifest)==45
 name='source-manifest.json'
 (dest/name).write_bytes((json.dumps(manifest,indent=2)+'\n').encode('utf-8')); names.append(name)
 config=json.loads((dest/'zowe.config.json').read_text(encoding='utf-8'))
 assert config['profiles']['tcb-base']['properties']['user']=='YOUR_USER_ID'
 assert 'password' not in config['profiles']['tcb-base']['properties']
 if archive:
  with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
   for n in names: z.write(dest/n,'tcb-workshop/'+n)
  with zipfile.ZipFile(archive.with_name('tcb-reference.zip'),'w',zipfile.ZIP_DEFLATED) as z:
   for p in sorted((ROOT/'reference').iterdir()):
    if p.is_file() and p.name not in {'log-analysis.md','log-facts.json','customer_lookup.py','sast-remediation.md'}:
     z.writestr('reference/'+p.name,p.read_bytes().replace(b'bank-source/reading/CKP02.TXT',b'z-lab/CKP02.cbl'))
 print('Exported',len(names),'learner files')
if __name__=='__main__':
 p=argparse.ArgumentParser(); p.add_argument('--out',type=Path,required=True); p.add_argument('--zip',type=Path)
 a=p.parse_args(); export(a.out,a.zip)
