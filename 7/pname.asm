extrn rank:byte
extrn nameList:byte
public pname
data segment public 'data'
len1 = 20
data ends
code segment 'code'
assume cs:code, ds:data
mov ax, data
mov ds, ax
pname proc far
push bx
push ax
push dx
mov bl, rank[bx]
mov bh, 0
mov ax, bx
mov bl, len1
mul bl
mov bx, ax 
lea dx, nameList[bx]
mov ah, 9
int 21h
mov dl, ':'
mov ah, 2
int 21h
pop dx
pop ax
pop bx
ret
pname endp
code ends
end