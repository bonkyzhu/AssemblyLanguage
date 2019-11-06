extrn pp:word
extrn realScore:byte
extrn rank:byte
public sort
code segment 'code'
assume cs:code
sort proc far
push cx
push bx
push ax
mov cx, pp
dec cx
loop1:
push cx
mov bx, 0
loop2:
mov al, realScore[bx]
cmp al, realScore[bx+1]
jae next
mov al, rank[bx]
xchg al, rank[bx+1]
mov rank[bx], al
next: 
inc bx
loop loop2
pop cx
loop loop1
pop ax
pop bx
pop cx
ret
sort endp
code ends
end