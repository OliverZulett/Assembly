; Divide la pantalla en linea de colores

.model small
.stack 64

.data

; Datos para cambiar los colores por fila
fini db 0
cini db 0
ffin db 0
cfin db 79
linea db 1
color db 40h 

; cadena que se mostrara por fila
cad db "SOY UNA FILA DE COLORES",10,13,"$"

; datos para mover el cursor al principio
col db 0
fil db 0

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

call clrscr; genera el primer color
mov si,0 ; inicia el contador en 0
mov cx,24 ; declara el limite del for

change_color:
	add si,1 ; agrego 1 al contador
    add fini, 1 ; incrementa la pocicion
    add ffin, 1 ; incrementa la pocicion
    add color, 11h ; agrega 1 unidades al color de fondo y 1 al color de texto
    call clrscr; genera el color
    loop change_color ;vuelvo a cambiar el color

call gotoxy ; devuelve el cursor al inicio

mov si,0
mov cx,25

;mostramos el texto en cada linea
show_text:
    add si,1
    call mostrarcad
    loop show_text

;-----------------------------
mov ah,4ch
int 21h

;-----procedimientos

; limpiar pantalla
clrscr proc near
	push ax
	push bx
	push cx
	mov ah, 06h
	mov bh,color
	mov al,linea
	mov ch,fini
	mov cl,cini
	mov dh,ffin
	mov dl,cfin
	int 10h
	pop cx
	pop bx
	pop ax
	ret
clrscr endp

; mostrar cadena
mostrarcad proc
	push ax
	push dx
	mov ah,09h
	lea dx,cad
	int 21h
	pop dx
	pop ax
	ret
mostrarcad endp

; gotoxy
gotoxy proc near
	push dx
	push bx
	push ax
	mov ah,02h
	mov bh,00
	mov dh,fil
	mov dl,col
	int 10h
	pop ax
	pop bx
	pop dx
	ret
gotoxy endp

end Inicio