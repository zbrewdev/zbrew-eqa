DTIVPA CEEENTRY PPA=MAINPPA,AUTO=WORKSIZE
         USING    WORKAREA,R13
*
         LA   R02,STRT_MSG
         LA   R03,DEST
         LA   R04,FBCODE
         STM  R02,R04,PLIST
         BRAS R14,PUT
*
         PACK PCKA,ZNA
         PACK PCKB,ZNB
         ZAP  PCKSUM,PCKA
*
         L    R10,=F'10'
LOOP1    DS   0H
         AP   PCKSUM,PCKB
         MVC  OUTSUM,SUMMSK
         ED   OUTSUM,PCKSUM
         MVC  SUMMSG+1(8),OUTSUM
         MVC  LINE_ST,SUMMSG
         LA   R02,LINE_MSG
         LA   R03,DEST
         LA   R04,FBCODE
         STM  R02,R04,PLIST
         BRAS R14,PUT
         BCT  R10,LOOP1
*
END1     DS   0H
         LA   R02,DONE_MSG
         LA   R03,DEST
         LA   R04,FBCODE
         STM  R02,R04,PLIST
         BRAS R14,PUT
*
         CEETERM  RC=0
* ==============================================================
*  Subroutine for output
* ==============================================================
         DS   F
PUT      DS   0H
         ST   R14,PUT-4
         LA   R01,PLIST
         L    R15,MOUT
         BASR R14,R15
         L    R14,PUT-4
         BR   R14
* ==============================================================
*  Constants and Variables
* ==============================================================
ZLEN     EQU 5
PLEN     EQU ZLEN/2+1
*
SUMMSG   DC  C'(xxxxxxxx) -- The sum    '
SUMMSK   DC  X'4020202020202120'
ZNA      DC  ZL5'100'
ZNB      DC  ZL5'50'
*
PCKA     DS  PL(PLEN)
PCKB     DS  PL(PLEN)
PCKSUM   DS  PL(PLEN+1)
OUTSUM   DS  CL(L'SUMMSK)
*
MOUT     DC     V(CEEMOUT)        The CEL Message service
*
LINE_MSG DS     0F
         DC     AL2(LINE_END-LINE_ST)
LINE_ST  DS     CL25
LINE_END EQU    *
*
STRT_MSG DS     0F
         DC     AL2(STRT_END-STRT_ST)
STRT_ST  DC     C'Starting the program.'
STRT_END EQU    *
*
*
DONE_MSG DS     0F
         DC     AL2(DONE_END-DONE_ST)
DONE_ST  DC     C'Terminating the program.'
DONE_END EQU    *
*
DEST     DC     F'2'              The destination is the MSGFILE
*
MAINPPA  CEEPPA
* ===================================================================
*  The Workarea and DSA
* ===================================================================
WORKAREA DSECT
         ORG    *+CEEDSASZ
PLIST    DS     0D
PARM1    DS     A
PARM2    DS     A
PARM3    DS     A
PARM4    DS     A
PARM5    DS     A
*
FBCODE   DS     3F
*
         DS     0D
WORKSIZE EQU    *-WORKAREA
         CEEDSA                   Mapping of the Dynamic Save Area
         CEECAA                   Mapping of the Common Anchor Area
*
R00      EQU   0
R01      EQU   1
R02      EQU   2
R03      EQU   3
R04      EQU   4
R05      EQU   5
R06      EQU   6
R07      EQU   7
R08      EQU   8
R09      EQU   9
R10      EQU   10
R11      EQU   11
R12      EQU   12
R13      EQU   13
R14      EQU   14
R15      EQU   15
         END   DTIVPA         Nominate DTIVPA as the entry point
