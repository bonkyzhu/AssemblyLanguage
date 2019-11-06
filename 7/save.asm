extrn nameBuffer:byte
extrn nameList:byte
extrn scoreBuffer:byte
extrn scoreList:byte
public copy
data segment public 'data'
len1 = 20
len2 = 10
data ends
code segment 'code'
assume cs:code, ds:data, es:data
mov ax, data
mov ds, ax
mov es, ax
copy proc far
push di
push cx
push si
push ax
push bx
push di
mov cl, nameBuffer[1]
mov ch, 0
inc cx
lea si, nameBuffer[2]
mov ax, di
mov bl, len1
mul bl
mov bx, ax
lea di, nameList[bx]
cld
rep movsb
pop di
mov cl, scoreBuffer[1]
mov ch, 0
inc cx
lea si, scoreBuffer[2]
mov ax, di
mov bl, len2
mul bl
mov bx, ax
lea di, scoreList[bx]
cld
rep movsb
pop bx
pop ax 
pop si
pop cx
pop di
ret
copy endp
code ends
end
