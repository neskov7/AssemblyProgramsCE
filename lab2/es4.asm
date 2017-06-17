.model small
.stack 
.data

giorni db 2
ore db 2
minuti db 30
minutiTotali dw 0 

oreingiorno db 24
minutiinora db 60

.code
.startup

mov bx,0
mov ax,0
mov al, giorni 
cbw
mul oreingiorno
mov bx,ax
mov al,ore
cbw
add ax,bx
mul minutiinora
mov bx,ax
mov al,minuti
cbw
add ax,bx
jo err
mov minutiTotali ,ax 
jmp fine

err:                                        
mov minutiTotali, 0FFFFh
                                        
fine:                                        
.exit
end