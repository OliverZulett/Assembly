; leer un string
.model small
.stack 64
.data
    nom db 20 dup("$") ;llenamos una cadena con $ de tamaño 20
    m1 db "ingrese su nombre:",10,13,"$"
    m2 db 10,13,"Hola....","$" ;10,13 es salto de line<
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
    mov ah,09h
    lea dx,m1
    int 21h
    mov si,0

while1:
    mov ah,01h
    int 21h ; aqui se guarda el caracter leido
    cmp al,13 ;compara si entro un enter
    je mostrar
    mov nom[si],al ;actualiza el puntero
    inc si
    jmp while1

mostrar:
    mov ah,09h
    lea dx,m2
    int 21h
    lea dx, nom
    int 21h
;-----------------------------
	mov ah,4ch
	int 21h
end inicio