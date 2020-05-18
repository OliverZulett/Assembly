## Assembly :vhs:

Un montón de scripts escritos en [lenguaje ensamblador](https://es.wikipedia.org/wiki/Lenguaje_ensamblador).



#### Organización :question:

* __/tools__: Contiene el emulador [DOSBox](https://www.dosbox.com/) que ejecuta código ensamblador.

* __/scripts__: Contiene todos los scripts escritos en lenguaje ensamblador.



#### Ejecución :punch:

Para ejecutar cualquier script debe descomprimir el programa DOSBOX que se encuentra en la carpeta __/tools__, ejecutar el programa ___DOSBox___ una vez iniciado debe montar la unidad de disco que tenga contenida este repositorio:

``` bash
MOUNT <letra de la unidad> <letra de la unidad>:\
<nombre de la unidad>:
```

Una vez montada la unidad se accede al directorio que contiene este repositorio a la ruta __./scripts__ y se ejecuta las siguiente instrucciones para ejecutar cualquier programa:

``` bash
TASM <nombre del programa>.ASM

TLINK <nombre del programa>

<nombre del programa>
```



#### Lista de programas :floppy_disk: 

1. __PROG1.ASM__ :point_right: Hola mundo.
2. __PROG2.ASM__
3. __PROG3.ASM__ :point_right: Muestra caracteres del 0 al 9 con comas.
4. __PROG4.ASM__ :point_right: Muestra caracteres del cero al nueve con comas con un ciclo.
5. __PROG5.ASM__ :point_right: Muestra todos los caracters ascci.
6. __PROG6.ASM__
7. __PROG7.ASM__ :point_right: Muestra una mensaje en pantalla con cadenas.
8. __PROG8.ASM__ 
9. __PROG9.ASM__ :point_right: Convierte una cadena en minusculas a mayusculas.
10. __PROG10.ASM__
11. __PROG11.ASM__ :point_right: Muestra un numero convertido en ASCII.
12. __PROG12.ASM__ :point_right: Multiplica dos numeros y los muestra en formato ASCII.
13. __PROG13.ASM__ :point_right: Generar la serie: 5, 10, 15, 20, 25, ... para N térnimos.
14. __PROG14.ASM__ :point_right: Compara años para ver si una persona es mayor de edad segun su fecha de nacimiento.
15. __PROG15.ASM__ :point_right: Muestra un caracter ingresado por consola.
16. __PROG16.ASM__ :point_right: Muestra una cadena ingresada por consola.
17. __PROG17.ASM__ :point_right: Muestra una cadena en MAYUSCULAS ingresada por consola en minusculas.
18. __PROG18.ASM__ :point_right: Muestra una cadena con espacios entre los caracteres, ingresada por consola.
19. __PROG19.ASM__ :point_right: Muestra una cadena bailarina, ingresada por consola en minuscula.



#### Colabora :sunglasses:

Puedes colaborar con mas Scripts cuando quieras simplemente crea un nuevo Script en cualquier momento solo sigue estas normas:

* el nombre del Script debe tener el formato
	```bash
	PROG<numero correlativo del programa>.asm
	```
	
* la primera línea del script debe contener una breve descripción de lo que hace el programa.

* _(opcional)_ comenta algunas líneas de código para los que estén empezando con Assembly puedan entender como funciona tu script.



#### Autores ✒️

Hasta ahora solo yo:

- **Oliver Zulett** - *Trabajo Inicial*
