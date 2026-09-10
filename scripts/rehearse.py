import argparse, hashlib, json, os, pathlib, shutil, subprocess, sys, time
ROOT=pathlib.Path(__file__).resolve().parents[1]
REPO=ROOT
parser=argparse.ArgumentParser(); parser.add_argument('name'); parser.add_argument('--tasks',default='01-ask:ask,02-plan:plan,03-plan-deliver:agent,04-document:agent,05-unit:agent,07-logs:agent,08-sast:agent'); args=parser.parse_args()
dest=ROOT/'verification'/'runs'/args.name
if dest.exists(): raise SystemExit('Fresh workspace required')
shutil.copytree(REPO,dest,ignore=shutil.ignore_patterns('.git','output','reference','verification','site','__pycache__'))
node=shutil.which('node')
bob=pathlib.Path(os.environ['APPDATA'])/'npm/node_modules/bobshell/dist/bob.js'
env=os.environ.copy()
if not env.get('BOB_API_KEY'):
    import winreg
    with winreg.OpenKey(winreg.HKEY_CURRENT_USER,'Environment') as k:
        env['BOB_API_KEY']=winreg.QueryValueEx(k,'BOB_API_KEY')[0]
def hashes():
    return {str(p.relative_to(dest)):hashlib.sha256(p.read_bytes()).hexdigest() for folder in ('samples','tests','scripts','specs','prompts','bank-source') for p in (dest/folder).rglob('*') if p.is_file() and '__pycache__' not in str(p)}
before=hashes(); results=[]
logdir=ROOT/'verification'/'raw'/args.name; logdir.mkdir(parents=True)
for step in args.tasks.split(','):
    stem,mode=step.split(':'); prompt=(dest/'prompts'/f'{stem}.md').read_text(encoding='utf-8')
    start=time.time()
    command=[node,str(bob),'run','--workspace',str(dest),'--mode',mode,'--disable-mcp','--disable-subagents','--max-turns','45','--format','json',prompt]
    print(f'START {args.name} {stem}',flush=True)
    try:
        proc=subprocess.run(command,cwd=dest,env=env,capture_output=True,timeout=600)
        out=proc.stdout.decode('utf-8',errors='replace'); err=proc.stderr.decode('utf-8',errors='replace')
        (logdir/f'{stem}.json').write_text(out,encoding='utf-8')
        (logdir/f'{stem}.stderr.txt').write_text(err,encoding='utf-8')
        try:
            events=[json.loads(line) for line in out.splitlines() if line.strip()]
            payload=next(event for event in reversed(events) if event.get('type')=='result')
            status=payload.get('status'); stats=payload.get('stats',{})
            if any(event.get('type')=='error' for event in events): status='error-event'
        except (ValueError,StopIteration): status='invalid-json'; stats={}
        target={'03-plan-deliver':'plan','04-document':'docs','05-unit':'unit','07-logs':'logs','08-sast':'sast'}.get(stem)
        check=None
        if target:
            validation=subprocess.run([sys.executable,'scripts/verify.py',target],cwd=dest,capture_output=True)
            check=validation.returncode==0
            (logdir/f'{stem}.validation.txt').write_bytes(validation.stdout+validation.stderr)
        record={'step':stem,'mode':mode,'status':status,'exit_code':proc.returncode,'elapsed_seconds':round(time.time()-start,1),'check_passed':check,'stats':stats}
    except subprocess.TimeoutExpired as exc:
        (logdir/f'{stem}.timeout.stdout.txt').write_bytes(exc.stdout or b'')
        (logdir/f'{stem}.timeout.stderr.txt').write_bytes(exc.stderr or b'')
        record={'step':stem,'mode':mode,'status':'timeout','elapsed_seconds':600,'check_passed':False}
    record['protected_files_unchanged']=hashes()==before
    results.append(record)
    (logdir/'summary.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(record,ensure_ascii=False),flush=True)
print('COMPLETE '+args.name,flush=True)
