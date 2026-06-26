---
def-type: atomic
version: 1.0
id: def-acid
status: estandar
category: propiedad
contexto: bases-de-datos
date: 2026-06-15
tags:
  - transacciones
  - bases-de-datos
  - fiabilidad
  - integridad
aliases:
  - acid
  - atomicity
  - consistency
  - isolation 
  - durability
  - atomicity consistency isolation durability
  - atomicidad
  - consistencia
  - aislamiento
  - durabilidad
  - atomicidad consistencia aislamiento durabilidad
---

ACID es un acrónimo que define las cuatro propiedades fundamentales que garantizan la fiabilidad, integridad y consistencia de las transacciones en un sistema de gestión de bases de datos relacionales (RDBMS).

- **Atomicidad (Atomicity):** El principio de "todo o nada". Si una parte de la transacción falla, la transacción completa se aborta y la base de datos permanece inalterada.
- **Consistencia (Consistency):** Garantiza que la transacción lleve a la base de datos de un estado válido a otro, respetando todas las reglas, restricciones (constraints) y disparadores (triggers) definidos.
- **Aislamiento (Isolation):** Asegura que la ejecución concurrente de transacciones no resulte en estados inconsistentes. El resultado de múltiples transacciones debe ser equivalente a su ejecución secuencial.
- **Durabilidad (Durability):** Una vez que una transacción ha sido confirmada (_commit_), sus efectos son persistentes y no se pierden, incluso en caso de fallos de hardware, cortes de energía o errores del sistema.