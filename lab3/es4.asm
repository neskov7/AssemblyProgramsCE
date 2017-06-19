dim equ 4
.model small
.stack
.data

vett db -5,-45,-96,-128
bds dd 69000
risultato dd ?

.code
.startup

mov cx,dim
mov di,0
mov bx,0
ciclo:
    mov al,vett[di]
    cbw
    add bx,ax
    inc di
    loop ciclo 

mov ax,bx
cwd
add ax,word ptr bds
adc dx,word ptr bds+2

mov word ptr risultato, ax
mov word ptr risultato+2,dx  

.exit
end