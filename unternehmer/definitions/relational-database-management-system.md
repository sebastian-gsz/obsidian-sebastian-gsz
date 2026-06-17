---
def-type: atomic
aliases:
  - RDBMS
  - base de datos relacional
  - relacional
  - relational databases
  - relational
  - Relational Database Management System
tags:
  - sql
  - acid
  - tablas
  - integridad
category: modelo_datos
contexto: bases_de_datos
version: 1.2
date: 2026-06-17
status: estandar
---
Sistema que organiza los datos en tablas compuestas por filas y columnas, estableciendo relaciones mediante claves primarias y foráneas.

- **Estructura fija**: Requiere un esquema predefinido (schema-on-write).
- **Integridad ACID**: Garantiza atomicidad, consistencia, aislamiento y durabilidad en las transacciones.
- **Lenguaje estándar**: Utiliza SQL para la manipulación y consulta de datos.

---

-  **Casos de uso detallados**

	La naturaleza transaccional de las RDBMS las hace indispensables en entornos donde el error de datos es inaceptable:
	
	- **Sistemas ERP (Enterprise Resource Planning)**: Centralizan toda la operación empresarial (recursos humanos, compras, logística). Requieren integridad absoluta para que los datos financieros coincidan con las operaciones logísticas.
	- **Gestión de Inventarios (Ej. The Hat Lab)**: Crítico para evitar la sobreventa. Se basa en transacciones atómicas: si un cliente compra un sombrero, el inventario debe reducirse instantáneamente en la misma transacción donde se genera la venta.
	- **Sistemas de Facturación y Contabilidad**: Donde la "partida doble" y la inmutabilidad de los registros contables son leyes. La consistencia ACID es el único mecanismo aceptable para auditorías legales.
	- **Gestión de Usuarios y Perfiles Críticos**: Donde las relaciones de permisos, roles y acceso deben ser validadas constantemente mediante claves foráneas para evitar accesos no autorizados.
	- **Catálogos de contenido estructurado**: Ideal para datos como títulos, autores y géneros (donde la jerarquía y la normalización de los datos evitan redundancias que corromperían las búsquedas).
-  **Reglas de negocio (Integridad y lógica)**

	Restricciones lógicas implementadas dentro de la RDBMS para asegurar que los datos cumplan con las políticas de la organización y proteger el sistema contra estados inconsistentes.
	
	-  **Integridad estructural (esquema)**
	
		- **PRIMARY KEY**: Identidad única (ej. ISBN único).
		- **FOREIGN KEY**: Integridad referencial (ej. un pedido siempre debe estar ligado a un cliente existente).
		- **NOT NULL**: Obligatoriedad (ej. fecha de transacción).
	-  **Dominio y rango (validaciones)**
	
		- **CHECK**: Valida expresiones lógicas (ej. `precio >= 0`).
		- **DEFAULT**: Asigna valores normativos ante omisiones (ej. estado 'disponible').
	-  **Reglas de negocio complejas (procedimental)**
	
		- **Triggers**: Lógica automática ante eventos DML (ej. descontar inventario tras venta).
		- **Stored Procedures**: Encapsulan flujos de trabajo complejos (ej. `gestionar_devolucion_y_reembolso` valida el estado del producto y genera notas de crédito automáticamente).
-  **Valor de la centralización**

	Implementar estas reglas en la RDBMS garantiza:
	
	- **Consistencia centralizada**: Reglas únicas compartidas por cualquier aplicación cliente.
	- **Seguridad de datos**: Protege la integridad incluso ante inserciones manuales o errores fuera de la lógica de aplicación principal.
