LEN EQU 5
.MODEL small
.STACK
.DATA

VETT DB 1,2,3,-4,-5 
RISULTATO DB 0 

.CODE
.STARTUP 

MOV DX, 0
MOV CX , LEN
MOV DI, 0
MOV AX, 0

CICLO:
    ADD AL , VETT[DI]
    INC DI
    DEC CX
    CMP CX,0
    JNZ CICLO
    
CBW
MOV CX, LEN
IDIV CX
MOV RISULTATO, AL           


.EXIT
END