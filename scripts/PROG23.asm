; Cambia el color de la pantalla.

.model small
.stack 64

.data
fini db 0 ; columna inicial de la pantalla
cini db 0 ; fila inicial de la pantalla
cfin db 79 ; columna final de la pantalla
ffin db 24 ; fila final de la pantalla
linea db 0                   
color db 51h ; 5 color de letra, 3 color de fondo son colores en binario convertidos a hex

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

call clrscr; llama a un procedimiento de limpiar pantalla

;-----------------------------
mov ah,4ch
int 21h

;-----procedimientos

clrscr proc near
push ax
push bx
push cx
mov ah, 06h
mov bh,color  ;color del recorrido
mov al,linea  ;linea que va a recorrer
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