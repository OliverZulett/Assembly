; Muestra caracteres del cero al nueve con comas
.model small
.stack 64
.data

.code
Inicio:
	mov ax, @data
	mov ds,ax
;-----------------

	mov ah,02h ;inicia funcion para mostrar caracteres

	mov dl,30h ;move el 0 al dl
	int 21h ;mostra el caracter del dl

	push dx ;guarda el dx en la pila
	mov dl,2ch ;move la coma al dl
	int 21h ;mostra el caracter

	pop dx ; saca el numero anterior
	add dl,1 ;sumale 1
	int 21h ;mostralo

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h

	push dx
	mov dl, 2ch
	int 21h

	pop dx
	add dl,1
	int 21h
;-----------------
	mov ah, 4ch
	int 21h
end Inicio