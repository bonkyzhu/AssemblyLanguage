;编写中断7ch程序
;功能：在屏幕上输出自己的班级，班级序号，学号，姓名 
;输出: 1701 24 20178859 zzq(朱子权)
;参数：(dh)=行号，(dl)=列号，(cl)=颜色，ds:si指向字符串首地址
assume cs:code
data segment
db '1701 24 20178859 zzq',0
data ends
code segment
start:
  mov dh,10
  mov dl,10
  mov cl,2
  mov ax,data
  mov ds,ax
  mov si,0
  int 7ch
  mov ax,cs
  mov ds,ax
  mov si,offset do7ch
  mov ax,0
  mov es,ax
  mov di,200h
  mov cx,offset do7chend-offset do7ch ;计算长度
  cld
  rep movsb
    
  mov ax,0
  mov es,ax
  mov word ptr es:[7ch*4],200h
  mov word ptr es:[7ch*4+2],0
  mov ax,4c00h
  int 21h

do7ch:
  push ax
  push bx
  mov ax,0b800h ;显存起始地址
  mov es,ax
  mov bx,0

  mov al,160    ;显示首位置=行*160+列*2,
  mul dh
  mov dh,0
  add ax,dx
  add ax,dx
  mov bx,ax  ;显示首位置赋给bx

s:  
  mov al,ds:[si]
  cmp al,0
  je end7
  mov es:[bx],al
  mov es:[bx+1],cl
  inc si
  add bx,2
  jmp short s

end7:
  pop bx
  pop ax
  iret

do7chend:
  nop

code ends
end start