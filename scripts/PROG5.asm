; muestra todos los caracters ascci
.model small
.stack 64
.data

.code
Inicio:
	mov ax, @data
	mov ds,ax
;------------------------

	mov cx,255 ;le doy un limite al ciclo
	mov ah,02h ;inicio la funcion que muestra caracteres en pantalla
	mov dl,01h ;muevo el primer caracter a dl

ciclo: ;inicio el cilo

	int 21h ;muestro el caracter
	push dx ;guardo el caracter en la pila
	mov dl, ',' ;muevo una coma para mostrar
	int 21h ;muestro la coma
	pop dx ;saco el caracter
	add dl,1 ;le sumo uno al caracter

	loop ciclo ;vuelvo al ciclo hasta el cx

;------------------------
	mov ah, 4ch
	int 21h
end Inicio