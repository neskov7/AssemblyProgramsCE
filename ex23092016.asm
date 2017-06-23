                   N EQU 9 ; numero di oggetti
W EQU 27 ; capacita` dello zaino
.MODEL small
.STACK
.DATA
valore DB 200, 225, 250, 150, 125, 125, 130, 120, 75 
peso DB 10,12,15,9, 7, 6, 6, 6, 4 
stato DB N DUP (0)
.CODE
.STARTUP
PUSH OFFSET valore
PUSH OFFSET peso
PUSH OFFSET stato
MOV AX, 0
PUSH AX ; valore iniziale di contenuto MOV CX, N
ciclo:
CALL riempiZaino
LOOP ciclo
ADD SP, 8
.EXIT
 
riempiZaino PROC
    mov BP, SP
    mov SI ,0
    mov DI, 0
    mov SI, 0
    mov AX, 0
    mov BX, 0
    mov DX, 0
    
    ciclop:
        mov BX, [BP+4]
        mov AL, [BX][SI]
        cmp AL, 0
        JNZ continue
        mov BX, [BP+8]
        mov AL, BX[SI]
        mov BX, [BP+6]
        mov dh, bx[si]
        div dh
        mov dh, 0
        cmp al,dl
        ja nuovoMax
                
        continue:
            inc si
            cmp si,N
            JNZ ciclop
        jmp updatecurrentsize    
           
        nuovoMax:
            ;prendo il peso del max
            mov bx, [bp+6]
            mov ah, bx[si]
            ;prendo il peso correntedellozaino
            mov bx, [bp+2]
            add bl, ah
            xor ah,ah
            adc bh, 0 ;se fuziona sono un genio
            cmp bx, W
            ja troppoGrande           
            mov dl, al
            mov di, si
            jmp continue
            
        troppoGrande:
            mov bx, [bp+4]
            dec bx[si]
            jmp continue;       
             
        updateCurrentSize:
            cmp dl,0
            jnz fine
            mov bx, [bp+6]
            mov al, bx[di]
            cbw
            add [bp+2],al 
            mov bx, [bp+4]
            inc bx[di] 
            
        fine:    
            ret
    
    
end