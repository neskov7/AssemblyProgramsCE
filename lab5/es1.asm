.model small
.stack
.data

opa dw 2043
opb dw    5
res dw ?

.code
.startup

mov ah,01h
int 21h

cmp al , '1'
jz somma

cmp al , '2'
jz sottrazione
 
cmp al , '3'
jz moltiplicazione

cmp al , '4'
jz divisione

somma:
    mov ax,opa
    add ax,opb
    mov res,ax
    jmp fine

sottrazione:
    mov ax, opa
    sub ax,opb
    mov res,ax
    jmp fine

moltiplicazione:
    mov ax,opa
    mul opb
    mov res,ax
    jmp fine  
    
divisione:
    mov ax,opa
    mov dx,0
    div opb 
    mov res,ax
    jmp fine

fine:
.exit
end