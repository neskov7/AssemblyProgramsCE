DIM equ 8

.model small
.stack
.data

valore dw 1, 2, 5, 10, 20, 50, 100, 200
monete db 100, 23, 17, 0, 79, 48, 170, 211 
euro   dw ?
cent   dw ?
.code
.startup

mov ax,0
mov dx,0
mov cx,0
mov dx,0
mov di,0
mov si,0
ciclo: 
    mov al, monete[di] 
    mov ah,0
    mul valore[si]
    add bx,ax
    adc cx,dx    
    inc di
    add si,2
    cmp di,DIM
    jl ciclo 

    
mov ax,bx
mov dx,cx
mov cx,100
div cx

mov euro,ax
mov cent,dx
    

.exit
end