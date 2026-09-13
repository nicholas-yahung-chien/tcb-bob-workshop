"""Check the executed CKP02 steps and comparison output in downloaded JES files."""
from pathlib import Path
import argparse,json,re

STEPS=['ALLOC','CGEN','LGENCKP','CCKP','LCKP02','CCHK','LCHKCKP',
       'GENERATE','RUNONCE','CHECK1','RUNTWICE','CHECK2','RUNEMPTY']
KNOWN_WARNINGS={'IGYLI0090-W','IGYSC0205-W','IGYCB7310-W'}

def verify(root,owner=None):
    messages=(root/'JES2/JESYSMSG.txt').read_text(encoding='utf-8')
    pairs=re.findall(r'IEF142I\s+\S+\s+(\S+) - STEP WAS EXECUTED - COND CODE (\d+)',messages)
    if [step for step,rc in pairs]!=STEPS:
        raise ValueError('步驟缺漏、重複或順序不同，請檢查 JESYSMSG。')
    codes={step:int(rc) for step,rc in pairs}
    if any(codes[s] not in ([0,4] if s=='CCKP' else [0]) for s in STEPS):
        raise ValueError('有步驟未正常完成：'+str(codes))
    warnings=set(re.findall(r'IGY\w+-W',(root/'CCKP/SYSPRINT.txt').read_text(encoding='utf-8')))
    if warnings-KNOWN_WARNINGS:
        raise ValueError('出現尚未核對的編譯警告：'+str(warnings-KNOWN_WARNINGS))
    if codes['CCKP']==4 and not warnings:
        raise ValueError('編譯 RC 4，但缺少對應警告清單。')
    for step in ['CHECK1','CHECK2']:
        text=(root/step/'SYSOUT.txt').read_text(encoding='utf-8')
        passed=re.findall(r'CASE (\d{4}) PASS ALL 400 BYTES',text)
        if passed!=[f'{i:04d}' for i in range(1,8)] or 'CHECKED=0007 ERRORS=0000' not in text:
            raise ValueError(step+' 未完成七筆完整比對。')
        if re.search(r'\bFAIL(?:ED)?\b',text):raise ValueError(step+' 含失敗訊息。')
    if owner:
        log=(root/'JES2/JESMSGLG.txt').read_text(encoding='utf-8')
        if not re.search(r'USERID\s+'+re.escape(owner)+r'\s+IS ASSIGNED',log):
            raise ValueError('JES 紀錄的執行身分與指定帳號不符。')
    return {'passed':True,'owner_checked':owner,'step_codes':codes,
            'warnings':sorted(warnings),'records_per_comparison':7,'bytes_per_record':400}

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('spool',type=Path);p.add_argument('--owner')
    args=p.parse_args()
    print(json.dumps(verify(args.spool,args.owner),ensure_ascii=False,indent=2))
