---
def-type: atomic
aliases:
  - consistencia-fuerte
  - high-consistency
  - strong-consistency
  - atomic-consistency
  - alta consistencia
  - high consistency
  - strong consistency
  - consistencia fuerte
tags:
  - sistemas-distribuidos
  - bases-de-datos
  - arquitectura
  - transacciones
category: conceptos-teóricos
contexto: teoría-de-sistemas
version: 1
date: 2026-06-16
status: estandar
---
Modelo de consistencia donde se garantiza que, tras una operación de escritura exitosa, todas las operaciones de lectura posteriores devolverán el valor más reciente. Es el estándar de oro en sistemas donde el error de lectura no es admisible.

*  **Faceta técnica**: Se basa frecuentemente en protocolos de consenso (como Paxos o Raft) o en bloqueos (locks) que sincronizan el estado entre todos los nodos antes de confirmar una operación.
*  **Relación con el teorema CAP**: Según el teorema CAP, en caso de una partición de red, un sistema que prioriza la consistencia fuerte debe sacrificar la disponibilidad para asegurar que los datos no se corrompan o diverjan.
*  **Faceta de rendimiento**: Introduce una penalización en la latencia (debido a la necesidad de sincronización entre nodos) y reduce el throughput (rendimiento) en comparación con sistemas de consistencia eventual.
*  **Casos de uso**:
  
    * **Sistemas financieros**: Saldo bancario o transacciones de valores.
    * **Sistemas de inventario crítico**: Evitar la sobreventa (overselling) de productos con stock único.
    * **Sistemas de autenticación**: Cambios de contraseña o privilegios que deben propagarse instantáneamente.
*  **Propósito**: Asegurar la integridad absoluta de los datos a costa de la velocidad de respuesta y la disponibilidad en entornos distribuidos.