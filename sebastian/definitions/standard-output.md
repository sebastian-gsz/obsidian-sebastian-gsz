---
def-type: atomic
version: 1.0
id: def-standard-output
status: estandar
category: sistemas-operativos
contexto: linux
date: 2026-11-11
tags:
  - linux
  - terminal
  - shell
aliases:
  - salida estándar
  - stdout
  - standard output
---
La **salida estándar** (_stdout_ — _standard output_) es la **información devuelta por el sistema operativo a través del shell**: el canal por donde todo programa entrega su resultado normal — lo que aparece en tu pantalla cuando un comando funciona.

#### El Modelo de Tres Canales

Todo programa en un shell opera con tres flujos estándar:

-  **stdout (salida estándar)**: el RESULTADO del programa — su trabajo normal. Numerado como **1**.
-  **stderr (error estándar)**: los ERRORES y avisos — canal separado para que el fallo no se mezcle con el resultado. Numerado como **2**.
-  **stdin (entrada estándar)**: lo que el programa RECIBE — del teclado o de otro comando. Numerado como **0**.

#### El Superpoder: Redirigir y Encadenar

-  La salida estándar es **redirigible**: `ls > lista.txt` envía el resultado a un archivo en lugar de la pantalla.
-  Y **encadenable por tuberías**: `ls | grep proyecto | wc -l` — la stdout de `ls` se convierte en la stdin de `grep`, y su stdout en la stdin de `wc` — cada comando alimenta al siguiente.
-  `2>` redirige los errores aparte: `comando > resultado.txt 2> errores.txt` — resultado y fallos separados por diseño.

#### Por Qué Importa

-  **Es la base de la filosofía Unix**: programas pequeños que hacen una cosa, conectados por sus salidas y entradas estándar — la composición que hace poderoso el shell.
-  **En scripting**: capturar la salida (`comando=$(ls)`) es la forma de que un script use el trabajo de otro.
-  **En logs y automatización**: las herramientas modernas leen la stdout de los comandos — la salida estándar es la interfaz entre el shell y el ecosistema de pipelines.

#### Diferencia Crítica: stdout vs. stderr

-  El **stdout** es el resultado normal — el producto.
-  El **stderr** es el canal de errores — el diagnóstico.
-  La separación permite tratarlos distinto: guardar el resultado mientras los errores saltan a la pantalla, o enjuagarlos por archivos distintos — mezclarlos es perder la capacidad de diferenciar éxito de fallo.

### Propósito fundamental

La salida estándar es el canal universal del resultado: todo programa entrega su trabajo por stdout — redirigible, encadenable y capturable — y junto a stderr y stdin forma el trío que hace del shell un sistema de composición: comandos pequeños conectados por sus canales estándar construyen los flujos de trabajo más complejos.
