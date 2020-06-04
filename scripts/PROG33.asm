; Muetra un mensaje en pantalla hasta que se precione END

.model small
.stack 64

.data

mensaje_1 db "Preciones la tecla END....!",10,13,'$'
mensaje_2 db 'gracias....!$'

.code
Inicio:
mov ax, @data
mov ds, ax

;-----------------------------

mov ah, 09h
lea dx, mensaje_1
int 21h

verificar_fin: ;espera que se presione la tecla END
    mov ah, 10h ; obtiene el cod raster y asccii del caracter ingresado por teclado
    int 16h ; se ingresa el caracter
    ; ah: raster
    ; al: ascci
    cmp ah,4fh ; 4fh es el raster de la tecla END
    je fin
    jmp verificar_fin

fin: 
    mov ah, 09h
    lea dx, mensaje_2
    int 21h

;-----------------------------
mov ah,4ch
int 21h

end Inicio