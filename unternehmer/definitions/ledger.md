---
def-type: atomic
version: 1.0
id: def-ledger-db
status: estandar
category: modelo-de-datos
contexto: bases-de-datos
date: 2026-06-26
tags:
  - inmutabilidad
  - auditoria
  - criptografia
aliases:
  - ledger database
  - base de datos de libro mayor
  - libro mayor
  - ledger
---
Una base de datos de libro mayor es un sistema de almacenamiento diseñado para mantener un registro histórico centralizado, inmutable y verificable criptográficamente de todas las transacciones de una aplicación. A diferencia de las bases de datos relacionales tradicionales, donde los registros pueden ser modificados o eliminados (UPDATE/DELETE), el libro mayor está diseñado para preservar la integridad histórica de los datos.

#### Características técnicas principales

-  **Append-only (Solo inserción):** El modelo operativo prohíbe la modificación o eliminación de datos una vez escritos. Cada nueva transacción es una adición al registro. Si se requiere una corrección, se inserta una nueva entrada que invalida o compensa la anterior, manteniendo siempre la trazabilidad completa del error y la rectificación.
-  **Verificabilidad criptográfica:** Utiliza estructuras de datos como los árboles de Merkle o cadenas de hash (hash chaining) para vincular cada transacción con la anterior. Esto permite generar una "prueba de inclusión" que garantiza que los datos no han sido alterados ni por usuarios con privilegios elevados ni por administradores del sistema.
-  **Auditoría inmanente:** Al guardar todas las versiones de un registro a lo largo del tiempo, estas bases de datos facilitan de forma nativa la auditoría y el cumplimiento normativo (compliance), ya que proporcionan un historial completo (Journal) que actúa como "fuente única de verdad".

#### Casos de uso ideales

-  **Sistemas financieros y bancarios:** Registro inalterable de transacciones y movimientos de cuenta.
-  **Cadena de suministro (Supply Chain):** Seguimiento de la procedencia y propiedad de activos, donde la integridad del historial es crítica para evitar fraudes.
-  **Registros médicos y legales:** Almacenamiento de documentos o estados cuya validez legal depende de la garantía de que la información no fue manipulada posteriormente.
-  **Sistemas de identidad:** Gestión de logs de cambios en permisos o atribuciones de roles que requieren una pista de auditoría sólida e irrefutable.