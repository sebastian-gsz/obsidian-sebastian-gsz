---
def-type: atomic
version: 1.0
id: def-graph-db
status: estandar
category: modelos-de-datos
contexto: almacenamiento
date: 2026-06-24
tags:
  - base-de-datos
  - nodos
  - relaciones
  - nosql
aliases:
  - graph db
  - base de datos de grafos
  - graph database
---
Las bases de datos de grafos son sistemas de gestión de datos diseñados específicamente para almacenar, representar y navegar relaciones complejas entre entidades utilizando una estructura basada en nodos, aristas y propiedades. A diferencia de los modelos relacionales tradicionales, este enfoque prioriza la conectividad entre los datos.

-  **Faceta de relación:** El modelo prioriza la importancia de las conexiones entre entidades por encima de los datos individuales, permitiendo una representación directa de redes complejas.
-  **Faceta de análisis:** Permite realizar consultas profundas y de alta eficiencia sobre relaciones multi-nivel, facilitando operaciones como el descubrimiento de trayectorias (ej. "amigos de mis amigos" o búsqueda de rutas óptimas).
-  **Propósito:** Son herramientas ideales para motores de recomendación, detección de fraudes, análisis de redes sociales y modelado de dependencias en sistemas TI.
-  **Eficiencia:** El rendimiento en la navegación de relaciones es constante independientemente del tamaño total del grafo, ya que la búsqueda se realiza mediante el recorrido de punteros físicos en lugar de operaciones costosas de unión (_joins_).