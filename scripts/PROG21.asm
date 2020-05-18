; Leer una cadena y convertirla en cadena Bailarina
.model small
.stack 64
.data
    cadena db 20 dup("$")
    cadenaBailarina db 20 dup("$")
    m1 db "Ingrese una cadena:",10,13,"$"
    m2 db 10,13,"Su cadena ingresada es: ","$"
    m3 db 10,13,"Su cadena bailarina es: ","$"
.code
    divisor dw 2
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
    mov ah,09h
    lea dx,m1
    int 21h
    mov si,0

minusculas:
    mov ax,0000h
    mov dx,0000h
    mov ah,01h
    int 21h
    cmp al,13
    je mostrar
    mov cadena[si],al
    mov bl,al
    mov ax,si
    div divisor
    cmp dx,0
    je mayusculas
    mov cadenaBailarina[si],bl
    inc si
    jmp minusculas

mayusculas:
    sub bl,20h
    mov cadenaBailarina[si],bl
    inc si
    jmp minusculas

mostrar:
    mov ah,09h
    lea dx,m2
    int 21h
    lea dx,cadena
    int 21h
    lea dx,m3
    int 21h
    lea dx,cadenaBailarina
    int 21h
;-----------------------------
	mov ah,4ch
	int 21h
end inicio