NUMCOL equ 6
NUMRIG equ 4
.model small
.stack
.data
 
tabella dw 154, 123, 109, 86, 4, ?
        dw 412, -23, -231, 9, 50, ?
        dw 123, -24, 12, 55, -45, ?
        dw NUMCOL dup(?) 

.code
.startup

mov cx,NUMRIG-1
mov bx,0
crig:
    push cx
    mov cx,NUMCOL-1 
    mov ax,0 
    mov si,0
    ccol:
        add ax,tabella[bx][si]
        
        add si,2
        loop ccol
    mov tabella[bx][si],ax  
    pop cx
    add bx,NUMCOL*2   
    loop crig
    
mov bx,0
mov cx,NUMCOL    
cc:
    push cx
    mov cx,NUMRIG-1
    mov ax,0
    mov si,0
    cr:
       add ax,tabella[si][bx]
       
       add si,NUMCOL*2
       loop cr
    pop cx
    mov tabella[si][bx] , ax
    add bx,2
    loop cc        
   
.exit
end