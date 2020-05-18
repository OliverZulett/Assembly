; Muestra caracteres del cero al nueve con comas con un ciclo
.model small
.stack 64
.data

.code
Inicio:
	mov ax, @data
	mov ds,ax
;------------------------------------------

	mov cx,10 ;mueve el numero 10 al contador y asi defino el limite del ciclo
	mov ah,02h ;inicia la funcion para mostrar caracterers
	mov dl,30h ;move el 0 al dl 

ciclo: ;decalro el ciclo

	int 21h ;muestro el primer caracter
	push dx ;envio el caracter a la pila
	mov dl, ',' ;muevo una coma al dl
	int 21h ;muestro la coma
	pop dx ;saco el caracter de la pila
	add dl,1 ;le sumo 1 al caracter

	loop ciclo ;vuelvo al ciclo

;------------------------------------------
	mov ah, 4ch
	int 21h
end Inicio