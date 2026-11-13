---
def-type: atomic
version: 1.0
id: def-escala
status: estandar
category: ciencia-de-datos
contexto: analisis-de-datos
date: 2026-11-11
tags:
  - estadistica
  - ciencia-de-datos
  - datos
aliases:
  - escala
  - escala de una variable
  - escala de datos
---
La **escala** de una variable es el **rango de valores** que puede tomar y la **magnitud** en que esos valores se expresan. No es una propiedad del fenómeno medido, sino de cómo lo representamos: la misma realidad puede vivir en escalas distintas y ese cambio altera cómo se perciben sus diferencias.

#### Entenderla con Ejemplos

-  Una variable "Ingresos Anuales" en dólares puede tener una escala de \$10,000 a \$1,000,000; una variable "Número de Hijos", una escala de 0 a 10. Mismo tipo de dato, magnitudes incomparables.
-  **Transformar la escala** significa cambiar ese rango o magnitud sin cambiar el fenómeno: convertir dólares a miles de dólares re-etiqueta los valores (\$50,000 → 50); ambos representan lo mismo.
-  Aplicar un **logaritmo** también cambia la escala, con un efecto profundo: comprime los valores grandes y apenas mueve los pequeños, haciendo que las diferencias entre valores altos "parezcan" tan pequeñas como las diferencias entre valores bajos. Por eso los ingresos se analizan a menudo en escala logarítmica.

#### Diferencia Crítica: Escala vs. Escalado de Características

-  **Escala** describe en qué rango y magnitud vive una variable (una propiedad de los datos).
-  **_Feature scaling_** (normalización, estandarización) es la operación deliberada de llevar variables de escalas dispares a un terreno común — por ejemplo al intervalo [0,1] o a media 0 y desviación 1 — para que algoritmos que son sensibles a las magnitudes (k-means, regresión regularizada, redes neuronales) no den más peso a una variable solo porque sus números son grandes.

### Propósito fundamental

Comprender la escala de cada variable es el primer paso del análisis serio: determina qué comparaciones son legítimas, qué transformaciones tienen sentido y cuándo un modelo necesita que las variables se nivelen antes de calcular nada — comparar magnitudes sin pensar en su escala es comparar metros con kilómetros.
