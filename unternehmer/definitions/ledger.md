---
def-type: atomic
aliases:
  - Ledger Database
  - Base de datos de libro mayor
  - Libro mayor
  - Ledger
tags:
  - inmutabilidad
  - auditoria
  - criptografia
category: modelo_datos
contexto: bases_de_datos
version: 1
date: 2026-06-15
status: estandar
---
Una base de datos de libro mayor (Ledger DB) es un sistema diseñado específicamente para mantener un historial de datos inmutable, transparente y verificable mediante técnicas criptográficas.

**Características principales**

* **Append-only**: Solo permite operaciones de añadir datos; no existen comandos de `UPDATE` o `DELETE` tradicionales.
* **Historial completo**: Registra todas las versiones de un registro a lo largo del tiempo, facilitando auditorías históricas.
* **Verificabilidad**: Utiliza cadenas de hash (hashes) para asegurar que ninguna entrada histórica ha sido alterada.

**Caso de uso típico**

Sistemas financieros, registros médicos, cadena de suministro y cualquier entorno donde la integridad histórica y la prueba de no alteración sean requisitos normativos.