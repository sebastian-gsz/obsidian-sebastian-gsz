---
def-type: atomic
aliases:
  - modelo estructurado
  - schema-on-write
  - Información estructurada
tags:
  - rdbms
  - modelado-de-datos
category: fundamentos-de-arquitectura
contexto: bases-de-datos
version: 1
date: 2026-06-18
status: estandar
---
Datos que siguen un esquema rígido y predefinido donde se especifica el nombre, el tipo de dato y el tamaño (bytes) de cada columna antes de su inserción.

* **Ventaja**: Garantiza que los datos cumplan con reglas de negocio estrictas antes de ser almacenados.
* **Contraste**: A diferencia de la información semiestructurada (NoSQL), la estructurada requiere una curva de aprendizaje de diseño inicial (modelado entidad-relación) pero ofrece alta integridad y capacidad de consulta relacional.