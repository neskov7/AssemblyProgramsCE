DIM EQU 5 

.model small
.stack
.data

matrix dw 1, 4, 5, 6, 7 
       dw 4, 2, 8, 6, 4 
       dw 5, 8, 3, 2, 9 
       dw 6, 6, 2, 4, 4 
       dw 7, 4, 9, 4, 5
 
.code
.startup

mov dl,2
mov bx,0
mov di,0 
mov cx,DIM
cs1:
    mov di,bx+1
    cs2:
        cmp di,DIM
        jl cs2     
        
        cmp matrix[bx][di],0
        jnz noDiago
        rp:
        mov ax, matrix[di][bx]
        cmp matrix[bx][di],ax
        jnz noSimm 
          
        inc di
        cmp di,DIM
        jl cs2 
        
    add bx, DIM                 
    loop cs1 
    
mov ah,02h 
add dl,'0'
int 21h
jmp fine    

     

noSimm:
    mov dl,0
    mov ah,02h
    int 21h
    jmp fine
    
noDiago:
    mov dl,1
    jmp rp    

    
fine:    
.exit
end