.model small
.stack
.data
var DB 6 
var2 DB '6'
.code
.startup

mov ah,2 ;2 stampa ;1acquisizione da tastiera      
mov dl , var ; in DL va quello da stampare
int 21h ;legge ah -> sta uno -> stampa contenuoto di DL
;stampa il carattere ascii numero 2 
mov dl , var2
int 21h
mov dl , var ;provo a stampare '6' da var
; posso sommare 48 per arrivare alla zona ascii dei caratteri
; oppure posso sommare '0' che corrisponde al codice ascii 48
add dl , '0' ; ==add dl , 48
int 21h 
;per andare a capo stampo 2 simboli:
; new line = 10
; carriege return = 13
mov dl , 10
int 21h ;non va a capo e in caso sovrascrive se torna indietro con il c returne
mov dl ,13
int 21h ;senza il carryage return si riprende alla stessa altezza
mov dl , 'a'
int 21h
.exit
end