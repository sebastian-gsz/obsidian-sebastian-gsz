---
def-type: atomic
version: 1.0
id: def-frecuencia-relativa
status: estandar
category: ciencia-de-datos
contexto: estadistica-descriptiva
date: 2026-11-11
tags:
  - estadistica
  - datos
  - proporciones
aliases:
  - frecuencia relativa
  - relative frequency
  - proporción de datos
---
La **frecuencia relativa** es la medida que se obtiene **dividiendo la frecuencia de un valor o categoría entre el tamaño total del conjunto de datos**: se expresa como proporción o porcentaje y dice qué parte del total representa cada valor.

$$f_{relativa} = \frac{f_i}{N}$$

#### Ejemplo Completo (con frecuencia acumulativa)

Conjunto: 335 ventas por marca.

| Conjunto de datos | Cantidad Ventas | Frecuencia relativa | Frecuencia acumulativa |
| ----------------- | --------------- | ------------------- | ---------------------- |
| Audi              | 124             | 124/335 = **37%**   | **37%**                |
| BMW               | 98              | 98/335 = **34%**    | 37 + 34 = **71%**      |
| Mercedes          | 113             | 113/335 = **29%**   | 71 + 29 = **100%**     |
| **Total**         | **335**         | **100%**            | **100%**               |

#### Propiedades Clave

-  **Siempre suma 100%**: la suma de las frecuencias relativas de todas las categorías es 1 (o 100%) — es su verificación de sanidad.
-  **Hace comparables conjuntos distintos**: 124 ventas dicen poco sin contexto; "37% del total" lo dice todo sea cual sea el tamaño de la muestra.
-  **Conecta con la probabilidad**: en muestras grandes, la frecuencia relativa de un valor se aproxima a su probabilidad teórica.

#### Diferencia Crítica: Relativa vs. Acumulativa

La **relativa** mira cada categoría *por separado* (37%, 34%, 29%); la **acumulativa** suma progresivamente *hasta* cada categoría (37% → 71% → 100%) y solo tiene sentido sobre datos con un orden natural. La primera responde "¿qué peso tiene esta categoría?"; la segunda, "¿cuánto está cubierto hasta aquí?".

### Propósito fundamental

La frecuencia relativa traduce conteos a proporciones: normaliza los datos respecto a su total, permitiendo comparar categorías y conjuntos de distinto tamaño — y es el puente directo entre lo observado en una muestra y la probabilidad que se pretende estimar.
