---
def-type: atomic
version: 1.0
id: def-indice-bursatil
status: consolidado
category: finanzas
contexto: arquitectura-de-mercados
date: 2026-07-08
tags:
  - indice-bursatil
  - benchmark
  - mercado
  - referencia
  - agregacion-datos
  - api-financiera
aliases:
  - indice
  - stock-index
  - market-index
---
Desde una perspectiva arquitectónica, un índice bursátil es una **API de consulta (Query Interface)** sobre el estado de un mercado financiero. Es una medida estadística que abstrae la complejidad de miles de activos individuales para ofrecer una visión agregada del rendimiento de un segmento específico (geográfico, sectorial o de clase de activo).

#### Características técnicas

-  **Abstracción:** Actúa como una capa de representación que condensa múltiples puntos de datos (precios de acciones, bonos, etc.) en un único valor numérico o serie temporal.
-  **Metodología de agregación:** Define reglas lógicas (algoritmos) para calcular el valor total. Los más comunes son:
    
    -  **Ponderación por capitalización:** Los activos con mayor capitalización bursátil tienen un mayor peso en el cálculo (load balancing proporcional al tamaño).
    -  **Ponderación equitativa:** Todos los componentes aportan el mismo valor al cálculo del índice.
-  **Función de Benchmark:** Sirve como el "entorno de producción" estándar contra el cual se mide el desempeño de cualquier estrategia de inversión activa. Si un gestor no supera el índice, se considera que el rendimiento es inferior al mercado.

#### Propósito arquitectónico

El índice cumple la función de un **observador del sistema**. Para un inversor, no es solo una lista de acciones; es la estructura de datos fundamental que permite:

1. **Normalización:** Comparar diferentes periodos de tiempo y diferentes economías bajo un estándar común.
2. **Replicabilidad:** Proporcionar la "fuente de la verdad" para que los fondos de gestión pasiva puedan construir sus carteras (replicar el índice).
3. **Visibilidad del estado del sistema:** Identificar tendencias macroeconómicas sin tener que procesar el ruido de cada activo individual en el mercado (reducción de dimensionalidad).