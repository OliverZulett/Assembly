;Muestra una cadena con espacios entre los caracteres, ingresada por consola en minusculas
.model small
.stack 64
.data
    ; declaramos una cadena de longitud = 20 que estara llena del signo $
    ; ya que una cadena siempre termina con $
    _name db 20 dup("$") 
    esp_name db 40 dup("$") 
    message_1 db "Ingresa tu nombre:",10,13,"$"
    message_2 db 10,13,"Hola.... ","$" ;10,13 es salto de line<
    message_3 db 10,13,"tu nombre con espacios es: ","$" ;10,13 es salto de line<
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------

    mov ah,09h ; inicia la funcion para mostrar cadenas; inicia la funcion para mostrar cadenas
    lea dx,message_1  ; asigna la cadena message_1 a dx
    int 21h ; muestra message_1
    ; iniciamos el contador si de la cadena _name
    mov si,0 ; si = 0
    ; iniciamos el contador di la cadena esp_name
    mov di,0 ; di = 0

read_character:
    mov ah,01h ; lee el caracter por pantalla
    int 21h ; aqui se guarda el caracter leido
    ; el caracter se guarda en al
    cmp al,13 ;compara si el caracter guardado es igual a 13 (enter)
    je mostrar ;si es igual salta a 'mostrar'
    mov _name[si],al ; asigna el caracter a la posicion si de la cadena _name
    mov esp_name[di],al ; asigna el caracter a la posicion si de la cadena esp_name
    inc di ; di ++
    mov esp_name[di]," " ; asigna el caracter a la posicion si de la cadena esp_name
    inc si ; si ++
    inc di ; di ++
    jmp read_character ; vuelve a leer un caracter

mostrar:
    mov ah,09h ; inicia la funcion para mostrar cadenas
    lea dx,message_2 ; asigna la cadena message_2 a dx
    int 21h ; muestra la cadena
    lea dx,_name ; asigna la cadena _name a dx
    int 21h ; muestra la cadena
    lea dx,message_3 ; asigna la cadena message_3 a dx
    int 21h ; muestra la cadena
    lea dx,esp_name ; asigna la cadena esp_name a dx
    int 21h ; muestra la cadena

;-----------------------------
	mov ah,4ch
	int 21h
end inicio