DIM EQU 8
.model small
.stack
.data 

opa db ?
opb db ?
ris db ?
.code
.startup

mov ax,0
mov ah,01h
mov bx,0
mov cx,DIM 
mov si,0
cicloa:     
    int 21h
    sub al , '0' 
    dec cx
    shl al,cl
    or bl,al   
    cmp cx,0
    jg cicloa
int 21h
mov opa,bl
xor bx,bx 

mov cx,dim    
ciclob:
    int 21h
    sub al,'0'
    dec cx
    shl al,cl
    or bl,al
    cmp cx,0
    jg ciclob
int 21h
mov opb,bl 

mov al,opa
xor al,opb
mov ah,opb
not ah
and ah,opa
not ah
or  ah,al

mov ris,ah

fine:
.exit
end