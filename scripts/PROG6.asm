.model small
.stack 64
.data
	a db "hola$"
	ca db 41h,42h,43h,24h
	cad db " ","$"
	nombre db 10 dup("*"),24h
	b db 'h','o','l','a','$'
	salto db 10,13,24h
	salto2 db 0ah, 0bh,"$"
	c db 45,49,50,51,36
	d db 01000001b, 00110000b,24h
	
	a1 db "hola",10,13
	b1 db 41h,42h,43h,24h,10,13
	c1 db 'h','o','l','a','$'
	
.code
inicio:
	mov ax,@data
	mov ds,ax
;----------------------------

	;mov ah,09h
	;lea dx,a
	;int 21h
	
	;lea dx,salto
	;int 21h
	
	;lea dx,c1
	;int 21h
	
	;lea dx,salto
	;int 21h
	
	;lea dx,cad
	;int 21h

	;lea dx,salto
	;int 21h
	
	;lea dx,nombre
	;int 21h
	
	mov ah,09h
	lea dx,a1
	int 21h
	
;----------------------------
	mov ah,4ch
	int 21h
end inicio