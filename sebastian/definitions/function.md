---
def-type: atomic
version: 1.0
id: def-funcion
status: estandar
category: ciencia-de-datos
contexto: hojas-de-calculo
date: 2026-11-11
tags:
  - hojas-de-calculo
  - formulas
  - analisis
aliases:
  - función de hoja de cálculo
  - spreadsheet function
  - función preestablecida
---
Una **función** (de hoja de cálculo) es un **comando preestablecido que realiza automáticamente un proceso o tarea especificada utilizando los datos de la hoja de cálculo**: en vez de construir el cálculo paso a paso, se invoca una operación ya programada por el software, dándole los datos que debe procesar.

#### Estructura y Ejemplos

-  **Sintaxis**: `NOMBRE(argumentos)` — la función se escribe dentro de una fórmula, siempre tras el signo `=`: `=SUMA(B2:B50)`, `=PROMEDIO(D2:D31)`, `=CONTAR.SI(A2:A100, "Sí")`.
-  Los **argumentos** son los datos o rangos sobre los que opera: celdas, rangos, condiciones o valores literales.
-  **Funciones básicas del análisis**: `SUMA` (total), `PROMEDIO` (media), `CONTAR`/`CONTAR.SI` (frecuencias y conteos condicionales), `MAX`/`MIN`, `SI` (lógica condicional), `BUSCARV` (búsqueda).

#### Diferencia Crítica: Función vs. Fórmula

-  La **fórmula** es la expresión completa que tú escribes (`=(B2+B3)/2`, o `=PROMEDIO(B2:B10)`); puede construirse desde cero con operadores o **combinando funciones**.
-  La **función** es uno de los ingredientes: un comando predefinido por el software, con nombre propio, sintaxis fija y comportamiento probado.
-  La relación práctica: usa funciones en lugar de reconstruir cálculos con operadores — `=SUMA(A1:A100)` no solo es más corto que `A1+A2+...+A100`, es más correcto: incorpora las reglas del programa (celdas vacías, errores, precisión) que a mano se olvidan.

### Propósito fundamental

Las funciones son el vocabulario listo para usar de la hoja de cálculo: cada una encapsula un proceso completo y probado, de modo que el analista compone análisis complejos apilando comandos confiables en lugar de reinventar la aritmética — la diferencia entre calcular a mano y calcular con garantías.
