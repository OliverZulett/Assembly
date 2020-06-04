; Genera un cuadro en el centro de la pantalla dividido en lineas de colores

.model small
.stack 64

.data
fini db 5 ; columna inicial de la pantalla
ffin db 6 ; fila final de la pantalla
cini db 20 ; fila inicial de la pantalla
cfin db 60 ; columna final de la pantalla
linea db 0 ; numero de lineas que se va a recorrer
color db 12h ; 0100   0001
             ;  RGB    RGB 

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

mov cx,15 ;declaro el limite del for

for:
    call clrscr; genera el color
    add fini, 1
    add ffin, 1
    add color, 10h ; agrega 10 unidades al color de fondo
    loop for ;vuelvo al ciclo

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