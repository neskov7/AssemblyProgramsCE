DIM EQU 6

.model small
.stack
.data

numeri  DB 2, 15, 36, 37, 20, 97 
ris DB DIM DUP(0) 


.code
.startup

lea di,numeri
lea si,ris
mov cx, DIM

ciclo1:
    
    mov bx,[di]
    dec bx
    mov ax,0
    mov dx,0
    ciclo2: 
        cmp bx,1        
        jle ciclo2
        mov al,[di]
        cbw
        div bx
        cmp dx,0
        jnz  notprime
        dec bx
        cmp bx,1        
        jle ciclo2
    mov byte ptr [si],1
    notPrime:
    inc di
    inc si
    loop ciclo1

.exit
end