; Genera un cuadrado en la pantalla.

.model small
.stack 64

.data
fini db 5 ; columna inicial de la pantalla
cini db 10 ; fila inicial de la pantalla
cfin db 69 ; columna final de la pantalla
ffin db 20 ; fila final de la pantalla
linea db 0                   
; 0110 color de fondo | 0100 color de frente
color db 64h ; 5 color de letra, 3 color de fondo son colores en binario convertidos a hex

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