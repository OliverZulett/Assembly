; MACRO DE IMPRIME CADENAS EN PANTALLA
print_string macro string

push ax
push dx
mov ah,09h
lea dx,string
int 21h
pop dx
pop ax

endm