lung equ 4
.model small
.stack
.data

A DB 1, 2, 4, 5 
B DB 3, 4, 1, 3 
ris db lung dup (0)
pari db 0

.code
.startup

mov cx,lung
lea si,a
lea di,b
lea bx,ris
          
ciclo:
    mov al, [si]
    and al, [di]
    mov [bx],al
    jnp disp
    inc pari
    disp:
    inc si
    inc di
    inc bx
    loop ciclo
  
fine:
.exit
end