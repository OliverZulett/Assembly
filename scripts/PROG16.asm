; leer un caracter
.model small
.stack 64
.data
    m1 db "ingrese un caracter:",10,13,"$"
    m2 db 10,13,"Usted a ingesado el caracter:","$" ;10,13 es salto de line<
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
    mov ah,09h
    lea dx,m1
    int 21h

    mov ah,01h
    int 21h ; aqui se guarda el caracter leido

    mov ah,09h
    lea dx,m2
    int 21h

    mov ah,02h
    mov dl,al
    int 21h
;-----------------------------
	mov ah,4ch
	int 21h
end inicio