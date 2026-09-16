       identification division.
       program-id. IMSEVT.
       data division.
       working-storage section.
       01 mode-name pic x(8).
       01 fn pic x(4).
       01 wanted pic xx value spaces.
       01 op-no pic 9(4) value zero.
       01 root-seg.
          05 root-key pic x(4).
          05 payload pic x(400).
       01 expected-data pic x(400).
       01 child-seg.
          05 child-key pic x(4).
          05 child-data pic x(16).
       01 root-ssa pic x(9) value 'EVROOT   '.
       01 child-ssa pic x(9) value 'EVCHILD  '.
       01 qualified-root.
          05 filler pic x(9) value 'EVROOT  ('.
          05 filler pic x(8) value 'ROOTKEY '.
          05 filler pic xx value '= '.
          05 filler pic x(4) value '0001'.
          05 filler pic x value ')'.
       01 delay-seconds pic s9(9) comp-5 value 2.
       01 feedback-code.
          05 severity pic s9(4) comp.
          05 message-no pic s9(4) comp.
          05 filler pic x(8).
       01 abend-code pic s9(9) comp-5 value 3001.
       01 cleanup-code pic s9(9) comp-5 value 0.
       01 stamp pic x(21).
       01 calendar-date pic 9(8).
       01 clock-ms pic 9(16) comp-3.
       01 start-ms pic 9(16) comp-3.
       01 wait-start pic 9(16) comp-3.
       01 wait-end pic 9(16) comp-3.
       01 gu-stamp pic x(21).
       01 before-gu pic 9(16) comp-3.
       01 after-gu pic 9(16) comp-3.
       01 shown-ms pic 9(10).
       linkage section.
       01 io-pcb.
          05 filler pic x(10).
          05 io-status pic xx.
          05 filler pic x(28).
       01 db-pcb.
          05 db-name pic x(8).
          05 db-level pic xx.
          05 db-status pic xx.
          05 filler pic x(80).
       procedure division.
           entry 'DLITCBL' using io-pcb db-pcb.
           accept mode-name
           move spaces to expected-data
           move '0012345678' to expected-data(1:10)
           move 'FICTIONAL CUSTOMER' to expected-data(11:18)
           display 'APPLICATION DIAGNOSTIC MODE=' mode-name
           evaluate mode-name
             when 'LOAD' perform load-data
             when 'NORMAL' perform normal-case
             when 'DUP' perform duplicate-case
             when 'CHECK' perform verify-data
             when 'DELAY' perform delay-case
             when 'CUT' go to cut-case
             when other go to fail-run
           end-evaluate
           display 'END MODE=' mode-name ' HARNESS=PASS'
           move zero to return-code
           goback.
       load-data.
           move '0001' to root-key
           move expected-data to payload
           move 'ISRT' to fn
           call 'CBLTDLI' using fn db-pcb root-seg root-ssa
           perform log-status
           move '0001' to child-key
           move 'TEST DETAIL' to child-data
           call 'CBLTDLI' using fn db-pcb child-seg
               qualified-root child-ssa
           perform log-status.
       get-root.
           move 'GU  ' to fn
           call 'CBLTDLI' using fn db-pcb root-seg qualified-root
           perform log-status.
       normal-case.
           perform get-root
           move 'GNP ' to fn
           call 'CBLTDLI' using fn db-pcb child-seg child-ssa
           perform log-status
           display 'CHILD-KEY="' child-key '"'
           if child-key not = '0001' go to fail-run end-if
           move 'GE' to wanted
           call 'CBLTDLI' using fn db-pcb child-seg child-ssa
           perform log-status
           move spaces to wanted
           display 'NO MORE CHILDREN; BUSINESS=COMPLETE'.
       duplicate-case.
           move 'GHU ' to fn
           call 'CBLTDLI' using fn db-pcb root-seg qualified-root
           perform log-status
           display 'BEFORE-ID="' payload(1:10) '"'
           move '12345678  ' to payload(1:10)
           move 'REPL' to fn
           call 'CBLTDLI' using fn db-pcb root-seg
           perform log-status
           perform get-root
           display 'UNCOMMITTED-ID="' payload(1:10) '"'
           if payload(1:10) not = '12345678  '
               go to fail-run
           end-if
           move '0001' to child-key
           move 'DUPLICATE DETAIL' to child-data
           move 'II' to wanted
           move 'ISRT' to fn
           call 'CBLTDLI' using fn db-pcb child-seg
               qualified-root child-ssa
           perform log-status
           move spaces to wanted
           move 'ROLB' to fn
           call 'CBLTDLI' using fn io-pcb
           display 'ROLB STATUS="' io-status '"'
           if io-status not = spaces go to fail-run end-if
           perform verify-data
           display 'BUSINESS=REJECTED; EXPECTED II AND ROLB'.
       verify-data.
           perform get-root
           display 'ACTUAL-ID="' payload(1:10) '"'
           if payload not = expected-data go to fail-run end-if
           move 'GNP ' to fn
           call 'CBLTDLI' using fn db-pcb child-seg child-ssa
           perform log-status
           if child-key not = '0001' or
               child-data not = 'TEST DETAIL'
               go to fail-run
           end-if
           move 'GE' to wanted
           call 'CBLTDLI' using fn db-pcb child-seg child-ssa
           perform log-status
           move spaces to wanted
           display 'ROOT ALL 400 BYTES AND CHILD VERIFIED'.
       delay-case.
           perform read-clock
           move clock-ms to start-ms
           display 'CASE-BEGIN=' stamp
           display 'INJECTED WAIT BEFORE GU; REQUESTED-SECONDS=2'
           perform read-clock
           move clock-ms to wait-start
           call 'CEE3DLY' using delay-seconds feedback-code
           perform read-clock
           move clock-ms to wait-end
           if severity not = zero
               display 'DELAY SERVICE FAILED=' message-no
               go to fail-run
           end-if
           perform read-clock
           move clock-ms to before-gu
           move stamp to gu-stamp
           move 'GU  ' to fn
           call 'CBLTDLI' using fn db-pcb root-seg qualified-root
           perform read-clock
           move clock-ms to after-gu
           display 'GU-BEGIN=' gu-stamp
           display 'GU-END=' stamp
           perform log-status
           if wait-start < start-ms or wait-end < wait-start
               or before-gu < wait-end or after-gu < before-gu
               display 'CLOCK MOVED BACKWARDS; TIMING INVALID'
               go to fail-run
           end-if
           compute shown-ms = wait-end - wait-start
           display 'WAIT-MS=' shown-ms
           compute shown-ms = before-gu - start-ms
           display 'PRE-GU-MS=' shown-ms
           compute shown-ms = after-gu - before-gu
           display 'GU-MS=' shown-ms
           compute shown-ms = after-gu - start-ms
           display 'CASE-TO-GU-END-MS=' shown-ms
           display 'CLOCK RESOLUTION=10MS; NOT MONOTONIC'
           display 'ZERO MEANS BELOW CLOCK RESOLUTION'.
       cut-case.
           perform get-root
           display 'READ COMPLETED; NO UPDATE IN CUT'
           display 'INJECTED ABEND U3001; NORMAL END WILL BE ABSENT'
           call 'CEE3ABD' using abend-code cleanup-code
           go to fail-run.
       read-clock.
           move function current-date to stamp
           move stamp(1:8) to calendar-date
           compute clock-ms =
               function integer-of-date(calendar-date) * 86400000
               + function numval(stamp(9:2)) * 3600000
               + function numval(stamp(11:2)) * 60000
               + function numval(stamp(13:2)) * 1000
               + function numval(stamp(15:2)) * 10.
       log-status.
           add 1 to op-no
           display 'OP=' op-no ' CALL=' fn
               ' PCB-STATUS="' db-status '"'
           if db-status not = wanted go to fail-run end-if.
       fail-run.
           display 'UNEXPECTED RESULT MODE=' mode-name
           move 12 to return-code
           goback.
