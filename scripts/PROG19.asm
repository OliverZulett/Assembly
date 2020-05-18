;Muestra una cadena bailarina, ingresada por consola en minuscula
.model small
.stack 64
.data
    ; declaramos una cadena de longitud = 20 que estara llena del signo $
    ; ya que una cadena siempre termina con $
    _name db 20 dup("$") 
    dancing_name db 40 dup("$") 
    message_1 db "Ingresa tu nombre:",10,13,"$"
    message_2 db 10,13,"Hola.... ","$" ;10,13 es salto de line<
    message_3 db 10,13,"tu nombre en cadenas bailarinas es: ","$" ;10,13 es salto de line<
.code
    val dw 2
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------

    mov ah,09h ; inicia la funcion para mostrar cadenas; inicia la funcion para mostrar cadenas
    lea dx,message_1  ; asigna la cadena message_1 a dx
    int 21h ; muestra message_1
    ; iniciamos el contador si
    mov si,0 ; si = 0

read_character:
    mov ax,0000h
    mov dx,0000h
    mov ah,01h ; lee el caracter por pantalla
    int 21h ; aqui se guarda el caracter leido
    ; el caracter se guarda en al
    cmp al,13 ;compara si el caracter guardado es igual a 13 (enter)
    je print_string ;si es igual salta a 'print_string'
    mov _name[si],al ; asigna el caracter a la posicion si de la cadena _name
    mov bl,al
    mov ax,si ; ax = si
    div val ; ax = ax/dx
	; AX -> cociente
	; DX -> residuo
    cmp dx,0 ; si ax = 0 ?
    je upppercase
    mov dancing_name[si],bl ; asigna el caracter a la posicion si de la cadena may_name
    inc si ; si ++
    jmp read_character ; vuelve a leer un caracter

; lowercase:

upppercase:
    sub bl,20h
    mov dancing_name[si],bl ; asigna el caracter a la posicion si de la cadena may_name
    inc si ; si ++
    jmp read_character ; vuelve a leer un caracter

print_string:
    mov ah,09h ; inicia la funcion para mostrar cadenas
    lea dx,message_2 ; asigna la cadena message_2 a dx
    int 21h ; muestra la cadena
    lea dx,_name ; asigna la cadena _name a dx
    int 21h ; muestra la cadena
    lea dx,message_3 ; asigna la cadena message_3 a dx
    int 21h ; muestra la cadena
    lea dx,dancing_name ; asigna la cadena dancing_name a dx
    int 21h ; muestra la cadena

;-----------------------------
	mov ah,4ch
	int 21h
end inicio