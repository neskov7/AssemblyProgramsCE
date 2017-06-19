DIM EQU 8
    
.model small
.stack
.data

matrice db 0, 4 , 0 , 0, 0 , 0 , 0 , 60 
        db 0, 5 , 0 , 0, 11, 0 , 0 , 0 
        db 0, 5 , 7 , 0, 0 , 10, 0 , 0 
        db 0, 0 , 0 , 9, 0 , 0 , 49, 0 
        db 0, 0 , 10, 0, 0 , 0 , 0 , 0 
        db 0, 10, 3 , 9, 0 , 0 , 12, 0 
        db 0, 0 , 58, 0, 0 , 17, 0 , 0 
        db 0, 1 , 0 , 0, 3 , 0 , 0 , 0 
        

somme db DIM*DIM (0)

coordx dw ?
coordy dw ?        

.code
.startup

mov di,0
mov bx,0
mov cx,DIM
mov dx,0

cicloy:
    
    mov di,0
    
    ciclox:
        mov ax,0
        
        cmp bx,0
        jz skipNord
        mov al,matrice[bx-DIM][di]
        add ah,al       
        skipNord:
        
        cmp bx,DIM-1
        jz skipSud
        mov al,matrice[bx+DIM][di]
        add ah,al
        skipSud:
        
        cmp di,0
        jz skipOvest
        mov al,matrice[bx][di-1]
        add ah,al        
        skipOvest:
        
        cmp di,DIM-1
        jz skipEst
        mov al,matrice[bx][di+1]
        add ah,al
        skipEst:
        
        mov somme[bx][di],ah
        
        ;check del max
        cmp ah,dl
        jg aggiornaMax
        
        rp:
        inc di
        cmp di,DIM
        jnz ciclox
    
    add bx,DIM
    loop cicloy
jmp fin 

aggiornaMax:
    mov dl,ah
    mov coordx,di
    mov coordy,bx
    jmp rp

fin:
.exit
end