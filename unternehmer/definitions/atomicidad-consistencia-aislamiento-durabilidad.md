---
def-type: atomic
aliases:
  - ACID
tags:
  - transacciones
  - bases-de-datos
  - fiabilidad
  - integridad
category: propiedad
contexto: bases-de-datos
version: 1
date: 2026-06-15
status: estandar
---

ACID es un acrónimo que define las cuatro propiedades fundamentales que garantizan la fiabilidad y consistencia de las transacciones en una base de datos.

**Propiedades**

* **Atomicidad (Atomicity)**: La transacción se considera una unidad indivisible; o se ejecuta completamente, o no se ejecuta nada (todo o nada).
* **Consistencia (Consistency)**: La transacción asegura que la base de datos pase de un estado válido a otro estado válido, cumpliendo con todas las reglas y restricciones definidas.
* **Aislamiento (Isolation)**: Las transacciones concurrentes no interfieren entre sí; el resultado de múltiples transacciones ejecutadas simultáneamente debe ser igual al resultado de ejecutarlas secuencialmente.
* **Durabilidad (Durability)**: Una vez que una transacción se confirma (commit), los cambios realizados son permanentes y no se perderán incluso ante fallos del sistema o del hardware.