---
def-type: atomic
version: 1.0
id: def-histograma
status: estandar
category: ciencia-de-datos
contexto: estadistica-descriptiva
date: 2026-11-11
tags:
  - estadistica
  - visualizacion
  - distribucion
aliases:
  - histograma
  - histogram
---
Un **histograma** es la **representación gráfica de una tabla de frecuencia de intervalos**: los datos se muestran como barras verticales contiguas, donde la **altura de cada barra corresponde a la frecuencia absoluta del intervalo** correspondiente. Es la foto visual de cómo se distribuye una variable numérica.

#### Cómo Se Lee

-  El eje horizontal presenta los **intervalos** (rangos de la variable, ordenados y de igual tamaño); el eje vertical, la **frecuencia** (cuántas observaciones caen en cada rango).
-  Las barras están **pegadas entre sí** — sin separación — porque el eje es continuo: el final de un intervalo es el inicio del siguiente.
-  La **forma** es la información principal: campana simétrica (distribución normal), sesgo a derecha o izquierda, dos picos (bimodal), colas largas, valores atípicos aislados.

#### Para Qué Sirve

-  **Ver la distribución de un vistazo**: dónde se concentran los datos, dónde escasean y si hay anomalías — lo que una tabla de números no muestra de inmediato.
-  **Elegir análisis posteriores**: la forma observada decide qué estadísticos y pruebas tienen sentido (media vs mediana, transformaciones, pruebas paramétricas).
-  **Comparar conjuntos**: dos histogramas con los mismos intervalos muestran diferencias de comportamiento directamente.

#### Diferencia Crítica: Histograma vs. Gráfico de Barras

-  Parecen idénticos pero representan cosas distintas: el **histograma** agrupa una variable **numérica continua en intervalos** — las barras se tocan y su orden es fijo por el eje numérico.
-  El **gráfico de barras** compara **categorías discretas** (marcas, colores) — las barras van separadas y su orden es arbitrario o elegible.
-  Si puedes reordenar las barras sin perder sentido, es un gráfico de barras; si el orden numérico es esencial, es un histograma.

### Propósito fundamental

El histograma es el puente entre la tabla de frecuencias de intervalos y el análisis: convierte los conteos por rango en una forma visible — campana, sesgo, bimodalidad, atípicos — que comunica la distribución de los datos antes de que se calcule un solo estadístico adicional.
