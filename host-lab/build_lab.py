"""Create a fixed-format, per-job CKP02 experiment; never submit it here."""
from pathlib import Path
import argparse, hashlib, json, re

ROOT = Path(__file__).resolve().parents[1]

def fixed(lines):
    result=['       '+s if s else '      *' for s in lines]
    assert all(len(s)<=72 for s in result), [s for s in result if len(s)>72]
    return '\n'.join(result)+'\n'

def generator(cases):
    lines=['IDENTIFICATION DIVISION.','PROGRAM-ID. GENCKP.',
      'ENVIRONMENT DIVISION.','INPUT-OUTPUT SECTION.','FILE-CONTROL.']
    for f,dd in [('A','WORKDD'),('B','EXP1DD'),('C','EXP2DD'),('D','EMPTYDD')]:
        lines += [f'    SELECT FILE-{f} ASSIGN TO {dd}.']
    lines+=['DATA DIVISION.','FILE SECTION.']
    for f in 'ABCD': lines += [f'FD FILE-{f} RECORD CONTAINS 400 CHARACTERS.',f'01 REC-{f} PIC X(400).']
    lines+=['PROCEDURE DIVISION.','    OPEN OUTPUT FILE-A FILE-B FILE-C FILE-D.']
    for i,c in enumerate(cases,1):
        lines += ['    MOVE ALL "Q" TO REC-A.',f'    MOVE "{c["id"]}" TO REC-A(1:10).',
          '    MOVE "K" TO REC-A(11:1).',
          f'    MOVE "{c["marker"]}" TO REC-A({c["marker_position"]}:3).',
          f'    MOVE "{i:04d}" TO REC-A(397:4).',
          '    MOVE REC-A TO REC-B REC-C.',
          f'    MOVE "{c["once"]}" TO REC-B(1:10).',
          f'    MOVE "{c["twice"]}" TO REC-C(1:10).',
          '    WRITE REC-A.','    WRITE REC-B.','    WRITE REC-C.']
    lines+=['    CLOSE FILE-A FILE-B FILE-C FILE-D.',
      f'    DISPLAY "FIXTURES={len(cases)}; RECORD-LENGTH=400".',
      '    MOVE ZERO TO RETURN-CODE.','    STOP RUN.']
    return fixed(lines)

def checker(count):
    return fixed(['IDENTIFICATION DIVISION.','PROGRAM-ID. CHKCKP.',
      'ENVIRONMENT DIVISION.','INPUT-OUTPUT SECTION.','FILE-CONTROL.',
      '    SELECT ACTUAL ASSIGN TO ACTUALDD FILE STATUS FS-A.',
      '    SELECT EXPECTED ASSIGN TO EXPECTDD FILE STATUS FS-E.',
      'DATA DIVISION.','FILE SECTION.',
      'FD ACTUAL RECORD CONTAINS 400 CHARACTERS.', '01 REC-A PIC X(400).',
      'FD EXPECTED RECORD CONTAINS 400 CHARACTERS.','01 REC-E PIC X(400).',
      'WORKING-STORAGE SECTION.','01 FS-A PIC XX.','01 FS-E PIC XX.',
      '01 CASE-N PIC 9(4) VALUE ZERO.','01 ERRORS PIC 9(4) VALUE ZERO.',
      'PROCEDURE DIVISION.','    OPEN INPUT ACTUAL EXPECTED.',
      '    IF FS-A NOT = "00" OR FS-E NOT = "00"',
      '        DISPLAY "OPEN FAILED " FS-A " " FS-E',
      '        MOVE 12 TO RETURN-CODE', '        STOP RUN', '    END-IF.',
      '    PERFORM UNTIL FS-A = "10" OR FS-E = "10"',
      '        READ ACTUAL', '        READ EXPECTED',
      '        EVALUATE TRUE',
      '          WHEN FS-A = "00" AND FS-E = "00"',
      '            ADD 1 TO CASE-N',
      '            IF REC-A = REC-E',
      '                DISPLAY "CASE " CASE-N " PASS ALL 400 BYTES"',
      '            ELSE',
      '                ADD 1 TO ERRORS',
      '                DISPLAY "CASE " CASE-N " FAIL"',
      '            END-IF',
      '            DISPLAY "ACTUAL-ID=[" REC-A(1:10) "]"',
      '            DISPLAY "EXPECT-ID=[" REC-E(1:10) "]"',
      '          WHEN FS-A = "10" AND FS-E = "10"',
      '            CONTINUE',
      '          WHEN OTHER',
      '            DISPLAY "READ OR COUNT FAILED " FS-A " " FS-E',
      '            ADD 1 TO ERRORS',
      '            MOVE "10" TO FS-A FS-E',
      '        END-EVALUATE', '    END-PERFORM.',
      f'    IF CASE-N NOT = {count} ADD 1 TO ERRORS END-IF.',
      '    CLOSE ACTUAL EXPECTED.',
      '    DISPLAY "CHECKED=" CASE-N " ERRORS=" ERRORS.',
      '    IF ERRORS = ZERO MOVE ZERO TO RETURN-CODE',
      '    ELSE MOVE 8 TO RETURN-CODE END-IF.', '    STOP RUN.'])

