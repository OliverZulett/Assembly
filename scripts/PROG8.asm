;manejo de cadenas
.model small
.stack 64
.data
	c db "hola"
	
.code
inicio:
	mov ax,@data
	mov ds,ax
;----------------------------
	
	mov si, 2 ;asigno 2 al contador
	mov al, c[si] ;ubico la posicion si en la cadena c
	
	mov ah,02h ;inicio la funcion de mostrar caracter
	mov dl,al ;muevo el caracter l a sl
	int 21h ;muestro elcaracter
	
	sub al,32 ;resto 32 pocisiones al caracter
	mov dl,al ;muevo el caracter a dl para mostrarlo
	int 21h ;muestro el caracter
	
;----------------------------
	mov ah,4ch
	int 21h
end inicio