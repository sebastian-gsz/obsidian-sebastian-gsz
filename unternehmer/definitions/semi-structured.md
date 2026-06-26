---
def-type: atomic
version: 1.0
id: def-schema-on-read
status: estandar
category: patrones-de-diseño
contexto: almacenamiento
date: 2026-06-26
tags:
  - bases-de-datos
  - nosql
  - modelado-de-datos
aliases:
  - schema-on-read
  - json-document
  - semi-structured
  - semiestructurado
  - esquema flexible
---
El modelo de datos semiestructurado, conocido como _schema-on-read_, elimina la necesidad de un esquema rígido en el momento de la escritura. A diferencia de las bases de datos relacionales que validan la estructura antes de persistir la información, este patrón permite que cada registro tenga su propia estructura, campos o tipos de datos, ofreciendo una flexibilidad radical para entornos cambiantes.

#### Faceta técnica

Los datos se almacenan típicamente en formatos auto-descriptivos como **JSON** o **BSON**. Esta naturaleza permite:

-  **Jerarquía y anidación:** Representar objetos complejos (ej. un carrito de compras con múltiples productos y sub-atributos) sin necesidad de múltiples tablas o _JOINs_ costosos.
-  **Polimorfismo:** Diferentes objetos dentro de la misma colección pueden evolucionar de forma independiente, eliminando las tediosas migraciones de esquemas (_schema migrations_) que bloquean el despliegue en sistemas tradicionales.

#### Escalabilidad y agilidad

La principal ventaja competitiva es la velocidad de desarrollo. Al eliminar el costo administrativo de modificar esquemas cuando el negocio añade nuevas tipologías de productos o atributos, los equipos pueden iterar rápidamente sobre los datos.

-  **Caso de uso - E-commerce:** Un catálogo con productos variables (ropa, electrónica, libros) donde cada categoría requiere atributos únicos (talla vs. voltaje vs. ISBN).
-  **Caso de uso - Perfiles de usuario:** Almacenar datos heterogéneos y enriquecidos que provienen de múltiples fuentes (redes sociales, formularios web, aplicaciones móviles) sin forzar una estructura global uniforme.

#### Compromiso arquitectónico

Aunque este patrón prioriza la adaptabilidad, traslada la responsabilidad de la validación del esquema a la capa de lectura (la aplicación que consume los datos). Si no se implementan procesos de limpieza o validación, existe el riesgo de acumular datos inconsistentes o "pantanos de datos". Su propósito es, por tanto, balancear la rigidez de la integridad referencial estricta a favor de la agilidad operativa en sistemas donde la estructura de los datos es evolutiva o impredecible.