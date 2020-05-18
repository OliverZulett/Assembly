; Muestra un hola mundo en pantalla
.model small
.stack 64
.data
	cad db "hola mundo $"
.code
Inicio:
	mov ax,@data
	mov ds,ax
;----------------------

	mov ah,09h
	lea dx,cad
	int 21h

;----------------------
	mov ah,4ch
	int 21h

end Inicio