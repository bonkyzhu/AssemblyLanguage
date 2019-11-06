extrn rank:byte
extrn scoreList:byte
public pscore
data segment public 'data'
len2 = 10
data ends
code segment 'code'
assume cs:code, ds:data
mov ax, data
mov ds, ax
pscore proc far
push bx
push ax
push dx
mov bl, rank[bx]
mov bh, 0 
mov ax, bx
mov bx, len2
mul bl
mov bx, ax
lea dx, scoreList[bx]
mov ah, 9
int 21h
mov dl, 0dh
mov ah, 2
int 21h
mov dl, 0ah
mov ah, 2
int 21h
pop dx
pop ax
pop bx
ret
pscore endp
code ends
end
