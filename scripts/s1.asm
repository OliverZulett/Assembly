; Ingresado un numero desde teclado mostrar la serie: 2,0,4,0,6,0,8....(N=7)
; Autor: Marisol Tellez Ramirez

include macro1.asm
.model small
.stack 64
.data	
	m1 db 'Ingrese numero: $'
	salto db 10,13,'$'
	num db 5 dup('$')
	cero db "0 $"
.code
inicio:
	mov ax, @data
	mov ds, ax
;-------------------------------------
	mostrarcad m1  ; ingrese numero
	mostrarcad salto ; 
	call leernum   ; Procedimiento para leer numeros desde teclado aqui ingreso 7
	mov cx,ax   ; una vez leido y transformado en ascci lo guardamos en cx cx=7
	mov ax,2    ; iniciamos la serie en 2
	mov bx,0    ; bx sera un contador que debe llegar a cx 
	mov dx,0
		
	ciclo:
		cmp bx,cx
		je fin    ; cuando llegue a cx termina OJO  cx es equivalente a N  en la serie
		cmp dx,0  ; dx hace la funcion de SW variable bandera
		je pares
		jne ceros
		ceros: 
			mostrarcad cero
			mov dx,0
			inc bx
			jmp ciclo
		pares:
			call numcad     ; procedimiento para convertir un numero en cadena desplegable en pantalla, devuelve en num
			mostrarcad num
			mov dx,1
			add ax,2
			inc bx
			jmp ciclo
	fin:
;-------------------------------------
	mov ah,4ch
	int 21h
;PROCEDIMIENTOS
leernum proc
; Lee un numero desde teclado y devuelve el numero en AX
	push bx
	push cx
	mov ax,0
	mov bx,10
	mov cx,0
f1:
	push ax; metemos a la pila el cero
	mov ah,01h ;con esta funcion lee un caracter ascci desde teclado
	int 21h
	cmp al,13 ; compara si se presiono enter
	je salir ; si se presiono enter se va a salir
	sub al,30h ;le restamos 30h para volverlo numero
	mov cl,al ; guardamos el numero en el cl para que no se sobreescriba
	pop ax ;recuperamos el numero
	mul bx ;multiploca ax por 10
	add ax,cx
	jmp f1
salir:
	pop ax
	pop cx
	pop bx
	ret
leernum endp

numcad proc
; Convierte un numero en cadena. Requiere en AX el numero y devuelve en num la cadena 
	push cx
	push si
	push dx
	push bx
	push ax
	mov bx,10
	mov cx,0
	mov dx,0
	mov si,0
digitos:
	div bx
	push dx
	mov dx,0
	inc cx
	cmp ax,0
	je cadena
	jmp digitos
cadena:
	pop dx
	add dl,30h
	mov num[si],dl
	inc si
	loop cadena
	mov num[si],' '
	pop ax
	pop bx
	pop dx
	pop si
	pop cx
	ret
numcad endp

end inicio