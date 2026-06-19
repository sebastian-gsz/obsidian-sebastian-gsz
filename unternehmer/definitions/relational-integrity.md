---
def-type: atomic
aliases:
  - normalización
  - relaciones
  - esquema relacional
  - Integridad relacional
tags:
  - sql
  - rdbms
  - modelado-de-datos
category: fundamentos-de-arquitectura
contexto: bases-de-datos
version: 1
date: 2026-06-18
status: estandar
---
Principio de diseño que evita la duplicidad y las inconsistencias mediante la centralización de datos y el uso de relaciones explícitas.

*  **Origen histórico**: Solución a la optimización de almacenamiento en épocas de capacidad limitada (MBs), evitando redundancias.
*  **Mecanismos de consistencia**:
  
    *  **Llaves primarias (Primary Keys)**: Garantizan la unicidad de cada registro (el "padre").
    *  **Llaves foráneas (Foreign Keys)**: Establecen relaciones (el "hijo") asegurando que no existan registros huérfanos, manteniendo la integridad referencial.
*  **Bloqueo de registros**: Mecanismo de concurrencia donde el motor de base de datos bloquea un registro durante una actualización, permitiendo solo una modificación a la vez para evitar conflictos.