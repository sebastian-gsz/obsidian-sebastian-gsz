---
def-type: atomic
version: 1.0
id: def-business-rules
status: estandar
category: gobernanza-y-lógica
contexto: ingeniería-de-software
date: 2026-06-18
tags:
  - arquitectura
  - lógica
  - diseño-de-sistemas
aliases:
  - reglas de negocio
  - business rules
  - lógica de negocio
  - restricciones del sistema
---
Directrices y restricciones fundamentales que dictan cómo opera una organización. En el ámbito de la arquitectura de sistemas, es imperativo distinguir entre capacidades funcionales y las reglas que gobiernan su ejecución.

### Distinción conceptual

- **Capacidad (¿Qué puede hacer el sistema?)**: Representa el alcance estratégico del software, definiendo el "qué" a un nivel elevado. Ejemplo: "Capacidad de gestión de inventarios".
- **Función (¿Cómo se ejecuta técnicamente?)**: Es la acción técnica o proceso programado diseñado para realizar una tarea específica, definiendo el "cómo" operativo. Ejemplo: "Función `actualizar_stock()` que decrementa una unidad en la tabla de productos".
- **Regla de negocio (¿Qué política limita la acción?)**: Es la restricción o condición lógica necesaria para que una función sea válida, definiendo el "por qué" de las limitaciones. Ejemplo: "No se puede confirmar un pedido si el stock disponible es menor a 1".

### Propósito y gestión

Actúan como el "sistema nervioso" de la aplicación. Centralizarlas en la base de datos (mediante RDBMS) garantiza que, independientemente del punto de acceso (web, app, API), la lógica aplicada sea siempre consistente y segura.

### Tipos de reglas según impacto

- **Reglas de integridad (Estructurales)**: Protegen la coherencia de los datos. Ejemplo: "Todo pedido debe estar ligado a un cliente".
- **Reglas de dominio (Restricciones)**: Definen los valores válidos dentro del sistema. Ejemplo: "La edad mínima de un cliente es 18 años".
- **Reglas de flujo (Procedimentales)**: Dictan la secuencia lógica de eventos. Ejemplo: "Una factura solo se puede emitir tras la confirmación del pago".

