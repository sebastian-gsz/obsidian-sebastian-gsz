---
def-type: atomic
version: 1.0
id: def-eventual-consistency
status: estandar
category: concepto
contexto: bases-de-datos
date: 2026-06-14
tags:
  - arquitectura/sistemas-distribuidos
  - escalabilidad
  - latencia
aliases:
  - eventual consistency
  - consistencia eventual
---

La consistencia eventual es un modelo de coherencia de datos en sistemas distribuidos que garantiza que, en ausencia de nuevas actualizaciones sobre un elemento, todas las réplicas convergerán finalmente hacia un estado idéntico. Es una arquitectura fundamental para diseñar servicios que requieren alta disponibilidad y una baja latencia en entornos de escala masiva.

Este modelo representa un _trade-off_ consciente donde se sacrifica la coherencia inmediata (consistencia fuerte) para asegurar que el sistema siga respondiendo ante fallos o latencia de red, alineándose con los principios del teorema CAP (AP).

- **Priorización de disponibilidad:** Permite que el sistema continúe operando y procesando peticiones de lectura y escritura incluso si algunas réplicas se encuentran temporalmente desactualizadas o aisladas.
- **Optimización de latencia:** Al no requerir la sincronización síncrona obligatoria entre todos los nodos (como ocurre en esquemas de consenso estricto), se reducen drásticamente los tiempos de respuesta.
- **Escalabilidad:** Facilita la distribución de la carga de lectura en múltiples nodos, ya que el sistema no debe bloquear operaciones para alcanzar un consenso global inmediato.
- **Gestión de desfasaje (Replication Lag):** Se acepta la posibilidad de que un usuario pueda leer datos antiguos inmediatamente después de una escritura. Es la opción preferida para escenarios donde la lectura "en tiempo real" no es crítica, como en feeds de redes sociales, contadores de métricas o catálogos de productos.
