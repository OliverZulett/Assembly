; Muestra todos loas caracteres asscci junto con su posicion

.model small
.stack 64
.data
	igual db '=$'
	salto db 13,13,24h
	m1 db "suma: $"
	nombre db "joshua zulett$"
.code
	limite dw 255
Inicio:
	mov ax, @data
	mov ds,ax
;------------		
	mov ax,0000h
	mov ax,0
	mov si,0
	mov bx,10 ; base de la divicio para descomponer
	mov cx,0
	
procesar:
	mov ax,0000h
	mov ax,si
	inc si
	cmp si,255
	je salir
	jmp repetir
	mov bl,00h

repetir:
	mov dx,0000h
	div bx ; divide el ax ocn el bx
	push dx ; guardamos el residuo en la pila
	inc cx ;cx++
	cmp ax, 0 ;compara si es igual a cero
	je mostrarNumero ;si es igual salta a la etiqueta declarada
	jmp repetir ; salta a la etiqueta declarada
	
mostrarNumero:
	mov dx,0000h
	pop dx
	add dl,30h ; solo se suma al dl por que la pila solo nos mostrara una pila por vez
	mov ah,02h
	int 21h
	loop mostrarNumero ;ejecutamos el loop
	mov ah,09h
	lea dx,igual
	int 21h
	jmp procesar
	
mostrarIgual:
	mov ah,09h
	lea dx,igual
	int 21h
	jmp procesar

salir:
	mov ah,09h
	lea dx,nombre
	int 21h

;------------
	mov ah, 4ch
	int 21h
end Inicio