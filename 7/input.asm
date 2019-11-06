extrn pp:word
extrn nameList:byte
extrn scoreList:byte
extrn realScore:byte
extrn rank:byte
extrn copy:far
public nameBuffer
public scoreBuffer
public input
public mess1
data segment public 'data'
mess1 db 0dh, 0ah, 'Number of students: $'
mess2 db 0dh, 0ah, 'Name of student: $'
mess3 db 0dh, 0ah, 'Score of student: $'
p = 32
len1 = 20
len2 = 10
n db 0
x db 3 dup(0)
nameBuffer db len1, ?, len1 dup('$')
scoreBuffer db len2, ?, len2 dup('$')
data ends
code segment 'code'
assume cs:code, ds:data, es:data
input proc far
next1:
mov di, 0
input1:
lea dx, mess2
mov ah, 9
int 21h
lea dx, nameBuffer
mov ah, 10
int 21h
mov bl, nameBuffer[1]
mov bh, 0
mov nameBuffer[bx+2], '$'
lea dx, mess3
mov ah, 9
int 21h
lea dx, scoreBuffer
mov ah, 10
int 21h
mov bl, scoreBuffer[1]
mov bh, 0
mov scoreBuffer[bx+2], '$'
mov cx, bx
mov si, 1 
loop0:
inc si
mov al, scoreBuffer[si]
sub al, 30h
xchg al, n
mov bl, 10
mul bl
add n, al
loop loop0
mov al, n
mov realScore[di], al
mov n, 0
call copy
mov rank[di], di
inc di
cmp di, pp
jge exitInput
jmp input1
exitInput:
ret
input endp
code ends
end