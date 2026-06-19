---
def-type: atomic
aliases:
  - reglas de negocio
  - business rules
  - lógica de negocio
  - restricciones del sistema
tags:
  - arquitectura
  - lógica
  - diseño-de-sistemas
category: gobernanza-y-lógica
contexto: ingeniería-de-software
version: 1
date: 2026-06-18
status: estandar
---
Directrices y restricciones que dictan cómo una organización opera. En arquitectura, es vital distinguirlas de las capacidades y funciones técnicas:

*  **Capacidad (¿ Qué puede hacer el sistema?)**: El alcance estratégico del software. Define el "qué" a alto nivel.
  
    * **Ejemplo**: "Capacidad de gestión de inventarios".
*  **Función (¿Cómo se ejecuta técnicamente?)**: La acción técnica o proceso programado para realizar una tarea. Define el "cómo" operativo.
  
    * **Ejemplo**: "Función `actualizar_stock()` que decrementa una unidad en la tabla de productos".
*  **Regla de negocio (¿Qué política limita la acción?)**: La restricción o condición lógica que debe cumplirse para que la función sea válida. Define el "por qué" de las limitaciones.
  
    * **Ejemplo**: "No se puede confirmar un pedido si el stock disponible es menor a 1".
*  **Propósito**: Actuar como el "sistema nervioso" de la aplicación. Centralizarlas en la base de datos (mediante RDBMS) garantiza que, sin importar desde dónde se acceda (web, app, API), la lógica siempre sea consistente y segura.

---

**Tipos de reglas según su impacto:**

1. **Reglas de integridad (Estructurales)**: Protegen la coherencia de los datos (ej. "Todo pedido debe estar ligado a un cliente").
2. **Reglas de dominio (Restricciones)**: Definen valores válidos (ej. "La edad mínima de un cliente es 18 años").
3. **Reglas de flujo (Procedimentales)**: Dictan la secuencia de eventos (ej. "Una factura solo se puede emitir tras la confirmación del pago").

