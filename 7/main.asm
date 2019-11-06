extrn mess1:byte
extrn input:far
extrn sort:far
extrn pname:far
extrn pscore:far
public pp
public nameList
public scoreList
public realScore
public rank 
data segment public 'data'
p = 32
pp dw 0
len1 = 20
len2 = 10
nameList db p dup(len1 dup('$'))
scoreList db p dup(len2 dup('$'))
realScore db p dup(0)
rank db p dup(0)
data ends
code segment 'code'
assume cs:code, ds:data
start:
mov ax, data
mov ds, ax
mov es, ax
main proc far
lea dx, mess1
mov ah, 9
int 21h
mov ah, 1
int 21h
sub al, 30h
mov pp, al
mov dl, 0dh
mov ah, 2
int 21h
mov dl, 0ah
mov ah, 2
int 21h
call input
call sort
mov dl, 0dh
mov ah, 2 
int 21h
mov dl, 0ah
mov ah, 2
int 21h
mov bx, -1
mov cx, pp
ps:
inc bx
call pname
call pscore
loop ps
mov ah, 4ch
int 21h
main endp
code ends
end start