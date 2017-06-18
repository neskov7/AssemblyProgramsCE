dim equ 10
.model small
.stack
.data

tavola db dim*dim dup (0)

.code
.startup

mov bx,0 
mov cx,dim

ciclo1:
    mov di,0
    mov dx, dim
    sub dx, cx
    push cx
    mov cx,dx
    ciclo2:
        mov ax, cx
        mul di       
        mov tavola[bx][di],al
        inc di
        cmp di,dim
        jnz ciclo2
    pop cx    
    add bx,dim
    cmp bx,dim
    loop ciclo1
   
.exit
end