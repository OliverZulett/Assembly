;muestra una mensaje en pantalla con cadenas
.model small
.stack 64
.data
	mensaje db "**********************",10,13
			 db "*                    *",10,13
			 db "*   ",01h,"oliver zulett   *",10,13
			 db "*                    *",10,13
			 db "**********************",10,13
			 db "$"
	
.code
inicio:
	mov ax,@data
	mov ds,ax
;----------------------------
	
	mov ah,09h ;inicio la funcion para mostrar cadenas
	lea dx,mensaje ;asingo la cadena mensaje a dx
	int 21h ;muestro la cadena
	
;----------------------------
	mov ah,4ch
	int 21h
end inicio