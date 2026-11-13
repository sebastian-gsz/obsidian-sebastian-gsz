---
def-type: atomic
version: 1.0
id: def-logaritmo
status: estandar
category: ciencia-de-datos
contexto: analisis-de-datos
date: 2026-11-11
tags:
  - matematicas
  - estadistica
  - transformaciones
aliases:
  - logaritmo
  - logarithm
  - logaritmo natural
---
El **logaritmo** es la **operación inversa de la exponenciación** (elevar un número a una potencia): responde a la pregunta "¿a qué potencia tengo que elevar una _base_ para obtener un cierto número?". Si $2^3 = 8$, entonces $\log_2(8) = 3$ — porque elevar 2 a la 3 da 8.

#### Las Bases que Importan

-  **Base 2**: $\log_2(8) = 3$ — el ejemplo canónico; aparece en informática (bits, árboles, algoritmos de búsqueda).
-  **Logaritmo natural (base `e`)**: el más usado en ciencia de datos y estadística — la base "especial" del crecimiento continuo.
-  **Base 10**: lectura intuitiva en órdenes de magnitud — "cuántos ceros tiene el número".

#### Por Qué se Usa en Análisis de Datos

Al tomar el logaritmo de los valores de una variable, se **cambia la "escala"** de esos valores — especialmente cuando son muy grandes o cuando su relación con otra variable crece muy rápido:

-  Los logaritmos **comprimen los valores grandes** y apenas mueven los pequeños: $10^6$ pasa a 6, $10^9$ pasa a 9 — seis órdenes de magnitud se vuelven tres puntos.
-  Esto **doma las distribuciones sesgadas a la derecha** (ingresos, precios, poblaciones): la campana larga cola se vuelve legible y las diferencias entre enormes valores dejan de aplastar a los pequeños.
-  Además **convierte relaciones multiplicativas en aditivas**: un crecimiento del 10% anual se vuelve una pendiente constante en escala logarítmica.

#### Diferencia Crítica: Logaritmo vs. Escala

El logaritmo es la **operación** que transforma los valores; la **escala** es la propiedad de la variable resultante. Tomar $\log(x)$ no "corrige" los datos: cambia su representación para que comparaciones y modelos funcionen — y solo se aplica a valores positivos (el logaritmo de cero o negativo no existe en los reales).

### Propósito fundamental

El logaritmo es la herramienta matemática para mirar lo enorme de frente: comprime magnitudes desiguales a un terreno comparable, convierte explosiones exponenciales en líneas rectas y hace legible lo que en escala lineal aplasta — por eso está en el corazón de la estadística aplicada y de las transformaciones de datos.
