---
def-type: atomic
version: 1.0
id: def-max
status: estandar
category: ciencia-de-datos
contexto: hojas-de-calculo
date: 2026-11-11
tags:
  - hojas-de-calculo
  - formulas
  - analisis
aliases:
  - función max
  - función máximo
  - max
---
**MAX** es la **función de hoja de cálculo que muestra el valor numérico más alto de un rango de celdas**: le das un conjunto de valores y devuelve el mayor — el tope del rango, sin calcular nada más.

#### Sintaxis y Uso

-  `=MAX(A2:A50)` — recorre el rango y devuelve el valor más alto que encuentre.
-  Acepta varios rangos y valores sueltos: `=MAX(A2:A50, C2:C50, 100)` — compara todo y devuelve el máximo global.
-  Ignora el texto y las celdas vacías — solo compiten números (y fechas, que son números en disfraz: útil para "última fecha del registro").

#### Para Qué Sirve en el Análisis

-  **Identificar extremos**: el día de mayores ventas, el ticket más alto, el servidor con más carga — el primer paso para investigar lo anómalo.
-  **Techo de comparación**: sirve como denominador de porcentajes relativos ("¿qué % del mejor mes representa este mes?").
-  **Combinaciones**: `=MAX(A2:A10 - B2:B10)` en versiones con matrices, o MAX con condiciones vía `MAX.SI.CONJUNTO` para el máximo filtrado.

#### La Pareja y su Familia

-  **MIN** es su espejo: mismo uso, valor más bajo — juntos delimitan el rango real de los datos (máximo − mínimo = recorrido).
-  MAX vive en la familia de funciones de hoja de cálculo junto a SUMA, PROMEDIO y CONTAR: cada una encapsula una operación estadística básica sobre un rango — y todas comparten la misma sintaxis de rango como argumento.

#### Diferencia Crítica: MAX vs. PROMEDIO

-  **PROMEDIO** resume el centro: el valor típico del conjunto, sensible a todos los valores.
-  **MAX** señala el extremo: ignora la mayoría y devuelve el único que supera a todos.
-  Analíticamente responden preguntas distintas — "¿cómo va en general?" frente a "¿hasta dónde llegó el pico?" — y el pico, por definición, no representa al conjunto: usar el máximo como "lo normal" es el error clásico del análisis apresurado.

### Propósito fundamental

MAX es la función que encuentra el techo: en un clic entrega el valor extremo del rango — el punto de partida de toda investigación de picos, récords y anomalías, y la mitad del par MAX/MIN que delimita cualquier conjunto de datos antes de analizarlo a fondo.
