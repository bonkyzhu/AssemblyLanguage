code segment
 	assume cs:code
start:
 	mov ax, 0
 	mov es, ax
 	push es:[9*4] ;中断向量9*每个向量占4个字节, 中断向量段地址起始
 	pop es:[0200h]
	push es:[9*4+2] ;中断向量偏移地址起始
 	pop es:[0202h]
 	mov ah,25h ; 设置中断向量
 	mov al, 9 ;将9号中断放入中断向量表中
 	push cs
 	pop ds
 	mov dx, offset int9
 	int 21h
 	mov ah, 31h ;结束并且驻留到内存
 	mov al, 0
 	mov dx, int9end-int9start+16 
	int 21h
 	mov ah,4ch
 	int 21h

;中断程序部分
int9 proc far
int9start:
  ; 保护现场
 	push ax
 	push bx
 	push es
	push cx
 	in al,60h ;端口读写 
 	mov bx,0
 	mov es,bx
 	pushf
 	call dword ptr es: [0200h]
	;cs=[0202h]ip=lo200h]
 	sti
 	cmp al,3bh
 	jne return
  ; 循环2000次(整个屏幕)
 	mov cx,2000
	mov bx,0b800h ;显存开始地址
 	mov es,bx
 	mov bx,1
s:
  ;改变颜色
 	inc byte ptr es:[bx]
 	add bx, 2
 	loop s
 	cli
return:
  ; 恢复现场
 	pop cx
 	pop es
 	pop bx
 	pop ax
 	iret
int9 endp
int9end:nop
code ends
end start