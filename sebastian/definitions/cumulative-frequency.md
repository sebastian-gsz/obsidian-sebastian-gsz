---
def-type: atomic
version: 1.0
id: def-frecuencia-acumulativa
status: estandar
category: ciencia-de-datos
contexto: estadistica-descriptiva
date: 2026-11-11
tags:
  - estadistica
  - datos
  - distribucion
aliases:
  - frecuencia acumulativa
  - cumulative frequency
  - frecuencia acumulada
---
La **frecuencia acumulativa** es una medida estadística que **resume la distribución de los datos sumando progresivamente las frecuencias hasta cierto punto**: muestra cuántas observaciones son menores o iguales a un valor en el conjunto de datos — el número acumulado de casos al llegar a cada categoría.

#### Cómo Se Calcula

1.  Los datos **se ordenan** en orden ascendente (o descendente, según la dirección en que se quiera acumular).
2.  La frecuencia **se suma a medida que avanzas** por los valores en orden: la acumulada de cada categoría es la de la anterior más la propia.
3.  La última siempre coincide con el **total de observaciones** (o 100% si es relativa).

En el ejemplo de ventas (Audi 124, BMW 98, Mercedes 113 sobre 335): acumulada de Audi = 124 (**37%**), de BMW = 124+98 = 222 (**71%**), de Mercedes = 335 (**100%**). Cada fila responde "¿cuántas ventas corresponden a estas marcas *o anteriores*?".

#### Para Qué Sirve

-  **Ubicar posiciones**: los percentiles, cuartos y la mediana se leen directamente de frecuencias acumuladas — la mediana es el punto donde la acumulada cruza el 50%.
-  **Responder preguntas de umbral**: "¿cuántos alumnos sacaron 6 o menos?", "¿qué porcentaje de servidores responde en menos de 200 ms?" — preguntas que la frecuencia simple no contesta.

#### Diferencia Crítica: Acumulativa vs. Relativa

La **relativa** mide el peso de cada categoría aislada (37%, 34%, 29%); la **acumulativa** mide el peso de todo lo recorrido hasta ella (37% → 71% → 100%). Solo tiene sentido sobre datos **ordenables** — para categorías sin orden natural (colores, marcas) la acumulativa no dice nada útil.

### Propósito fundamental

La frecuencia acumulativa convierte la distribución en una escalera: cada escalón cuenta todo lo que quedó atrás, y sobre esa escalera se apoyan los estadísticos de posición — mediana, cuartiles, percentiles — que localizan cualquier observación dentro del conjunto.
