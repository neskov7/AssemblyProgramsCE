K equ   32
 
.MODEL small
.DATA
var1 DB 'a'
var2 DB 's'
var3 DB 'm'

.CODE
.STARTUP 
 
;stampa i caratteri a video MAIUSCOLI
mov ah ,2 ;istruzione di stampa  

mov dl , var1 
sub dl , K
int 21h
mov dl ,var2
sub dl, K
int 21h
mov dl , var3
sub dl, K
int 21h


.EXIT
END