def compile_step(step,name,source,source_dataset):
    s=[f'//{step} EXEC PGM=IGYCRCTL,REGION=256M,',
      "// PARM='LIB,OBJECT,RENT,LIST,MAP,XREF,CODEPAGE(937),DBCS'",
      '//STEPLIB DD DSN=IGY.V6R4M0.SIGYCOMP,DISP=SHR',
      '//SYSPRINT DD SYSOUT=*',
      f'//SYSLIN DD DSN=&&{name},DISP=(NEW,PASS),',
      '// UNIT=SYSDA,SPACE=(TRK,(5,5)),DCB=(RECFM=FB,LRECL=80)',
      '//SYSMDECK DD UNIT=SYSDA,SPACE=(TRK,(1,1))']
    for n in range(1,16): s += [f'//SYSUT{n} DD UNIT=SYSDA,SPACE=(CYL,(1,1))']
    s += [f'//SYSIN DD DSN={source_dataset}({name}),DISP=SHR']
    s += [f'// IF ({step}.RC LE 4) THEN',
      f'//L{name} EXEC PGM=IEWL,PARM=\'LIST,MAP,XREF\'',
      '//SYSLIB DD DSN=CEE.SCEELKED,DISP=SHR',
      f'//SYSLIN DD DSN=&&{name},DISP=(OLD,DELETE)',
      '//SYSPRINT DD SYSOUT=*','//SYSUT1 DD UNIT=SYSDA,SPACE=(CYL,(1,1))',
      f'//SYSLMOD DD DSN=&&LOAD({name}),DISP=(OLD,PASS)', '// ENDIF']
    return s

def run_step(step,program):
    return [f'//{step} EXEC PGM={program},REGION=64M,TIME=(0,1)',
      '//STEPLIB DD DSN=&&LOAD,DISP=(OLD,PASS)',
      '// DD DSN=CEE.SCEERUN,DISP=SHR','//SYSOUT DD SYSOUT=*',
      '//CEEDUMP DD DUMMY','//SYSUDUMP DD DUMMY']

def make_jcl(jobname,sources,source_dataset):
    s=[f"//{jobname} JOB (ACCT),'TCB CKP02 LAB',CLASS=A,MSGCLASS=H,",
       '// MSGLEVEL=(1,1),NOTIFY=&SYSUID',
       '//* Each job owns its temporary data; no production datasets.',
       '//ALLOC EXEC PGM=IEFBR14',
       '//LOAD DD DSN=&&LOAD,DISP=(NEW,PASS),UNIT=SYSDA,',
       '// SPACE=(CYL,(2,1,10)),DSNTYPE=LIBRARY,DCB=(RECFM=U)',
       '// IF (ALLOC.RC EQ 0) THEN']
    for step,name in [('CGEN','GENCKP'),('CCKP','CKP02'),('CCHK','CHKCKP')]:
        s+=compile_step(step,name,sources.get(name),source_dataset)
    s+=['// IF ((CGEN.RC LE 4) & (LGENCKP.RC EQ 0) &',
        '// (CCKP.RC LE 4) & (LCKP02.RC EQ 0) &',
        '// (CCHK.RC LE 4) & (LCHKCKP.RC EQ 0)) THEN']+run_step('GENERATE','GENCKP')
    for dd,ds in [('WORKDD','WORK'),('EXP1DD','EXP1'),('EXP2DD','EXP2'),('EMPTYDD','EMPTY')]:
        s += [f'//{dd} DD DSN=&&{ds},DISP=(NEW,PASS),UNIT=SYSDA,',
          '// SPACE=(TRK,(1,1)),DCB=(DSORG=PS,RECFM=FB,LRECL=400,',
          '// BLKSIZE=0)']
    s+=['// IF (GENERATE.RC EQ 0) THEN']+run_step('RUNONCE','CKP02')
    s+=['//INPUT1 DD DSN=&&WORK,DISP=(OLD,PASS)', '// IF (RUNONCE.RC EQ 0) THEN']
    s+=run_step('CHECK1','CHKCKP')+['//ACTUALDD DD DSN=&&WORK,DISP=(OLD,PASS)',
      '//EXPECTDD DD DSN=&&EXP1,DISP=(OLD,PASS)', '// IF (CHECK1.RC EQ 0) THEN']
    s+=run_step('RUNTWICE','CKP02')+['//INPUT1 DD DSN=&&WORK,DISP=(OLD,PASS)',
      '// IF (RUNTWICE.RC EQ 0) THEN']+run_step('CHECK2','CHKCKP')
    s+=['//ACTUALDD DD DSN=&&WORK,DISP=(OLD,PASS)',
      '//EXPECTDD DD DSN=&&EXP2,DISP=(OLD,PASS)']
    s+=run_step('RUNEMPTY','CKP02')+['//INPUT1 DD DSN=&&EMPTY,DISP=(OLD,PASS)']
    s+=['// ENDIF']*6
    result='\n'.join(s)+'\n'
    assert all(len(x)<=80 for x in result.split('\n')), 'JCL exceeds 80 columns'
    return result

