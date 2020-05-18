.model small
.stack 64
.data
	cadena db "hola mundo $"
	; _byte db 1,2,3,200
	_byte db "200"
	_word dw 1,2,3,200,1500
	_doubleWord dd 1,2,3,200,1500,60000
.code
Inicio:
	mov ax,@data
	mov ds,ax
;------------------------

	mov ah,09h
	lea dx,cadena
	int 21h
	mov ah,02h
	mov dl,_byte
	int 21h

;------------------------
	mov ah,4ch
	int 21h
end Inicio