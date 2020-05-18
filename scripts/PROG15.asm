;Muestra un caracter ingresado por consola

.model small
.stack 64
.data
    message_1 db "ingrese un caracter: ",10,13,"$" ;10,13 es salto de line<
    message_2 db 10,13,"Usted a ingesado el caracter: ","$" 
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
    mov ah,09h ; inicia la funcion para mostrar cadenas
    lea dx,message_1 ; asigna la cadena message_1 a dx
    int 21h ; muestra la cadena

    mov ah,01h ; lee el caracter por pantalla
    ; el caracter se guarda en al
    int 21h ; guarda el caracter leido

    mov ah,09h ; inicia la funcion para mostrar cadenas
    lea dx,message_2 ; asigna la cadena message_2 a dx
    int 21h ; muestra la cadena

    mov ah,02h ; inicia la funcion para mostrar caracter
    mov dl,al ; dl = al mueve el caracter a dl para mostrarlo
    int 21h ; muestra el caracter

;-----------------------------
	mov ah,4ch
	int 21h
end inicio