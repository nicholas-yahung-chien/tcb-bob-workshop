"""Export only learner-required tracked files; never package the working directory."""
from pathlib import Path
import argparse, subprocess, zipfile, json
ROOT=Path(__file__).resolve().parents[1]
DIRS=('bank-source/','samples/','specs/','reference/','tests/')
FILES={'AGENTS.md','README.md','SOURCE-MAP.md','DOC-SPEC.md','zowe.config.json','zowe.schema.json','.gitignore','.gitattributes','scripts/verify.py',
'host-lab/BOB-GUIDE.md','host-lab/CONNECTION.md','host-lab/README.md','host-lab/fixtures.json',
'host-lab/templates/CKP02.cbl','host-lab/templates/GENCKP.cbl','host-lab/templates/CHKCKP.cbl','host-lab/templates/run.jcl','host-lab/templates/manifest.json'}
def selected():
 names=subprocess.check_output(['git','ls-files'],cwd=ROOT,text=True).splitlines()
 return [n for n in names if n in FILES or n.startswith(DIRS)]
def export(dest,archive):
 names=selected()
 assert all(n.split('/')[0] not in {'.github','site','web','lessons','docs','output'} for n in names)
 assert [n for n in names if n.startswith('scripts/')]==['scripts/verify.py']
 for n in names:
  p=dest/n; p.parent.mkdir(parents=True,exist_ok=True); p.write_bytes((ROOT/n).read_bytes())
 config=json.loads((dest/'zowe.config.json').read_text(encoding='utf-8'))
 assert config['profiles']['tcb-base']['properties']['user']=='YOUR_USER_ID'
 assert 'password' not in config['profiles']['tcb-base']['properties']
 if archive:
  with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
   for n in names: z.write(dest/n,'tcb-workshop/'+n)
 print('Exported',len(names),'learner files')
if __name__=='__main__':
 p=argparse.ArgumentParser(); p.add_argument('--out',type=Path,required=True); p.add_argument('--zip',type=Path)
 a=p.parse_args(); export(a.out,a.zip)
