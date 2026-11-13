---
def-type: atomic
version: 1.0
id: def-ecuacion
status: estandar
category: ciencia-de-datos
contexto: analisis-de-datos
date: 2026-11-11
tags:
  - matematicas
  - ciencia-de-datos
  - hojas-de-calculo
aliases:
  - ecuación
  - equation
  - fórmula matemática
---
Una **ecuación** es un cálculo que implica operaciones aritméticas — suma, resta, multiplicación o división — sobre valores o referencias de celdas, y que devuelve un resultado calculado. En el contexto de hojas de cálculo y análisis de datos, es la construcción básica para derivar nuevas métricas a partir de los datos existentes.

#### Cómo Funciona en la Práctica

-  **Operadores y operandos**: toda ecuación combina valores literales (`2`, `0.15`), referencias (`B2`, `C7`) y operadores (`+`, `-`, `*`, `/`). En hojas de cálculo se inicia con el signo `=`, que le indica al programa "calcula esto, no lo almacenes como texto".
-  **Precedencia de operadores**: la multiplicación y división se evalúan antes que la suma y resta; los paréntesis fuerzan el orden deseado. `(A1+B1)/2` no es lo mismo que `A1+B1/2` — el error de precedencia es una de las fuentes más comunes de datos incorrectos.
-  **Referencias propagan el cálculo**: si la ecuación usa referencias de celda, cambiar el valor de origen recalcula el resultado en cadena por toda la hoja.

#### Diferencia Crítica: Ecuación vs. Expresión Matemática

En los diccionarios de análisis de datos ambos términos se usan como sinónimos (el cálculo con operadores aritméticos). En matemática formal, sin embargo, hay una distinción: una **expresión** es cualquier combinación de operandos y operadores (`2*x + 3`), mientras que una **ecuación** afirma que dos expresiones son iguales (`2*x + 3 = 11`) y permite despejar incógnitas. En hojas de cálculo, lo que se escribe tras el signo `=` es técnicamente una expresión que se evalúa.

### Propósito fundamental

La ecuación es la unidad de cómputo del análisis de datos: convierte columnas de valores crudos en métricas derivadas — totales, promedios, porcentajes, tasas — y su dominio (operadores, precedencia, referencias) es lo que separa una hoja de cálculo confiable de una llena de resultados silenciosamente erróneos.
