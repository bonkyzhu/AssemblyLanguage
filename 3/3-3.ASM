DATA SEGMENT
    TABLE DW STU1, STU2, STU3, STU4, STU5
    INFO DB 'PLEASE INPUT STU NO MORE THAN 4: $'
    STU1 DB 0DH, 0AH, 'NOBODY$'
    STU2 DB 0DH, 0AH, 'WANGMINGCHAO$'
    STU3 DB 0DH, 0AH, 'LIGUIMEI$'
    STU4 DB 0DH, 0AH, 'ZHAOKANGSHENG$'
    STU5 DB 0DH, 0AH, 'BAIHAOYU$'
    
DATA ENDS

CODES SEGMENT
    ASSUME CS:CODES, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AH, 01H
    INT 21H

    SUB AL, 30H
    DEC AL ;获取在table中的序号

    MOV BX, OFFSET TABLE
    MOV CL, 2
    MUL CL
    ADD BX, AX
    MOV DX, [BX]

    MOV AH, 09
    INT 21H

    MOV AH, 4CH
    INT 21H
CODES ENDS
    END START
