.model small
.stack
.data

a dw -2
b dw 1
c dw 2 
m4 db 4
nonRealeMessage db 'no radici reali!!!!!!'
realeMessage db    'si radici reali!!!!!!'
errorDD db         'delta non rappresentabile in word!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! '

.code
.startup

mov di,0

mov ax,b
imul b
jc erroreDD
mov dx, ax
mov ax,a
imul c
imul m4
sub dx,ax 

cmp dx,0
jl nonRappresentabile


rappresentabile:
    mov ah,02h
    lea si,realeMessage
    mov cx,16
    jmp stampa

erroreDD:
    mov ah,02h
    lea si, errorDD
    mov cx , 30
    jmp stampa

nonRappresentabile:
    mov ah,02h
    lea si, nonRealeMessage
    mov cx , 16
    jmp stampa
    
stampa:
    mov dl, [si]
    int 21h
    inc si
    loop stampa
    jmp fine 

fine:
.exit
end 


   