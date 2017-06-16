.MODEL small
.STACK
.DATA
VAR DW ?   ;non sono sicuro che sia init a 0
.CODE
.STARTUP
MOV VAR, 0 ;posso verificare che e' init a 0
mov var, 15 
.EXIT
END