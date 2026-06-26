---
def-type: atomic
version: 1.2
id: def-rdbms
status: estandar
category: modelo_datos
contexto: bases_de_datos
date: 2026-06-26
tags:
  - sql
  - acid
  - tablas
  - integridad
aliases:
  - rdbms
  - base de datos relacional
  - relacional
  - relational databases
  - relational
  - relational database management system
---
Un RDBMS es un sistema que organiza los datos en tablas compuestas por filas y columnas, estableciendo relaciones explícitas entre ellas mediante claves primarias y foráneas. Este modelo es el pilar de la gestión de datos estructurados donde la integridad y la consistencia son requisitos innegociables.

#### Pilares fundamentales

-  **Estructura fija (Schema-on-write):** Requiere un esquema predefinido antes de insertar datos. Esto garantiza que cada entrada cumpla con el formato esperado, facilitando la validación temprana.
-  **Integridad ACID:** El cumplimiento de las propiedades de Atomicidad, Consistencia, Aislamiento y Durabilidad asegura que las transacciones se completen íntegramente o no se realicen, manteniendo los datos siempre en un estado válido.
-  **SQL (Structured Query Language):** El estándar universal para la manipulación y consulta, permitiendo operaciones complejas de unión (_JOINs_), filtrado y agregación sobre múltiples tablas.

#### Reglas de negocio e integridad

El RDBMS actúa como un guardián de la lógica de negocio mediante restricciones implementadas a nivel de motor:

-  **Integridad estructural:**

    -  `PRIMARY KEY`: Identidad única innegociable (ej. ISBN de un libro).
    -  `FOREIGN KEY`: Integridad referencial (ej. un pedido debe estar vinculado a un cliente existente).
    -  `NOT NULL`: Garantiza la completitud (ej. fecha de transacción obligatoria).
-  **Validación de dominio:**
    
    -  `CHECK`: Valida expresiones lógicas complejas (ej. `precio >= 0`).
    -  `DEFAULT`: Asigna valores normativos ante omisiones (ej. estado `activo` por defecto).
-  **Lógica procedimental:**

    -  `Triggers`: Automatización ante eventos DML (ej. descontar inventario automáticamente tras una venta en _The Hat Lab_).
    -  `Stored Procedures`: Encapsulan flujos de trabajo complejos (ej. gestión completa de reembolsos) para asegurar que la lógica se ejecute igual independientemente del cliente que la invoque.        

#### Casos de uso de alta integridad

-  **ERP (Enterprise Resource Planning):** Centralización operativa (RRHH, logística, compras) donde la integridad absoluta es obligatoria para la continuidad del negocio.
-  **Gestión de Inventarios:** Crucial para evitar la sobreventa. El uso de transacciones atómicas garantiza que el stock se reduzca en el mismo instante en que se genera la venta.
-  **Facturación y Contabilidad:** Donde la "partida doble" y la inmutabilidad de los registros contables son leyes. La consistencia ACID es el único mecanismo aceptable para auditorías legales.
- **Catálogos estructurados:** Datos donde la jerarquía y la normalización previenen redundancias que corromperían las búsquedas.

#### Valor de la centralización

Implementar estas reglas dentro del RDBMS (en lugar de delegarlas exclusivamente a la aplicación) garantiza:

1. **Consistencia centralizada:** Reglas de negocio unificadas, independientemente de la aplicación cliente (Web, API, Mobile) que acceda a los datos.
2. **Seguridad de datos:** Protección ante inserciones manuales o errores en el código de la aplicación, ya que el motor rechaza cualquier entrada que viole las restricciones definidas.
