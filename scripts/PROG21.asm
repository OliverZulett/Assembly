; Muestra la serie de pares y ceros : 2 0 4 0 6 ...

include M01.asm ; llamamos al MAcro01 que almacena el codigo para mostrar cadenas

.model small
.stack 64
.data	
	message_1 db 'Ingrese limite de la serie: $'
	salto db 10,13,'$'
	num_par db 5 dup('$')
	cero db "0 $"

.code
inicio:
	mov ax, @data
	mov ds, ax
;-------------------------------------

	print_string message_1  ; ingrese numero
	print_string salto ; salto de linea

	call read_number   ; Procedimiento para leer numeros desde teclado aqui ingreso 7
	mov cx,ax   ; una vez leido y transformado en ascci lo guardamos en cx cx=7

	mov ax,2    ; iniciamos la serie en 2
	mov bx,0    ; bx sera un contador que debe llegar a cx 
	mov dx,0	; hace de switch
		
	ciclo:
		cmp bx,cx
		je fin    ; cuando llegue a cx termina OJO  cx es equivalente a N  en la serie
		cmp dx,0  ; dx hace la funcion de SW variable bandera
		je pares
		jne ceros

		ceros: 
			print_string cero
			mov dx,0 ; dx se vuelve 0 para emprimir pares
			inc bx
			jmp ciclo

		pares:
			call numcad  ; procedimiento para convertir un numero en cadena desplegable en pantalla, devuelve en num_par
			print_string num_par ; reasigna num_par con la cadena del numero par en ascci
			mov dx,1 ; se vuelve 1 para imprimir ceros
			add ax,2 
			inc bx
			jmp ciclo

	fin:

;-------------------------------------
	mov ah,4ch
	int 21h


;PROCEDIMIENTOS

read_number proc
	; Lee un numero desde teclado y devuelve el numero en AX
		push bx
		push cx

		mov ax,0
		mov bx,10
		mov cx,0

	read:
		push ax; metemos a la pila el cero
		mov ah,01h ;con esta funcion lee un caracter ascci desde teclado
		int 21h
		cmp al,13 ; compara si se presiono enter
		je salir ; si se presiono enter se va a salir
		sub al,30h ;le restamos 30h para volverlo numero
		mov cl,al ; guardamos el numero en el cl para que no se sobreescriba
		pop ax ;recuperamos el numero
		mul bx ;multiploca ax por 10
		add ax,cx ;ax = ax + num_leido
		jmp read

	salir:
		pop ax
		pop cx
		pop bx
		ret

read_number endp

numcad proc
	; Convierte un numero en cadena. Requiere en AX el numero y devuelve en num_par la cadena 
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
		mov num_par[si],dl
		inc si
		loop cadena
		mov num_par[si],' '
		pop ax
		pop bx
		pop dx
		pop si
		pop cx
		ret

numcad endp

end inicio