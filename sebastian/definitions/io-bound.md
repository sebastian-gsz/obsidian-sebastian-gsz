---
def-type: atomic
version: 1.0
id: def-io-bound
status: estandar
category: desarrollo-software
contexto: rendimiento
date: 2026-11-11
tags:
  - rendimiento
  - procesos
  - io
  - sistemas
aliases:
  - i/o-bound
  - io bound
  - limitado por e/s
---
Un proceso es **I/O-bound** cuando **pasa más tiempo esperando a que las operaciones de entrada/salida se completen que realizando cálculos o procesamiento**: el cuello de botella no es la CPU — es la espera por datos que vienen del disco, de la red o de una base de datos.

#### Cómo Se Reconoce

-  Un programa que **lee grandes cantidades de datos desde un disco** pasa la mayor parte del tiempo esperando la transferencia antes de poder procesarlos.
-  Una **aplicación web que espera respuestas de una base de datos remota** es I/O-bound si la latencia de red o de la BD domina el tiempo total.
-  **Síntoma clásico**: incluso con un procesador muy rápido, el rendimiento sigue lento — la CPU pasa gran parte del tiempo **ociosa**, esperando a que las operaciones I/O terminen.

#### Ejemplos Típicos

Leer/escribir archivos, realizar consultas a bases de datos, interactuar con redes, esperar respuestas de APIs externas — todo lo donde el tiempo lo marca el viaje de los datos, no el cálculo sobre ellos.

#### Diferencia Crítica: I/O-bound vs. CPU-bound

-  **I/O-bound**: el límite lo ponen las operaciones de entrada/salida — la solución es acelerar o evitar la espera: discos más rápidos (SSD/NVMe), cachés, más memoria, I/O asíncrono y concurrencia (que la CPU atienda otros procesos mientras espera).
-  **CPU-bound**: el límite lo pone el cálculo — la CPU está al 100% y la espera es mínima; la solución es más poder de cómputo o algoritmos más eficientes.
-  Diagnosticar cuál de los dos es el cuello de botella es el primer paso de cualquier optimización: comprar más CPU para un proceso I/O-bound es gastar dinero en el componente que estaba dormido.

### Propósito fundamental

La clasificación I/O-bound/CPU-bound es el diagnóstico fundacional del rendimiento: identifica qué componente gobierna el tiempo total del proceso, y de ahí nace toda decisión sensata — optimizar la espera (mejores discos, caché, asincronía) cuando los datos tardan en llegar, y optimizar el cómputo solo cuando el cálculo es quien de verdad consume el tiempo.
