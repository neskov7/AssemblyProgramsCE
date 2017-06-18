; iterazione errata
; per correggere trasporre quella di es2 e adattare per dw
dim equ 4
.model small
.stack
.data

riga dw 5,3,9,10
colonna dw 5,6,2,46 
mat dw dim * dim (?)

.code
.startup

mov cx,dim
  
ciclo1:
    mov bx,cx
    mov cx,dim
    ciclo2:
        mov di,cx
        mov ax,riga[bx]
        imul riga[di]
        mov mat[bx][di],ax
    
        loop ciclo2
    mov cx,bx
    
    loop ciclo1
      

.exit
end       