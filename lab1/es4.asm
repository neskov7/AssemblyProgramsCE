.MODEL small
.STACK
.DATA
opa dw 32767
opb dw 1
.CODE
.STARTUP

mov ax,opa  
add ax,opb ;overflow flag: si passa a negativo in c2a
add ax,opa ;sf:cifra significativa in signed 
add ax,opb ;cf: passo da 111...11 a 000...000

    
.EXIT
END