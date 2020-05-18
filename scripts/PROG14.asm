; Compara años para ver si una persona es mayor de edad segun su fecha de nacimientos

.model small
.stack 64
.data
    mayor_edad db "Es mayor de edad$"
    menor_edad db "Es menor de edad$"
    anio_nacimiento dw 1999
    anio_actual dw 2020
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------

	mov ax, 0000h ; limpiamos el registro AX
    mov bx, anio_nacimiento ; bx = 1991
    mov ax, anio_actual ; ax = 2020
    sub ax, bx ; ax = ax - bx

    cmp ax, 18 ; ax = 18 ?
    jae may ; si ax >= 18 salta a 'may'
    jna men ; si ax < 18 salta a 'may'
    ; jmp salir 

may: 
    mov ah,09h ; inicia la funcion para mostrar cadenas
    lea dx,mayor_edad ; asigna la cadena mayor_edad a dx
    int 21h ; muestra la cadena
    jmp salir

men:
    mov ah,09h ; inicia la funcion para mostrar cadenas
    lea dx,menor_edad ; asigna la cadena menor_edad a dx
    int 21h ; muestra la cadena
    jmp salir

salir:

;-----------------------------
	mov ah,4ch
	int 21h
end inicio