; Muestra un texto en el centro de una pantalla roja

.model small
.stack 64

.data
fini db 0 ; columna inicial de la pantalla
cini db 0 ; fila inicial de la pantalla
ffin db 24 ; fila final de la pantalla
cfin db 79 ; columna final de la pantalla
linea db 0 ; numero de lineas que se va a recorrer
color db 42h ; 0100   0001
             ;  RGB    RGB 

cad db 'HOLA$'

fil db 12
col db 40
pag db 0

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

call clrscr; genera el primer color
call gotoxy

mov ah, 09h
lea dx, cad
int 21h

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

end Inicio