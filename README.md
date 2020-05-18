## Assembly :vhs:

Un montón de scripts escritos en [lenguaje ensamblador](https://es.wikipedia.org/wiki/Lenguaje_ensamblador).



#### Organización :question:

* __/tools__: Contiene el emulador [DOSBox](https://www.dosbox.com/) que ejecuta código ensamblador.

* __/scripts__: Contiene todos los scripts escritos en lenguaje ensamblador.



#### Ejecución :punch:

Para ejecutar cualquier script debe descomprimir el programa DOSBOX que se encuentra en la carpeta __/tools__, ejecutar el programa ___DOSBox___ una vez iniciado debe montar la unidad de disco que tenga contenida este repositorio:

``` javascript
MOUNT <letra de la unidad> <letra de la unidad>:\
```

Una vez montada la unidad se accede al directorio que contiene este repositorio a la ruta __./scripts__ y se ejecuta las siguiente instrucciones para ejecutar cualquier programa:

``` javascript
TASM <nombre del programa>.ASM

TLINK <nombre del programa>

<nombre del programa>
```



#### Lista de programas :floppy_disk: 

1. __PROG1.ASM__ :point_right: Hola mundo.
2. __PROG2.ASM__
3. __PROG3.ASM__ :point_right: Muestra caracteres del 0 al 9 con comas.



#### Colabora :sunglasses:

Puedes colaborar con mas Scripts cuando quieras simplemente crea un nuevo Script en cualquier momento solo sigue estas normas:

* el nombre del Script debe tener el formato
	```javascript
	PROG<numero correlativo del programa>.asm
	```
	
* la primera línea del script debe contener una breve descripción de lo que hace el programa.

* _(opcional)_ comenta algunas líneas de código para los que estén empezando con Assembly puedan entender como funciona tu script.



#### Autores ✒️

Hasta ahora solo yo:

- **Oliver Zulett** - *Trabajo Inicial*
