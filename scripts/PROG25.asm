; Genera tres lineas de colores en la pantalla

.model small
.stack 64

.data
fini db 5 ; columna inicial de la pantalla
cini db 5 ; fila inicial de la pantalla
ffin db 10 ; fila final de la pantalla
cfin db 50 ; columna final de la pantalla
linea db 5 
color db 41h ; 0100   0001
             ;  RGB    RGB 

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

call clrscr; genera ROJO

mov fini, 10
mov ffin, 15
mov color, 51h ; color amarillo

call clrscr; genera AMARILLO


mov fini, 15
mov ffin, 20
mov color, 21h ; color amarillo

call clrscr; genera VERDE

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