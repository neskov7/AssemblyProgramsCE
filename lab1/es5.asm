LENGHT equ 7
.MODEL small
.STACK
.DATA
vett DW 423,3191,23,11,-412,2,9 

.CODE
.STARTUP

mov cx,LENGHT/2
mov di, 0
mov si, LENGHT*2-1

inversione: 
    MOV dx,vett[di]
    XCHG vett[si],dx
    MOV vett[di],dx
    add al,2
    sub bl,2
    
    DEC cx
    CMP cx,0
    jnz inversione    


.EXIT
END