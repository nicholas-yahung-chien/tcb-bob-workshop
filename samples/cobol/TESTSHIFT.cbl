      * SYNTHETIC DRIVER. REQUIRES A COBOL COMPILER.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTSHIFT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 REC                         PIC X(400).
       01 EXPECTED                    PIC X(400).
       PROCEDURE DIVISION.
           MOVE ALL 'X' TO REC
           MOVE '0012345678' TO REC(1:10)
           MOVE REC TO EXPECTED
           MOVE '12345678  ' TO EXPECTED(1:10)
           CALL 'IDSHIFT' USING REC
           IF REC NOT = EXPECTED
               MOVE 1 TO RETURN-CODE
               STOP RUN
           END-IF
           MOVE '0012345678' TO REC(1:10)
           MOVE 'EOF' TO REC(14:3)
           MOVE REC TO EXPECTED
           CALL 'IDSHIFT' USING REC
           IF REC NOT = EXPECTED
               MOVE 2 TO RETURN-CODE
               STOP RUN
           END-IF
           DISPLAY 'PASS: NORMAL AND EOF MARKER'
           MOVE 0 TO RETURN-CODE
           STOP RUN.
