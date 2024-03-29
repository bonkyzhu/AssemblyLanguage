DATA SEGMENT
	SCORE DB 99, 34, 55, 98, 89, 97, 45, 67
		  DB 89, 60, 55, 98, 89, 97, 45, 67	
		  DB 90, 34, 55, 98, 89, 97, 60, 67
	CN DW 0
	SN DW 0
	MAX DB 3 DUP(0)
	MIN DB 3 DUP(0)
DATA ENDS
CODE SEGMENT
	ASSUME DS:DATA, CS:CODE
START:
	MOV AX, DATA
 	MOV DS, AX
OUTS:
 	CMP CN, 3
 	JAE EXIT
 	MOV SN, 0
 	MOV AX, CN
	MOV BL, 8
 	MUL BL
 	MOV BX,AX
INS:
	CMP SN,8
 	JAE OUTS
 	MOV SI,SN
 	CMP SCORE[BX][SI],90 
	JB FLUNK
 	MOV DI, CN
 	INC MAX[DI]
 	JMP INS1
FLUNK:
 	CMP SCORE[BX][SI],60 
	JAE INS1
 	MOV DI,CN
 	INC MIN[DI]

INS1:
 	INC SN
 	JAP INS

OUTS1:
 	INC CN
 	JMP OUTS
 
EXIT:
 	MOV AH,4CH
 	INT 21H
ENDS
CODE ENDS 