### Assembly :vhs:

Un monton de Script escritos en lenguaje ensamblador.

#### organizacion :question:

* en el directorio __/tools__ se encuentra el emulador DOSBOX que sirve para ejecutar el codigo Assembler

* en el directorio __/scripts__ se encuentran todos los algoritmos escritos en codigo ensamblador

#### ejecucion :punch:

para ejecutar cualquier script debe descomprimir el programa DOSBOX que se encuentra en la carpeta __/tools__ una vez iniciado debe montar la unidad de disco que tenga contenida este repositorio, por ejemplo si este repositorio esta en la unidad D:

``` javascript
// se ejecuta
MOUNT D D:\
```

luego se accede al directorio que contiene este repositorio a la ruta __./scripts__ y se ejecuta las siguiente instrucciones para ejecutar el programa:

``` javascript
TASM <nombre del programa>.ASM

TLINK <nombre del programa>

<nombre del programa>
```

#### Lista de programas :floppy_disk: 

1. __PROG1.ASM__ :point_right: Hola mundo.
2. __PROG2.ASM__
3. __PROG3.ASM__ :point_right: Muestra caracteres del 0 al 9 con comas.