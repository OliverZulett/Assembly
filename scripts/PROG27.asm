; Genera cuadrados de colores uno dentro de otro

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

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

call clrscr; genera el primer color

mov si,0 ;inicio el contador en 0
mov cx,24 ;declaro el limite del for

for:

	add si,1 ;agrego 1 al contador
    add cini, 1
    add fini, 1
    sub cfin, 1 ; incrementa la pocicion
    sub ffin, 1 ; incrementa la pocicion
    add color, 10 ; agrega 10 unidades al color de fondo
    
    call clrscr; genera el color
	
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