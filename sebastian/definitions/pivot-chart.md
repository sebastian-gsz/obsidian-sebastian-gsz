---
def-type: atomic
version: 1.0
id: def-grafico-dinamico
status: estandar
category: ciencia-de-datos
contexto: hojas-de-calculo
date: 2026-11-11
tags:
  - hojas-de-calculo
  - visualizacion
  - tablas-dinamicas
aliases:
  - gráfico dinámico
  - pivot chart
  - gráfico de tabla dinámica
---
Un **gráfico dinámico** (_pivot chart_) es un **gráfico creado a partir de los campos de una tabla dinámica**: en lugar de apuntar a un rango crudo de celdas, visualiza la agregación que la tabla dinámica calcula — y hereda su naturaleza interactiva.

#### Cómo Funciona

-  La tabla dinámica **resume** los datos (suma, promedio, conteo) agrupando por filas y columnas que tú eliges (categorías, fechas, regiones).
-  El gráfico dinámico se **construye sobre esos campos**: cada campo de fila/columna/filtro de la tabla se convierte en ejes, series o segmentadores del gráfico.
-  **Viven enlazados**: filtras o reagrupas la tabla dinámica y el gráfico se **redibuja solo** — misma agregación, nueva vista, sin reconstruir nada.

#### Para Qué Sirve

-  Explorar datos con preguntas cambiantes: "ventas por región" a "ventas por región y trimestre" es arrastrar un campo, no rediseñar el gráfico.
-  Comunicar agregaciones complejas (cruces de categoría × tiempo) sin mostrar la tabla completa.
-  Segmentadores y filtros interactivos que el auditor de la hoja puede accionar él mismo.

#### Diferencia Crítica: Gráfico Dinámico vs. Gráfico Estático

-  El gráfico **estático** apunta a un rango fijo de celdas: si los datos cambian o reorganizas, hay que rehacerlo a mano.
-  El gráfico **dinámico** apunta a la **agregación** de la tabla dinámica: cambia la agrupación y el gráfico sigue siendo correcto por construcción — la vista y el cálculo nunca se desincronizan.
-  Regla práctica: análisis exploratorio y reportes que se filtran en vivo → dinámico; visualización puntual de un rango congelado → estático.

### Propósito fundamental

El gráfico dinámico es la capa visual de la tabla dinámica: convierte la agregación interactiva en imagen, de modo que explorar los datos y verlos no son dos pasos separados sino el mismo gesto — arrastras un campo y tanto el resumen como el gráfico se actualizan a la vez.
