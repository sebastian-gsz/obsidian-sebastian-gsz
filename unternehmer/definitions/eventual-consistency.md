---
def-type: atomic
aliases:
  - Eventual consistency
  - Consistencia eventual
tags:
  - arquitectura/sistemas-distribuidos
  - escalabilidad
  - latencia
category: concepto
contexto: bases-de-datos
version: 1.0
date: 2026-06-14
status: estandar
---

La consistencia eventual es un modelo de consistencia utilizado en sistemas distribuidos que garantiza que, si no se realizan nuevas actualizaciones sobre un elemento de datos, finalmente todas las lecturas sobre ese elemento devolverán el último valor actualizado.

### Características principales

- **Priorización de disponibilidad**: Permite que el sistema siga respondiendo incluso si algunas réplicas están temporalmente desactualizadas.
- **Escalado horizontal**: Facilita la distribución de carga de lectura en múltiples nodos sin necesidad de una sincronización síncrona costosa.
- **Latencia reducida**: Al no requerir coherencia inmediata entre nodos, el tiempo de respuesta para las operaciones de lectura es significativamente menor.

### Trade-offs (Compromisos)

- **Desfasaje de datos**: Existe la posibilidad de que un usuario lea datos antiguos inmediatamente después de una escritura.
- **Aplicabilidad**: Es ideal para escenarios donde la lectura inmediata del dato recién escrito no es crítica para la funcionalidad del negocio, como en perfiles de usuario, feeds de redes sociales o catálogos de productos.
