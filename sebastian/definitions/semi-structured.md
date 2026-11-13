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
  - semiestructurado
  - esquema flexible
---
El modelo de datos semiestructurado, conocido como _schema-on-read_, elimina la necesidad de un esquema rígido en el momento de la escritura. A diferencia de las bases de datos relacionales que validan la estructura antes de persistir la información, este patrón permite que cada registro tenga su propia estructura, campos o tipos de datos, ofreciendo una flexibilidad radical para entornos cambiantes.