DIM equ 20
.model small
.stack
.data

vett db DIM (?) 

.code
.startup       

mov cx,dim
mov di,0

ciclo:
    cmp di,0
    jz inizializzazione
    cmp di,1
    jz inizializzazione
    
    mov al,vett[di-1]
    add al,vett[di-2]
    mov vett[di],al
    
    returnPoint:
    inc di
    loop ciclo 
    jmp fine
    
inizializzazione:
    mov vett[di],1
    jmp returnPoint   

fine:
.exit
end