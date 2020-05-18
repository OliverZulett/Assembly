;generar la serie 5,10,15,20 n=N Tarea
.model small
.stack 64
.data
	m1 db "suma: $"
	m2 db "resta: $"
	m3 db "multiplicacion: $"
	m4 db "divicion: $"
	m5 db "modulo: $"
	
	a dw 24
	b dw 3
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
	mov ax,0000h
	mov ax,a
	mov bx,b
	;mul bx ;el resultado estara en ax
	add ax,bx
	
	mov bx,10 ; base de la divicio para descomponer
	mov cx,0

repetir:
	mov dx,0000h
	div bx ; divide el ax ocn el bx
	push dx ; guardamos el residuo en la pila
	inc cx ;cx++
	cmp ax, 0 ;compara si es igual a cero
	je mostrar ;si es igual salta a la etiqueta declarada
	jmp repetir ; salta a la etiqueta declarada
	
mostrar:
	mov dx,0000h
	pop dx
	add dl,30h ; solo se suma al dl por que la pila solo nos mostrara una pila por vez
	mov ah,02h
	lea dx,m1
	int 21h
	loop mostrar ;ejecutamos el loop

	
;-----------------------------
	mov ah,4ch
	int 21h
end inicio