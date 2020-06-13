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
20. __PROG20.ASM__ :point_right: Reemplaza con X los caracteres e de una cadena ingesada por consola.
21. __PROG21.ASM__ :point_right: Muestra la serie de pares y ceros: 2 0 4 0 6 ....
22. __PROG22.ASM__ :point_right: Muestra todos loas caracteres asscci junto con su posicion.
23. __PROG23.ASM__ :point_right: Cambia el color de la pantalla.
24. __PROG24.ASM__ :point_right: Genera un cuadrado en la pantalla.
25. __PROG25.ASM__ :point_right: Genera tres lineas de colores en la pantalla.
26. __PROG26.ASM__ :point_right: Divide la pantalla en linea de colores.
27. __PROG27.ASM__ :point_right: Genera cuadrados de colores uno dentro de otro.
28. __PROG28.ASM__ :point_right:
29. __PROG29.ASM__ :point_right:
30. __PROG30.ASM__ :point_right:
31. __PROG31.ASM__ :point_right:
32. __PROG32.ASM__ :point_right:
33. __PROG33.ASM__ :point_right:
34. __PROG34.ASM__ :point_right:
35. __PROG35.ASM__ :point_right: Mueve un caracter en pantalla con las flechas direccionales y terina con la tecla end.
36. __PROG36.ASM__ :point_right: Pequeño juego que identifica cuando el personaje llega a los border.
37. __PROG37.ASM__ :point_right: Muestra un menu de opciones por pantalla.

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
