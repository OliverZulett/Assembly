; dado un determinado año calcular la edad de una persona y 
; decir si es menor mayor o igual
;Generar para N térnimos: 5, 10, 15, 20, 25, ...

.model small
.stack 64
.data
    mayor db "Es mayor de edad$"
    menor db "Es nemos de edad"
    edad dw 1991
.code
inicio:
	mov ax,@data
	mov ds,ax
;-----------------------------
	mov ax, 0000h
    mov bx, 2002
    mov ax, 2020
    sub ax, bx

    cmp ax, 18
    jae may ;mayor o igual
    jna men
    jmp salir

may: 
    mov ah,09h
    lea dx,mayor
    int 21h
    jmp salir
men:
    mov ah,09h
    lea dx,menor
    int 21h
    jmp salir

salir:
;-----------------------------
	mov ah,4ch
	int 21h
end inicio