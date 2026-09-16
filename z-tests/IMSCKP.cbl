       identification division.
       program-id. IMSCKP.
       environment division.
       input-output section.
       file-control.
           select inp assign to INPUT1
               organization sequential file status fs.
           select outp assign to OUTPUT1
               organization sequential file status ofs.
       data division.
       file section.
       fd inp recording mode F record contains 400 characters.
       01 inrec pic x(400).
       fd outp recording mode F record contains 400 characters.
       01 outrec pic x(400).
       working-storage section.
       01 fn-GU pic x(4) value 'GU  '.
       01 fn-GHU pic x(4) value 'GHU '.
       01 fn-ISRT pic x(4) value 'ISRT'.
       01 fn-REPL pic x(4) value 'REPL'.
       01 fn-ROLB pic x(4) value 'ROLB'.
       01 fn-CHKP pic x(4) value 'CHKP'.
       01 fs pic xx.
       01 ofs pic xx.
       01 mode-name pic x(8).
       01 case-no pic 9(4).
       01 errors pic 9(4) value 0.
       01 segbuf.
          05 case-key pic 9(4).
          05 payload pic x(400).
       01 saved-payload pic x(400).
       01 insert-ssa pic x(9) value "CKPROOT  ".
       01 ssa.
          05 filler pic x(9) value 'CKPROOT ('.
          05 filler pic x(8) value 'CASEKEY '.
          05 filler pic xx value '= '.
          05 search-key pic 9(4).
          05 filler pic x value ')'.
       01 checkpoint-id pic x(8) value 'TCBCOM01'.
       linkage section.
       01 io-pcb.
          05 filler pic x(10).
          05 io-status pic xx.
          05 filler pic x(28).
       01 db-pcb.
          05 db-name pic x(8).
          05 db-level pic xx.
          05 db-status pic xx.
          05 filler pic x(68).
       procedure division.
           entry 'DLITCBL' using io-pcb db-pcb.
           accept mode-name
           display 'APPLICATION DIAGNOSTIC MODE=' mode-name
           if mode-name not = 'LOAD' and 'EXPORT' and 'CHECK'
               and 'UPDATE' and 'ROLLBACK'
               display 'INVALID MODE'
               go to fail-run
           end-if
           if mode-name = 'EXPORT'
               open output outp
               perform check-output
           else
               open input inp
               perform check-input
           end-if
           perform varying case-no from 1 by 1 until case-no > 7
               move case-no to case-key search-key
               if mode-name = 'EXPORT'
                   call 'CBLTDLI' using fn-GU db-pcb segbuf ssa
                   perform check-status
                   move payload to outrec
                   write outrec
                   perform check-output
               else
                   read inp
                   perform check-input
                   evaluate mode-name
                     when 'LOAD'
                       display 'NEW RECORD; NO BEFORE IMAGE'
                       display 'TARGET-ID="' inrec(1:10) '"'
                       move inrec to payload
                       call 'CBLTDLI' using fn-ISRT db-pcb
                           segbuf insert-ssa
                       perform check-status
                     when 'CHECK'
                       call 'CBLTDLI' using fn-GU db-pcb
                           segbuf ssa
                       perform check-status
                       if payload not = inrec add 1 to errors
                       end-if
                     when other
                       call 'CBLTDLI' using fn-GHU db-pcb
                           segbuf ssa
                       perform check-status
                       move payload to saved-payload
                       display 'BEFORE-ID="' payload(1:10) '"'
                       display 'TARGET-ID="' inrec(1:10) '"'
                       move inrec to payload
                       call 'CBLTDLI' using fn-REPL db-pcb segbuf
                       perform check-status
                       if mode-name = 'ROLLBACK'
                           call 'CBLTDLI' using fn-ROLB io-pcb
                           display 'ROLB STATUS="' io-status '"'
                           if io-status not = spaces
                               go to fail-run
                           end-if
                           call 'CBLTDLI' using fn-GU db-pcb
                               segbuf ssa
                           perform check-status
                           display 'AFTER-ROLB-ID="'
                               payload(1:10) '"'
                           if payload not = saved-payload
                               add 1 to errors
                           end-if
                       end-if
                   end-evaluate
               end-if
               display 'CASE=' case-no ' DB STATUS="'
                   db-status '" ERRORS=' errors
           end-perform
           if mode-name not = 'EXPORT'
               read inp
               if fs not = '10'
                   display 'EXPECTED EXACTLY SEVEN INPUT RECORDS'
                   go to fail-run
               end-if
           end-if
           if mode-name = 'UPDATE'
               call 'CBLTDLI' using fn-CHKP io-pcb checkpoint-id
               display 'CHKP STATUS="' io-status '"'
               if io-status not = spaces go to fail-run end-if
           end-if
           if mode-name = 'EXPORT'
               close outp perform check-output
           else
               close inp perform check-input
           end-if
           display 'CHECKED=0007 ERRORS=' errors
           if errors = 0 move 0 to return-code
           else move 8 to return-code end-if
           goback.
       check-status.
           if db-status not = spaces
               display 'FAILED CASE=' case-no ' STATUS="'
                   db-status '"'
               go to fail-run
           end-if.
       check-input.
           if fs not = '00'
               display 'INPUT FILE STATUS=' fs
               go to fail-run
           end-if.
       check-output.
           if ofs not = '00'
               display 'OUTPUT FILE STATUS=' ofs
               go to fail-run
           end-if.
       fail-run.
           if mode-name = 'UPDATE' or 'ROLLBACK'
               call 'CBLTDLI' using fn-ROLB io-pcb
               display 'FAILURE ROLB STATUS="' io-status '"'
           end-if
           move 12 to return-code
           goback.

