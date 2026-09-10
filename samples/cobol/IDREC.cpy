      * SYNTHETIC WORKSHOP COPYBOOK. NO CUSTOMER DATA.
       01  WS-RECORD.
           05 WS-ID                   PIC X(10).
           05 WS-ID-PARTS REDEFINES WS-ID.
              10 WS-PREFIX            PIC X(2).
              10 WS-KEY               PIC X(8).
           05 WS-SUFFIX               PIC X.
           05 WS-PAYLOAD              PIC X(389).