def build(out,jobname,volume=None,storage_class=None,source_dataset='YOURUSER.TCBLAB.COBOL'):
    if not re.fullmatch(r'[A-Z][A-Z0-9]{0,7}\.TCBLAB\.COBOL',source_dataset):
        raise ValueError('Use the personal source library <USER>.TCBLAB.COBOL')
    if bool(volume) != bool(storage_class):
        raise ValueError('Specify both verified volume and ACS storage-class selector')
    for value in (volume,storage_class):
        if value and not re.fullmatch(r'[A-Z][A-Z0-9]{0,7}',value):
            raise ValueError('Invalid volume or storage class')
    if volume and len(volume)>6: raise ValueError('Volume serial exceeds six characters')
    if not re.fullmatch(r'TCB[A-Z0-9]{1,5}',jobname): raise ValueError('Use TCB-prefixed job name, max 8 characters')
    cases=json.loads((ROOT/'z-tests/fixtures.json').read_text(encoding='utf-8'))
    for c in cases:
        assert all(len(c[k])==10 and c[k].isascii() for k in ['id','once','twice'])
    sources={'GENCKP':generator(cases),'CHKCKP':checker(len(cases))}
    if (out/'CKP02.cbl').exists():
        raise ValueError('Output contains an obsolete CKP02 copy; use a new output directory')
    out.mkdir(parents=True,exist_ok=True)
    for name,src in sources.items(): (out/(name+'.cbl')).write_text(src,encoding='ascii',newline='\n')
    jcl=make_jcl(jobname,sources,source_dataset)
    if volume:
        jcl=jcl.replace('UNIT=SYSDA,',f'UNIT=3390,\n// VOL=SER={volume},STORCLAS={storage_class},\n// ')
        jcl=jcl.replace('// \n','')
    assert all(len(row)<=72 for row in jcl.split('\n')), 'JCL exceeds statement columns'
    (out/'run.jcl').write_text(jcl,encoding='utf-8',newline='\n')
    manifest={'source':'z-lab/CKP02.cbl','source_dataset':source_dataset+'(CKP02)',
      'source_library':source_dataset,'source_members':['CKP02','GENCKP','CHKCKP'],
      'job_member':source_dataset.removesuffix('.COBOL')+'.JCL(RUN)',
      'local_encoding':'UTF-8','local_newline':'LF',
      'source_transfer_encoding':'IBM-937','compiler_options':['CODEPAGE(937)','DBCS'],
      'jcl_encoding':'IBM-1047','source_change':'None; source members are provisioned before class from the supplied files, including Chinese comments.',
      'cases':len(cases),'record_bytes':400,'runs':['once','twice','empty'],
      'host_execution':'not inferred from generation',
      'allocation_route':{'volume':volume,'storage_class_selector':storage_class},
      'sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in out.iterdir() if p.suffix in ['.cbl','.jcl']}}
    (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('Built',out,'; not submitted')

if __name__=='__main__':
    a=argparse.ArgumentParser(); a.add_argument('--out',type=Path,required=True); a.add_argument('--jobname',default='TCBP001')
    a.add_argument('--volume'); a.add_argument('--storage-class'); a.add_argument('--source-dataset',default='YOURUSER.TCBLAB.COBOL')
    args=a.parse_args(); build(args.out,args.jobname,args.volume,args.storage_class,args.source_dataset)
