; Mueve un caracter en pantalla con las flechas direccionales y terina con la tecla end.

.model small
.stack 64

.data

character db '0$'

fil db 12
col db 38
pag db 0

fini db 0 ; columna inicial de la pantalla
ffin db 24 ; fila final de la pantalla

cini db 0 ; fila inicial de la pantalla
cfin db 79 ; columna final de la pantalla

linea db 0
color db 1bh ; 0100   0001
             ;  RGB    RGB 

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

call gotoxy
call print_character

key_verify: ;espera que se presione una tecla
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
    jmp key_verify

up: 
    sub fil, 1
    cmp fil, 0
    je key_verify
    call clrscr
    call gotoxy
    call print_character
    jmp key_verify

down: 
    add fil, 1
    cmp fil, 24
    je key_verify
    call clrscr
    call gotoxy
    call print_character
    jmp key_verify

left: 
    sub col, 1
    cmp col, 0
    je key_verify
    call clrscr
    call gotoxy
    call print_character
    jmp key_verify

right: 
    add col, 1
    cmp col, 79
    je key_verify
    call clrscr
    call gotoxy
    call print_character
    jmp key_verify

fin: 


;-----------------------------
mov ah,4ch
int 21h

;-----procedimientos

;MOSTRAR CARACTER
print_character proc
push ax
push dx
mov ah, 09h
lea dx, character
int 21h
pop dx
pop ax
ret
print_character endp

; LIMPIAR PANTALLA
clrscr proc near
; siempre hay que salvar estas variables antes de ejecutar procedimientos
push ax 
push bx
push cx

mov ah, 06h ; permite hacer recorrido de la pantalla 
mov bh,color  ; color del recorrido (color de fondo, color de frente)
mov al,linea  ; linea que va a recorrer
mov ch,fini  ; fila inicial donde comenzara el recorrido
mov cl,cini  ; columna inicial donde comenzara el recorrido
mov dh,ffin  ; fila final donde termina el recorrido
mov dl,cfin  ; columna final donde termina el recorrido
int 10h

pop cx
pop bx
pop ax
ret
clrscr endp

; MOVER CURSOS
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