; leer un string y volverlo a mayusculas
.model small
.stack 64
.data
    nom db 20 dup("$") ;llenamos una cadena con $ de tamaño 20
    monmay db 20 dup("$")
    m1 db "ingrese su nombre:",10,13,"$"
    m2 db 10,13,"Hola....","$" ;10,13 es salto de line<
    m3 db 10,13,"su nombre en mayusculas es: ","$" ;10,13 es salto de line<
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
    sub al,20h
    mov monmay[si],al
    inc si
    jmp while1

mostrar:
    mov ah,09h
    lea dx,m2
    int 21h
    lea dx,nom
    int 21h
    lea dx,m3
    int 21h
    lea dx, monmay
    int 21h
;-----------------------------
	mov ah,4ch
	int 21h
end inicio

; practica 3 cadenas bailarinas juanito JuAnItO