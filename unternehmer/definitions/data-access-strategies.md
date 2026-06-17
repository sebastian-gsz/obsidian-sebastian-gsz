---
def-type: atomic
aliases:
  - Patrones de acceso a datos
  - Data access strategies
tags:
  - arquitectura
  - diseño
  - optimización
  - bases-de-datos
category: metodología
contexto: diseño de sistemas
version: 1.0
date: 2026-06-15
status: estandar
---
Los "data access patterns" son el conjunto de estrategias y métodos que una aplicación utiliza para interactuar con su capa de almacenamiento. Definen cómo se consultan, insertan, actualizan y eliminan los datos de manera eficiente.

**Importancia en el diseño**

* **Modelado basado en consultas**: En arquitecturas modernas (especialmente NoSQL), el diseño de la base de datos se deriva directamente de estos patrones. Primero definimos cómo vamos a leer los datos y luego estructuramos el almacenamiento para optimizar esas lecturas.
* **Eficiencia**: Un patrón de acceso bien definido evita operaciones costosas como los "full table scans" o consultas mal optimizadas que degradan el rendimiento del sistema.
* **Escalabilidad**: Al conocer los patrones de acceso, es posible aplicar técnicas de caché, indexación o particionamiento que garanticen que la aplicación escale sin aumentar drásticamente la latencia.