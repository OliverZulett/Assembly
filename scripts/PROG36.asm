.model small
.stack 64
.data

cad1 db 1,"$"
mess db 'OUCH!$'

fil db 1
col db 1

fini db 0
cini db 0
ffin db 24
cfin db 79
linea db 0
color db 21h

left_right_flag db 0
top_bottom_flag db 0

.code
Inicio:
mov ax, @data
mov ds, ax
;-----------------------------
call clrscr
call cuadrado1
call cuadrado2

readc:
	mov ah,10h
	int 16h
	cmp ah,48h
	je arriba
	cmp ah,50h
	je abajo
	cmp ah,4bh
	je izquierda
	cmp ah,4dh
	je to_right
	cmp ah,4fh
	je toend
	jmp readc

arriba: 
    cmp fil,1
    jnae choque
	mov top_bottom_flag, 0
	sub fil,1
	cmp fil,20
	je ch_left_sqr1
	jmp avanzar

abajo: 
    cmp fil,24
    jnb choque
	mov top_bottom_flag, 1
	add fil,1
	cmp fil,6
	je ch_left_sqr1
	jmp avanzar

to_right:
	jmp derecha

ch_left_sqr1:
	cmp col,10
    jae ch_right_sqr1
	jmp avanzar

ch_right_sqr1:
	cmp col,30
    jbe to_choques
	jmp ch_left_sqr2

ch_left_sqr2:
	cmp col,50
    jae ch_right_sqr2
	jmp avanzar

ch_right_sqr2:
	cmp col,70
    jbe to_choques
	jmp avanzar

to_choques: 
	jmp choques_bt
	
choque: 
    call message
	jmp readc

backtop: 
    jmp readc

toend: 
    jmp fin

izquierda: 
    cmp col,1
    jnae choque
	mov left_right_flag, 0
	mov top_bottom_flag, 0
	sub col,1
	cmp col,30
	je ch_top
	cmp col,70
	je ch_top
	jmp avanzar

derecha: 
    cmp col,79
    jnb choque
	mov left_right_flag, 1
	mov top_bottom_flag, 1
	add col,1
    cmp col,10
    je ch_top
    cmp col,50
    je ch_top
	jmp avanzar

msg_1:
	sub col, 1
	jmp choque

msg_2:
	add col, 1
	jmp choque

msgtb_1:
	sub fil, 1
	jmp choque

msgtb_2:
	add fil, 1
	jmp choque

choques:
	cmp left_right_flag, 0
	je  msg_2
	jmp msg_1
choques_bt:
	cmp top_bottom_flag, 0
	je  msgtb_2
	jmp msgtb_1

ch_top:
    cmp fil,6
    jae ch_bot
	jmp avanzar

ch_bot:
    cmp fil,20
    jbe choques
	jmp avanzar

avanzar: 
	call clrscr
	call cuadrado1
	call cuadrado2
	call gotoxy
	call mostrarcad
	jmp backtop
	
fin:

;-----------------------------
mov ah,4ch
int 21h

mostrarcad proc
	push ax
	push dx
	mov ah,09h
	lea dx,cad1
	int 21h
	pop dx
	pop ax
	ret
mostrarcad endp

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

cuadrado1 proc near
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
cuadrado1 endp

cuadrado2 proc near
	push ax
	push bx
	push cx
	mov ah,06h
	mov bh,41h
	mov al,15
	mov ch,5
	mov cl,50
	mov dh,20
	mov dl,70
	int 10h
	pop cx
	pop bx
	pop ax
	ret
cuadrado2 endp

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

message proc near
    push ax
    push bx
    push dx

    mov ah, 02h
    mov bh, 0
    mov dh, 12
    mov dl, 40
    int 10h

    mov ah, 09h
    lea dx, mess
    int 21h

    pop dx
    pop bx
    pop ax
    ret
message endp


end Inicio