DATA SEGMENT
    TABLE   DW  S0,S1,S2,S3,S4
    S0      DB  'ZHANG SAN',0DH,0AH,'$'
    S1      DB  'LI SI',0DH,0AH,'$'
    S2      DB  'WANG WU',0DH,0AH,'$'
    S3      DB  'QIAN LIU',0DH,0AH,'$'
    S4      DB  'SUN QI',0DH,0AH,'$'
    SCORE   DW  87,98,88,95,86
    RANK    DW  0,1,2,3,4
    N       DW  5
    X       DB  ?,?
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    
    MAIN PROC FAR
    START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,N
    MOV BX,OFFSET SCORE
    MOV BP,OFFSET RANK
    CALL SORT
    MOV SI,0
    MOV CX,5
    PS:
    MOV AX,SCORE[SI]
    CALL PSCORE
    MOV AX,RANK[SI]
    CALL PNAME
    ADD SI,2
    LOOP PS
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    
    SORT PROC NEAR

    PUSH CX
    PUSH SI
    MOV CX,AX
    DEC CX
    OUTS:
        PUSH CX
        MOV SI,0
    INS:
        MOV AX,[BX][SI]
        CMP AX,[BX][SI+2]
        JA NEXT
        XCHG AX,[BX][SI+2]
        MOV [BX][SI],AX
        MOV AX,DS:[BP][SI]
        XCHG AX,DS:[BP][SI+2]
        MOV DS:[BP][SI],AX
    NEXT:
        ADD SI,2
        LOOP INS
        POP CX
        LOOP OUTS
    POP SI
    POP CX
    RET
    SORT ENDP
    
    PNAME PROC NEAR
    PUSH BX
    PUSH DX
    ADD AX,AX
    MOV BX,AX
    MOV DX,[TABLE+BX]
    MOV AH,9
    INT 21H
    POP DX
    POP BX
    RET
    PNAME ENDP
    
    PSCORE PROC NEAR
    PUSH BX
    PUSH DX
    MOV BL,10
    DIV BL
    MOV X[0],AL
    MOV X[1],AH
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H
    MOV AL, X[1]
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H
    MOV DL,20H
    MOV AH,2
    INT 21H
    POP DX
    POP BX
    RET
    PSCORE ENDP
CODE ENDS
END START