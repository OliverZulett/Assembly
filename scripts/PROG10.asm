.model small
.stack 64
.data
	_mul db "el producto de 2 y 3 es : $"
	salto db 10,13,36
	m1 db "cociente: $"
	m2 db "residuo: $"
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------

	; --------MULTIPLICAR---------
	mov al,2 ; al = 2
	mov bl,3 ; bl = 3
	mul bl ; al = al * bl

	mov ah,09h
	lea dx,_mul
	int 21h

	add al,30h ; le sumamos 30h = 48 para volverlo asccii
	mov ah,02h ; inicia funcion de mostrar caracter
	mov dl,al ; al -> dl
	int 21h ; mostramos el caracater
	
	mov ah,09h
	lea dx,salto
	int 21h
	
	mov ax,0 ; limpiamos el resgistro para evitar el desbordamiento
	; ;mov ax,0000h
	
	; --------DIVIDIR---------
	mov al,9 ; al = 9
	mov cl,2 ; cl = 2
	div cl ; cl = al/cl
	; al -> cociente
	; ah -> residuo
	
	mov bl,al ; guardamos el cociencte 
	add bl,30h ; le sumamos 30h = 48 para volverlo asccii

	mov bh,ah ; guardamos el residuo
	add bh, 30h ; le sumamos 30h = 48 para volverlo asccii
	
	;mostrarmos el cociente
	mov ah,09h ; iniciamos la funcion para mostrar cadenas
	lea dx,m1 ; movemos la cadena a DX
	int 21h ; mostramos la cadena
	mov ah,02h ; inicamos la funcion para mostrar caracter
	mov dl,bl ; movemos el caracter a dl
	int 21h ; mostramos el caracter

	mov ah,09h
	lea dx,salto
	int 21h
	
	; ;mostramos el residuo
	mov ah,09h ; iniciamos la funcion para mostrar cadenas
	lea dx,m2 ; movemos la cadena a DX
	int 21h ; mostramos la cadena
	mov ah,02h ; inicamos la funcion para mostrar caracter
	mov dl,bh ; movemos el caracter a dl
	int 21h ; mostramos el caracter

;-----------------------------
	mov ah,4ch
	int 21h
end inicio