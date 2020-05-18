;convierte una cadena en minusculas a mayusculas
.model small
.stack 64
.data
	c db "soy una cadena en minusculas","$"
	
.code
inicio:
	mov ax,@data
	mov ds,ax
;----------------------------

	mov si,0 ;inicio el contador en 0
	mov cx,15 ;declaro el limite del for
for:
	mov al,c[si] ;asingo el caracter de la posicion si a al
	sub al,20h ;le resto 32 posiciones o 20h
	mov ah,02h ;inicio la funcion para mostrar caracteres
	mov dl,al ;muevo el caracter al dl
	int 21h ;muetro el caracter
	add si,1 ;agrego 1 al contador
	
	loop for ;vuelvo al ciclo
	
;----------------------------
	mov ah,4ch
	int 21h
end inicio