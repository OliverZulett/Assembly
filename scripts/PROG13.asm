;Generar la serie: 5, 10, 15, 20, 25, ... para N térnimos.

.model small
.stack 64
.data
.code
	n dw 10
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
	mov ax,0000h ; limpiamos el registro AX

    mov ax,5 ; ax = 5

	mov cx,n  ; cx = 10
    add cx,1 ; cx = cx + 1
    mov bx,10 ; bx = 10

procesar_numero: 
	dec cx ; cx = cx - 1
    mov ax,0000h ; limpiamos el registro AX
    mov ax,5 ; ax = 5
    mul cx ; ax = ax * cx
    cmp cx,0 ; cx = 0 ?
    je limite_pila ; si cx = 0 salta a 'limite_pila'
    jmp guardar_en_pila ; si no salta a 'guardar_en_pila'

limite_pila:
    mov ax,0000h ; limpiamos el registro AX
    mov ax,n ; ax = 10
    mov cx,2 ; cx = 2
    mul cx ; ax = ax * cx
    mov cx,ax ; cx = ax
    dec cx ; cx = cx - 1
    jmp mostrar

guardar_en_pila:
	mov dx,0000h ; limpiamos el registro DX
	div bx ; AX = AX/BX
	; AX -> cociente
	; DX -> residuo
	push dx ; guardamos el residuo en la pila
	cmp ax, 0 ; compara si ax es igual a cero
	je procesar_numero ;si es igual salta a la etiqueta declarada
	jmp guardar_en_pila ; salta a la etiqueta declarada

mostrar:
	mov dx,0000h ; limpiamos el registro DX
	pop dx ; saca un elemento de la pila en DX
	add dl,30h ; sumamos 30h = 48 para volverlo ASCCII
	mov ah,02h ; iniciamos la funcion para mostrar caracter
	int 21h ; mostramos el caracter en dl
	loop mostrar ; ejecutamos el loop
	
;-----------------------------
	mov ah,4ch
	int 21h
end inicio