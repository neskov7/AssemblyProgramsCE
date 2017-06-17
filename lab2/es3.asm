DIM EQU 5  
LF EQU 10
CR EQU 13
.MODEL SMALL
.STACK
.DATA

RIS DW 0
errore1 db 'ERRORE:   Caratteri non numerici introdotti!!!!!', CR, LF 
errore2 db 'ERRORE:   Intero introdotto troppo grande!!!!!!!', CR, LF
BASE DB 10
.CODE
.STARTUP

MOV AX,0
MOV DI,0
MOV CX,0

      
LETTURA:
    MOV AH , 01H
    INT 21H
    CMP AL,CR
    JZ  FIN
    CMP AL, '0' ; VERIFICO CHE ASCII NON MINORE
    JL ERR1
    CMP AL ,'9'  ; VERIFICO CHE ASCII NON MAGGIORE
    JG ERR1
    SUB AL, '0' ; CONVERTO IN BINARIO 
    MOV AH,0 
    MOV BX, AX
    MOV AX, RIS
    MUL BASE
    ADD AX, BX
    MOV RIS,AX 
    JNZ LETTURA
    
ERR1:
    MOV AH,02H 
    LEA SI, ERRORE1
    MOV CX , 50

STAMPA1:
    INT 21H
    INC SI
    LOOP STAMPA1
    JMP FIN    
    
ERR2:
    MOV AH, 02H
    LEA SI , ERRORE2
    MOV CX , 50 
STAMPA2: 
    INT 21H
    INC SI
    LOOP STAMPA2
    JMP FIN
        
FIN:
      

.EXIT
END