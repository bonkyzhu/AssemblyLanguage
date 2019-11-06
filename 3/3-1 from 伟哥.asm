data segment
    score dw 100, 98, 98, 97, 95
        dw 100, 98, 96 ,95, 95
    cn db 2
    sn db 3
    stuc db 5
    classM dw ?
    stuM dw ?
data ends

code segment
    assume cs:code, ds:data
start: mov ax, data
    mov ds, ax

    ; 直接寻址
    mov dx, ds:[0eh]

    mov al, cn
    dec al
    mov bl, stuc
    mul bl
    mov bl, 2
    mul bl
    mov classM, ax

    mov al, sn
    dec al
    mov bl, 2
    mul bl
    mov stuM, ax
    add ax, classM

    mov bx, ax
    mov si, ax
    mov di, ax

    mov dx, [bx]

    mov dx, score[bx]
    mov dx, [score+bx]

    mov bx, offset score
    mov dx, [bx+si]
    mov dx, [bx][si]

    mov bx, classM
    mov si, stuM
    mov dx, score[bx][si]

    mov ah, 4ch
    int 21h

code ends
    end start