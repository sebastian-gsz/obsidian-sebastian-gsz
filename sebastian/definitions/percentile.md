---
def-type: atomic
version: 1.0
id: def-percentil
status: estandar
category: ciencia-de-datos
contexto: estadistica-descriptiva
date: 2026-11-11
tags:
  - estadistica
  - percentiles
  - posicion
aliases:
  - percentil
  - percentile
  - percentiles
---
Los **percentiles** son una **medida de posición** que **divide un conjunto de datos ordenados en 100 partes iguales**: el percentil 95 (P95) es el valor por debajo del cual cae el 95% de las observaciones. La etimología lo dice todo — "**per-**" (por) y "**-centil**" (cien): por cada cien.

#### Cómo se Lee

-  **P95 = 200 ms** en la latencia de un servicio significa: el 95% de las peticiones se completan en 200 ms **o menos** — solo el 5% más lento se pasa.
-  **P50** es la **mediana**: el punto medio exacto — la mitad por debajo, la mitad por encima.
-  **P25 y P75** son los **cuartiles**: los cuartos de la distribución — y el recorrido intercuartílico (P75−P25) es el rango del "centro" de los datos.
-  **P99**: el 1% superior — donde viven los valores extremos.

#### Usos en Ingeniería de Datos

-  **Rendimiento de sistemas**: el **P95** es la métrica estándar de latencia — mucho más informativa que el promedio, porque **elimina el efecto de los valores atípicos** que distorsionan la media. Un servicio con promedio de 50 ms y P95 de 2000 ms tiene un problema que el promedio esconde.
-  **Control de calidad**: los percentiles marcan **límites de tolerancia** — por ejemplo, que el 10% de las piezas más pequeñas esté por debajo de cierto umbral.
-  **Medición de desigualdad**: en la distribución de ingresos, el **P99** representa a quienes ganan más que el 99% de la población — la cola superior sin disimular.

#### Diferencia Crítica: Percentil vs. Media

-  La **media** promedia TODOS los valores — un outlier gigante la arrastra.
-  Un **percentil** es una posición en la fila ordenada — los extremos no lo mueven: el P95 de las latencias apenas cambia si una petición tardó 3 minutos.
-  Por eso la ingeniería de sistemas mide en percentiles: responde "¿cómo vive el usuario TÍPICO y el mal afortunado?" sin que el caso extremo falsifique el retrato — la pregunta del promedio ("¿cuánto en total?") y la del percentil ("¿dónde estás tú en la fila?") son preguntas distintas.

### Propósito fundamental

Los percentiles posicionan cada dato dentro de la fila ordenada: dividen la distribución en cien tramos y responden "¿dónde cae este valor respecto a todos?" — la medida de posición que hace legibles latencias, tolerancias y desigualdades sin dejar que los extremos distorsionen el retrato.
