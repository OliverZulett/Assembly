; muevve un elemento en pantalla con las flechas de direccion terina con end

.model small
.stack 64

.data

character db '0$'

fil db 12
col db 38
pag db 0

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

call gotoxy

mov ah, 09h
lea dx, character
int 21h

verificar_tecla: ;espera que se presione una tecla
    mov ah, 10h ; obtiene el cod raster y asccii del caracter ingresado por teclado
    int 16h ; se ingresa el caracter
    ; ah: raster
    ; al: ascci
    cmp ah,48h ; es el raster de la tecla hacia arriba
    je up
    cmp ah,50h ; es el raster de la tecla hacia abajo
    je down
    cmp ah,4bh ; es el raster de la tecla hacia izquierda
    je left
    cmp ah,4dh ; es el raster de la tecla hacia derecha
    je right
    cmp ah,4fh ; es el raster de la tecla hacia end
    je fin
    jmp verificar_tecla

up: 
    sub fil, 1
    call gotoxy
    mov ah, 09h
    lea dx, character
    int 21h
    jmp verificar_tecla

down: 
    add fil, 1
    call gotoxy
    mov ah, 09h
    lea dx, character
    int 21h
    jmp verificar_tecla

left: 
    sub col, 1
    call gotoxy
    mov ah, 09h
    lea dx, character
    int 21h
    jmp verificar_tecla

right: 
    add col, 1
    call gotoxy
    mov ah, 09h
    lea dx, character
    int 21h
    jmp verificar_tecla

fin: 


;-----------------------------
mov ah,4ch
int 21h

;-----procedimientos

gotoxy proc
    push ax
    push bx
    push dx

    mov ah, 02h ; funcion para mover cursos
    mov bh, pag ; numero de pagina en la que se trabajara 
    mov dh, fil ; fila donde se ubicara el cursos
    mov dl, col ; columna donde se ubicara el cursor
    int 10h ; ejecutamos la funcion

    pop dx
    pop bx
    pop ax
    ret
gotoxy endp


end Inicio