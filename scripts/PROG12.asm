; Multiplica dos numeros y los muestra en formato ASCCII
.model small
.stack 64
.data
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------

	mov ax,0000h ; limpiamos el registro AX

	mov ax,25 ; ax = 25
	mov bx,5 ; bx = 5
	mul bx ; ax = ax * bx
	
	mov bx,10 ; bx = 10 base de divicion
	mov cx,0 ; contador del loop 'mostrar'

repetir:
	mov dx,0000h ; limpiamos el registro DX
	div bx ; AX = AX/BX
	; AX -> cociente
	; DX -> residuo
	push dx ; guardamos el residuo en la pila
	inc cx ; cx ++ incrementamos en 1 el contador
	cmp ax, 0 ; compara si ax es igual a cero
	je mostrar ;si es igual salta a la etiqueta declarada
	jmp repetir ; salta a la etiqueta declarada
	
mostrar:
	mov dx,0000h ; limpiamos el registro DX
	pop dx ; saca un elemento de la pila en DX
	mov ah,02h ; iniciamos la funcion para mostrar caracter
	add dl,30h ; sumamos 30h = 48 para volverlo ASCCII
	int 21h ; mostramos el caracter en dl
	loop mostrar ; ejecutamos el loop
	
;-----------------------------
	mov ah,4ch
	int 21h
end inicio