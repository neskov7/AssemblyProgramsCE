.MODEL small
.STACK                              
.DATA

opa dw -459
opb dw 470
opc dw 32756
opd dw 1

.CODE
.STARTUP

mov ax, opa
add ax, opb ; varia il CF perche' cambia segno
add ax, opc ; sign flag indica che siamo su una cifra significativa
add ax, opd ; in "signed" genera overflow sul bit del c2a

.EXIT
END