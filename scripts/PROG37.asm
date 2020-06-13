.model small
.stack 64
.data

menu db "==============MENU=================0",10, 13,
     db "     1. Mostrar una cadena en en centro de la pantalla",10,13,
	 db "     2. Mostrar un rectangulo en la pantalla",10,13,
	 db "     3. Salir",10,13,
	 db "Ingrese una opcion",10,13,"$"

; columna, fila y pagina
col db 35
fil db 12
pag db 0

; cadena que se mostrara en la opcion 1
cad db "HOLA$"
gracias db 10,13,"Gracias fin del programa$"

; elementos para la limpieza de pantalla
fini db 0
cini db 0
ffin db 24
cfin db 79
linea db 0
color db 21h

.code
Inicio:
mov ax, @data
mov ds, ax
;-----------------------------
    call clrscr

ciclo:
    call gotoxy
    mov ah, 09h
    lea dx, menu
    int 21h

    mov ah, 10h
    int 16h
    ; en el ah se guarda el raster
    ; en el ah se guarda el asccii
    cmp ah, 02h ;02 en raster es la tecla 1
    je uno
    cmp ah, 03h ;03 en raster es la tecla 2
    je dos
    cmp ah, 04h ;04 en raster es la tecla 3
    je tres
    jmp ciclo

uno:
    call gotoxy
    call mostrarcad
    jmp ciclo

dos:
    call clrscr
    call rectangulo
    jmp ciclo
tres:
    call clrscr
    mov ah,09h
    lea dx, gracias
    int 21h
salir:
;-----------------------------
mov ah,4ch
int 21h

; PROCEDIMIENTOS

; limpiar pantall
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

; mostrar rectangulo
rectangulo proc near
	push ax
	push bx
	push cx
	mov ah,06h
	mov bh,41h
	mov al,15
	mov ch,5
	mov cl,10
	mov dh,20
	mov dl,30
	int 10h
	pop cx
	pop bx
	pop ax
	ret
rectangulo endp

end Inicio