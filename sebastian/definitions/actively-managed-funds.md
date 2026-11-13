---
def-type: atomic
version: 1.1
id: def-gestion-activa
status: consolidado
category: finanzas
contexto: estrategias-de-inversion
date: 2026-07-08
tags:
  - gestion-activa
  - alpha
  - seleccion-activos
  - rotacion
  - comisiones
aliases:
  - active-management
  - gestion-activa
  - fondos-activos
---
La gestión activa es una estrategia de inversión en la que un equipo gestor toma decisiones discrecionales de compra y venta de activos con el objetivo deliberado de superar el rendimiento de un índice de referencia (_benchmark_), buscando generar _alpha_ (exceso de rentabilidad). A diferencia de la gestión pasiva, el valor reside en la capacidad analítica y la táctica de mercado para batir al promedio del sistema.

#### Características técnicas

-  **Toma de decisiones discrecional:** El gestor selecciona individualmente los valores basándose en análisis fundamental, técnico o macroeconómico, desviándose intencionalmente de la ponderación del índice.
-  **Alta rotación de cartera:** Para ajustar la estrategia según las condiciones del mercado, el fondo realiza compras y ventas frecuentes, lo que incrementa los costes de transacción.
-  **Estructura de costes superior:** Debido a los recursos humanos (analistas, gestores, infraestructura de datos) necesarios para intentar batir al mercado, las comisiones de gestión son significativamente más elevadas que en los fondos indexados.
-  **Desviación respecto al benchmark (Tracking Error):** Es la métrica que cuantifica cuánto se aleja la cartera del índice. Un mayor error de seguimiento indica una gestión más activa y agresiva.

#### Propósito arquitectónico

Actúa como un **mecanismo de ajuste manual (tuning)** en la arquitectura de inversión. Su función es optimizar la rentabilidad en mercados ineficientes o situaciones donde la selección de activos de alta calidad puede ofrecer una ventaja competitiva. Sin embargo, en mercados altamente eficientes, la probabilidad estadística de mantener un rendimiento superior al índice de forma consistente tras deducir las comisiones es un desafío técnico complejo.