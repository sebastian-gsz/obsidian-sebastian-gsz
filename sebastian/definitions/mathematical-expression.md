---
def-type: atomic
version: 1.0
id: def-expresion-matematica
status: estandar
category: ciencia-de-datos
contexto: analisis-de-datos
date: 2026-11-11
tags:
  - matematicas
  - ciencia-de-datos
  - hojas-de-calculo
aliases:
  - expresión matemática
  - mathematical expression
  - expresión aritmética
---
Una **expresión matemática** es un cálculo que combina valores y operadores — suma, resta, multiplicación o división — para producir un resultado. Es la forma más general de cómputo aritmético: en análisis de datos y hojas de cálculo se usa como sinónimo de ecuación, aunque formalmente la expresión es el ingrediente y la ecuación la afirmación de igualdad entre dos expresiones.

#### Anatomía de una Expresión

-  **Operandos**: los valores sobre los que se opera — literales numéricos (`42`, `3.14`), referencias de celda (`D4`), variables (`x`, `precio`) o subexpresiones entre paréntesis.
-  **Operadores**: las acciones aplicadas — aritméticos (`+`, `-`, `*`, `/`, `%`), comparativos (`>`, `=`) y de función (`SUMA(...)`, `PROMEDIO(...)`).
-  **Evaluación**: la expresión se reduce siguiendo la precedencia de operadores (paréntesis → multiplicación/división → suma/resta) hasta un único valor. `=2*(A1+B1)/100` primero suma, luego multiplica y por último divide.

#### Diferencia Crítica: Expresión vs. Ecuación

-  **Expresión**: `2*x + 3` — combina operandos y operadores; tiene un valor, no una verdad. No se "resuelve", se **evalúa**.
-  **Ecuación**: `2*x + 3 = 11` — afirma que dos expresiones son iguales; sí puede resolverse despejando la incógnita (`x = 4`).
-  En hojas de cálculo todo lo que se escribe tras el signo `=` es una expresión que el programa evalúa; el signo es una señal de cómputo, no una igualdad matemática.

### Propósito fundamental

La expresión matemática es el vocabulario elemental de todo cómputo — desde una fórmula de hoja de cálculo hasta una función de coste en _machine learning_: dominar sus operandos, operadores y orden de evaluación es la base sin la cual ninguna métrica derivada es confiable.
