---
def-type: atomic
version: 1.0
id: def-sharding
status: estandar
category: estrategias-de-escalado
contexto: arquitectura-de-datos
date: 2026-06-16
tags:
  - escalabilidad
  - bases-de-datos
  - arquitectura
  - rendimiento
aliases:
  - particionamiento-horizontal
  - database-sharding
  - sharding
  - database sharding
  - particionamiento horizontal
---
El _sharding_ o particionamiento horizontal es una estrategia de escalabilidad horizontal que consiste en dividir un conjunto de datos extenso en subconjuntos más pequeños y manejables, denominados _shards_, los cuales se distribuyen a través de múltiples servidores o nodos independientes.

Esta estrategia resuelve los cuellos de botella en sistemas de alto rendimiento y volumen masivo donde una base de datos centralizada sería incapaz de atender la concurrencia o almacenar el volumen total de información. Su implementación requiere una lógica de enrutamiento basada en una _shard key_ (llave de partición) para determinar el nodo donde reside un dato específico.

-  **Escalabilidad de escritura (Write-Scalability):** Permite superar las limitaciones de capacidad de un único servidor. Al repartir la carga, se incrementa linealmente tanto la capacidad de almacenamiento como el _throughput_ de operaciones de lectura y escritura.

	-  **Faceta de escalabilidad (Write-Intensive)**: Permite superar el límite de capacidad de un único servidor (escalabilidad vertical). Al repartir la carga, se incrementa linealmente tanto la capacidad de almacenamiento como el throughput de operaciones (lecturas y escrituras).
	-  **Faceta operativa**: Requiere una lógica de enrutamiento basada en una "shard key" (llave de partición) para determinar en qué nodo reside un dato específico.
	-  **Desafío técnico**: Incrementa la complejidad operativa del sistema, ya que realizar consultas que involucran múltiples shards (consultas transversales) es significativamente más costoso y complejo que en una base de datos centralizada.
-  **Escalabilidad de lectura (Read-Scalability):** Se optimiza implementando replicación sobre los _shards_. Cada _shard_ puede ser un clúster con un nodo maestro para escrituras y múltiples réplicas para lecturas, distribuyendo la carga mediante un balanceador.
-  **Diferenciación estratégica:** A diferencia del uso de colas (que gestionan picos de tráfico), el _sharding_ se emplea cuando se alcanzan los límites físicos de almacenamiento o procesamiento de un sistema.
-  **Desafíos técnicos:** Incrementa la complejidad operativa del sistema, ya que las consultas transversales que involucran múltiples _shards_ son significativamente más costosas y complejas de ejecutar que en una base de datos centralizada.

	-  **Usas colas (desacoplamiento)**: Cuando el problema es el **pico de tráfico** (demasiadas escrituras en un intervalo corto). La cola actúa como un colchón: los usuarios escriben en la cola, y la base de datos procesa esos mensajes a su propio ritmo.
	-  **Usas sharding**: Cuando el problema es el **límite físico** (tu base de datos ya no puede guardar más gigabytes o procesar más peticiones por segundo, aunque esté estable). Aquí no basta con "esperar", necesitas más potencia física distribuida.

