CODES SEGMENT
    ASSUME CS:CODES
START:
    MOV AH, 1
    INT 21H

    SUB AL, 30H
    MOV BL, 2
    MUL BL
    ADD AL, 3
    
    ADD AL, 30H
    MOV DL, AL

    MOV AH, 2
    INT 21H    
    
    MOV AH, 4CH
    INT 21H
CODES ENDS
    END START

