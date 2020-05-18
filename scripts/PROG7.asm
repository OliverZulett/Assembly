;muestra una caratula
.model small
.stack 64
.data
	caratula db "**********************",10,13
			 db "*                    *",10,13
			 db "*   ",01h,"joshua zulett   *",10,13
			 db "*                    *",10,13
			 db "**********************",10,13
			 db "$"
	
.code
inicio:
	mov ax,@data
	mov ds,ax
;----------------------------
	
	mov ah,09h ;inicio la funcion para mostrar cadenas
	lea dx,caratula ;asingo la cadena caratula a dx
	int 21h ;muestro la cadena
	
;----------------------------
	mov ah,4ch
	int 21h
end inicio