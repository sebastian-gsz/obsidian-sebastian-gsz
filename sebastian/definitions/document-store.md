---
def-type: atomic
version: 1.0
id: def-document-store
status: estandar
category: modelos-de-datos
contexto: almacenamiento
date: 2026-06-22
tags:
  - base-de-datos
  - nosql
  - json
  - flexible
aliases:
  - document store
  - almacén de documentos
  - base de datos de documentos
---
Los almacenes de documentos son un tipo de base de datos NoSQL que organiza y preserva la información en formatos semiestructurados (como JSON, BSON o XML), denominados documentos. A diferencia de las bases de datos relacionales que imponen esquemas rígidos, este modelo trata cada registro como una entidad autocontenida que encapsula tanto los datos como su estructura propia.

Esta arquitectura facilita el desarrollo ágil al alinearse estrechamente con los objetos de programación, permitiendo que la persistencia de datos sea directa y eficiente. Su diseño es ideal para gestionar información con estructuras jerárquicas, variables o en constante evolución, como perfiles de usuario enriquecidos o catálogos de productos con atributos diversos.

-  **Flexibilidad (Schema-on-read):** Soporta esquemas dinámicos donde cada documento puede tener campos distintos, eliminando la necesidad de migraciones complejas ante cambios en los datos.
-  **Mapeo de objetos:** La representación de los datos se integra naturalmente con los objetos del código fuente, acelerando la capa de persistencia y reduciendo la complejidad del _mapping_.
-  **Estructuras jerárquicas:** Facilita la representación de datos complejos o anidados sin recurrir a múltiples _joins_ o tablas normalizadas excesivas.
-  **Gestión de diversidad:** Permite manejar eficientemente datos con atributos heterogéneos dentro de una misma colección, optimizando la flexibilidad del modelo.