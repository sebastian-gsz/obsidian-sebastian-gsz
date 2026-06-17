---
def-type: atomic
aliases:
  - Consistencia fuerte
  - Strong consistency
tags:
  - arquitectura/sistemas-distribuidos
  - consistencia
  - bases-de-datos
category: concepto
contexto: bases-de-datos
version: 1.0
date: 2026-06-14
status: estandar
---

La consistencia fuerte es un modelo de consistencia que garantiza que, tras una operación de escritura exitosa, cualquier operación de lectura posterior devolverá obligatoriamente ese valor recién escrito en todos los nodos del sistema.

### Características principales

- **Priorización de integridad**: Garantiza que el usuario siempre vea la versión más reciente del dato, eliminando cualquier ambigüedad.
- **Sincronización global**: Requiere que las réplicas se comuniquen antes de confirmar la escritura, lo que asegura una visión uniforme en toda la infraestructura.
- **Modelo intuitivo**: Simplifica el desarrollo de aplicaciones al eliminar la necesidad de manejar conflictos de datos o versiones obsoletas en la lógica de negocio.

### Trade-offs (Compromisos)

- **Latencia elevada**: El tiempo de respuesta aumenta debido a que el sistema debe esperar a que los nodos alcancen el consenso.
- **Disponibilidad reducida**: Si un nodo de la red falla o está lento, el sistema puede bloquear las escrituras para evitar inconsistencias, afectando la disponibilidad del servicio.
- **Escalabilidad limitada**: Es difícil de escalar horizontalmente a grandes distancias geográficas porque el costo de sincronización aumenta exponencialmente con el número de nodos.
