.MODEL small
.STACK
.DATA
n1 db 10
n2 db 10h
n3 db 10b  
res db 0


.CODE
.STARTUP

mov al, n1
add al, n2
sub al, n3
mov res ,al


.EXIT
END