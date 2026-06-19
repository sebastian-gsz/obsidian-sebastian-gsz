---
def-type: atomic
aliases:
  - schema-on-read
  - json-document
  - Semi-structured
  - Semiestructurado
  - Esquema flexible
tags:
  - bases-de-datos
  - nosql
  - modelado-de-datos
category: patrones-de-diseño
contexto: almacenamiento
version: 1
date: 2026-06-17
status: estandar
---
Modelo de datos que no requiere una estructura fija o predefinida en las tablas (schema-on-write), permitiendo que cada registro tenga campos diferentes.

* **Faceta técnica**: Los datos se almacenan típicamente en formato JSON o BSON, facilitando la jerarquía y la anidación de información.
* **Faceta de escalabilidad**: Elimina el costo administrativo de modificar esquemas cuando el negocio añade nuevas tipologías de productos.
* **Uso ideal**: Catálogos de e-commerce con atributos variables, perfiles de usuario enriquecidos y datos recopilados de fuentes heterogéneas.
* **Propósito**: Priorizar la velocidad de desarrollo y la adaptabilidad frente a la rigidez de la integridad referencial estricta.