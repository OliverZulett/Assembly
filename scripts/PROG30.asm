; Muestra cinco texto en el centro de una pantalla degradados

.model small
.stack 64

.data
fini db 0 ; columna inicial de la pantalla
ffin db 8 ; fila final de la pantalla

cini db 0 ; fila inicial de la pantalla
cfin db 79 ; columna final de la pantalla

linea db 0
color db 12h ; 0100   0001
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

;  muestra los colores --------------
call clrscr

mov fini, 8
mov ffin, 16
mov color, 15h 

call clrscr

mov fini, 16
mov ffin, 24
mov color, 19h 

call clrscr

;  muestra los textos --------------

call gotoxy

mov ah, 09h
lea dx, cad
int 21h

mov fil, 6
mov col, 20
call gotoxy
int 21h ; no es necesario llamar a 09h

mov fil, 6
mov col, 60
call gotoxy
int 21h ; no es necesario llamar a 09h

mov fil, 18
mov col, 20
call gotoxy
int 21h ; no es necesario llamar a 09h

mov fil, 18
mov col, 60
call gotoxy
int 21h ; no es necesario llamar a 09h

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