code segment
 	assume cs: code
start:
	mov ah, 0
 	int 16h

	mov ah, 1
	cmp al, 'r' ;如果为红
	je red
	cmp al, 'g' ;如果为绿
 	je green
 	cmp al, 'b' ;如果为蓝
 	je blue

red:
  ;若为红*4
 	shl ah, 1
green:
  ;为绿*2
 	shl ah, 1
blue:
 	mov cx, 2000 ;屏幕总字符大小
 	mov bx, 0b800h ;显存起始地址
	mov es, bx
 	mov bx, 1
s:
  ;改变屏幕所有字的颜色
 	mov es:[bx], ah 
	add bx, 2 ;移到下一个位置
 	loop s
 	mov ah, 4ch
 	int 21h
code ends
end start
