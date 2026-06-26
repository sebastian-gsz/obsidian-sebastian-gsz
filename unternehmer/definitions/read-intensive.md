---
def-type: atomic
version: 1.0
id: def-carga-lectura
status: estandar
category: tipos-de-carga
contexto: arquitectura-de-datos
date: 2026-06-26
tags:
  - arquitectura
  - rendimiento
  - bases-de-datos
  - optimización
aliases:
  - carga de lectura
  - alta concurrencia de lectura
  - carga de trabajo intensiva en lectura
  - intensiva en lectura
  - read-intensive
---
Una carga de trabajo intensiva en lectura define arquitecturas donde la frecuencia de operaciones de acceso a datos (SELECT/GET) es significativamente superior a la de operaciones de escritura o actualización (INSERT/UPDATE/DELETE). En este escenario, el desafío de diseño no es la integridad transaccional compleja, sino la baja latencia y la escalabilidad bajo alta concurrencia.

#### Estrategias de optimización y escalabilidad

Para evitar que la base de datos primaria se convierta en un cuello de botella, se implementan patrones arquitectónicos específicos:

- **Réplicas de lectura (Read Replicas):** Se crean copias de solo lectura de la base de datos primaria. El tráfico de consulta se distribuye entre estas réplicas, permitiendo escalar la capacidad de lectura de forma casi lineal.
- **Caché (Caching):** Se despliegan capas de almacenamiento volátil de acceso ultrarrápido (ej. Redis, Memcached) frente a la base de datos. Los resultados de consultas frecuentes se almacenan aquí, eliminando la necesidad de acceder al almacenamiento persistente en cada petición.
- **CDN (Content Delivery Network):** Para activos estáticos o contenido servido desde la base, las redes de distribución de contenido acercan los datos al usuario final, descargando totalmente la infraestructura de origen.

#### Compromisos de diseño

En arquitecturas altamente optimizadas para lectura, a menudo se prioriza la **consistencia eventual** sobre la **consistencia fuerte**. Esto significa que puede haber un desfase (lag) de milisegundos entre la escritura en el nodo primario y la visibilidad de ese dato en las réplicas de lectura, una decisión aceptable para casos de uso como catálogos de productos, feeds de noticias o dashboards estadísticos.

#### Casos de uso típicos

- **E-commerce:** La navegación por catálogos de productos requiere millones de lecturas rápidas frente a pocas actualizaciones de inventario.
- **Sistemas de gestión de contenidos (CMS/Blogs):** Los artículos se escriben una vez y se leen miles de veces.
- **Dashboards analíticos:** Visualización de métricas históricas donde el dato no cambia constantemente, pero es consultado masivamente por diversos usuarios.