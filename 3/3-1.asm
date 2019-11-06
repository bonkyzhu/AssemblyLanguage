DATA SEGMENT
    SCORE DW 100, 98, 98, 97, 95
          DW 100, 98, 96, 95, 95
    CN DB 2 ;班级号
    SN DB 3 ;学号
    STUC DB 5   ;一个班学生总数
    CLASSM DW ? ;查找学生前面班级所占字节数
    STUM DW ?   ;同一班级前面的学生数
DATA ENDS

CODES SEGMENT
    ASSUME CS:CODES, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX
    MOV DX, DS:[0EH]

    MOV AL, CN  
    DEC AL  ;前面的班级 = 自己班减一
    
    MOV BL, STUC 
    MUL BL
    MOV BL, 2
    MUL BL  ; AL *= 每个班所占字节数
    
    MOV CLASSM, AX  ;把AX数据移到CLASSM

    MOV AL, SN  
    DEC AL
    MOV BL, 2
    MUL BL  ;前面学生所占字节数

    MOV STUM, AX
    
    ADD AX, CLASSM ;AX是前面的字节数

    MOV BX, AX
    MOV SI, AX
    MOV DI, AX

    MOV DX, [BX]

    MOV DX, SCORE[BX]
    MOV DX, [SCORE+BX]

    MOV BX, OFFSET SCORE
    MOV DX, [BX][SI]
    MOV DX, BX, [BS+SI]

    

    MOV AH, 4CH
    INT 21H

CODES ENDS
    END START

