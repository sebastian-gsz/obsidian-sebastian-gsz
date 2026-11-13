---
def-type: atomic
version: 1.0
id: def-varianza
status: estandar
category: ciencia-de-datos
contexto: estadistica-descriptiva
date: 2026-11-12
tags:
  - estadistica
  - dispersion
  - datos
aliases:
  - varianza
  - variance
  - varianza de población
---
La **varianza** es una **medida de dispersión — cuán dispersos están los datos alrededor de su media**: cuánta variabilidad tiene el conjunto. **Entre más alto, más dispersos**; entre más bajo, más agrupados alrededor del promedio. (Nota del legacy: "no habla en el idioma del dato" — sus unidades son al cuadrado, no las originales.)

#### Varianza de Población (σ²)

Cuando tienes TODA la población, se denota con **sigma al cuadrado (σ²)** y se calcula:

$$\sigma^2 = \frac{\sum (x_i - \mu)^2}{N}$$

-  La suma de las **diferencias al cuadrado** entre cada valor observado y la media poblacional (μ), **dividida por el número total de observaciones** (N).
-  Las diferencias se elevan al cuadrado para que las desviaciones arriba y abajo no se anulen entre sí.

#### Varianza de Muestra (s²)

Cuando solo tienes una MUESTRA, se denota **s²** y se calcula igual — **pero con un denominador distinto**:

$$s^2 = \frac{\sum (x_i - \bar{x})^2}{n - 1}$$

-  El denominador es **n − 1** (no n) — la corrección de Bessel: al usar la media de la MUESTRA (que ya se ajustó a esos mismos datos), se pierde un grado de libertad y dividir por n subestimaría la dispersión real.

#### Por Qué Existe (y Por Qué la Raíz)

-  La varianza mide la dispersión "en unidades al cuadrado" — metros cuadrados para datos en metros: matemáticamente limpia, interpretativamente rara.
-  Por eso se reporta su raíz cuadrada — la **desviación estándar** (σ o s) — que vuelve al idioma original del dato: el átomo hermano de este glosario (standard-deviation.md).

#### Diferencia Crítica: Varianza vs. Desviación Estándar

-  La **varianza** es la medida bruta: promedio de las diferencias al cuadrado — la que usan los cálculos (ANOVA, regresión, PCA trabajan con varianza).
-  La **desviación estándar** es su raíz: la que se INTERPRETA — "los datos se desvían ±X de la media, en unidades del dato".
-  La pareja inseparable: la varianza alimenta las fórmulas; la desviación estándar cuenta la historia — y las tres viñetas del legacy (varianza, de población, de muestra) viven juntas en esta única distinción σ²/s².

### Propósito fundamental

La varianza es la medida matemática de la dispersión: cuánto se alejan los datos de su media, en cuadrados — con dos fórmulas hermanas según tengas toda la población (σ², sobre N) o una muestra (s², sobre n−1) — y aunque su unidad cuadrada la hace poco conversable, es el cimiento de la desviación estándar y de casi toda la estadística inferencial.
