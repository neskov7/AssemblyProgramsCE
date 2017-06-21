DIM EQU 8
.model small
.stack
.data

num db 25
res db 0

.code
.startup

mov cx,DIM
ciclo:
    rol num,1
    adc res,0
    loop ciclo  
  
.exit
end