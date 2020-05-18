;Generar para N térnimos: 5, 10, 15, 20, 25, ...

.model small
.stack 64
.data
	m1 db "cociente: $"
	m2 db "residuo: $"
.code
	n dw 10
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
	mov ax,0000h
    mov ax,5
	mov cx,n
    add cx,1
    mov bx,10

procesar: 
	dec cx
    mov ax,0000h
    mov ax,5
    mul cx
    ;   mov ax,cx
    cmp cx,0
    je numero
    jmp repetir

numero:
    mov ax,0000h
    mov ax,n
    mov cx,2
    mul cx
    mov cx,ax
    dec cx
    jmp mostrar

repetir:
	mov dx,0000h
	div bx ; divide el ax ocn el bx
	push dx ; guardamos el residuo en la pila
	cmp ax, 0 ;compara si es igual n cero
	je procesar ;si es igual salta n la etiqueta declarada
	jmp repetir ; salta n la etiqueta declarada

mostrar:
	mov dx,0000h
	pop dx
	add dl,30h ; solo se suma al dl por que la pila solo nos mostrara una pila por vez
	mov ah,02h
	int 21h
	loop mostrar ;ejecutamos el loop
	
;-----------------------------
	mov ah,4ch
	int 21h
end inicio