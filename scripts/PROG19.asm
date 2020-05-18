; dad una cadena mostrar la misma con espacios
.model small
.stack 64
.data
    c1 db 20 dup("$")
    c2 db 40 dup("$")
    m1 db "ingrese su nombre:",10,13,"$"
    m2 db 10,13,"su nombre es:",10,13,"$"
    m3 db 10,13,"su nombre separado por espacios:",10,13,"$"
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
    mov ah,09h
    lea dx,m1
    int 21h
    mov si,0
    mov di,0

while1:
    mov ah,01h
    int 21h ; aqui se guarda el caracter leido
    cmp al,13 ;compara si entro un enter
    je mostrar
    mov c1[si],al ;actualiza el puntero
    mov c2[di],al
    inc di
    mov c2[di]," "
    inc si
    inc di
    jmp while1

mostrar:
    mov ah,09h
    lea dx,m2
    int 21h
    lea dx,c1
    int 21h
    lea dx,m3
    int 21h
    lea dx,c2
    int 21h
;-----------------------------
	mov ah,4ch
	int 21h
end inicio

; practica 3 cadenas bailarinas juanito JuAnItO