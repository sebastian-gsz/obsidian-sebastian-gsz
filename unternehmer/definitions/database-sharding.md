---
def-type: atomic
aliases:
  - particionamiento-horizontal
  - database-sharding
  - Sharding
  - database sharding
  - particionamiento horizontal
tags:
  - escalabilidad
  - bases-de-datos
  - arquitectura
  - rendimiento
category: estrategias-de-escalado
contexto: arquitectura-de-datos
version: 1.1
date: 2026-06-16
status: estandar
---
Estrategia de escalabilidad horizontal que consiste en dividir un conjunto de datos grande en subconjuntos más pequeños y manejables llamados "shards", los cuales se distribuyen a través de múltiples servidores o nodos.

- **La analogía**: Imagina que tienes una biblioteca gigantesca con todos los libros del mundo en una sola estantería. A medida que la biblioteca crece, los bibliotecarios chocan entre sí tratando de organizar los libros, y es imposible encontrar nada.
- **La solución**: Decides dividir la biblioteca en 26 estanterías diferentes. La estantería "A" solo contiene libros que empiezan por A, la "B" por B, y así sucesivamente. Ahora, si alguien busca un libro que empieza por "M", el bibliotecario sabe exactamente a qué estantería ir. Esto es el **sharding**.

---

- **Faceta de escalabilidad (Write-Intensive)**: Permite superar el límite de capacidad de un único servidor (escalabilidad vertical). Al repartir la carga, se incrementa linealmente tanto la capacidad de almacenamiento como el throughput de operaciones (lecturas y escrituras).
- **Faceta operativa**: Requiere una lógica de enrutamiento basada en una "shard key" (llave de partición) para determinar en qué nodo reside un dato específico.
- **Propósito**: Resolver cuellos de botella en sistemas de alto rendimiento y volumen masivo donde una base de datos centralizada sería incapaz de atender la concurrencia o almacenar el volumen total de datos.
- **Desafío técnico**: Incrementa la complejidad operativa del sistema, ya que realizar consultas que involucran múltiples shards (consultas transversales) es significativamente más costoso y complejo que en una base de datos centralizada.

---

**Extensión para cargas intensivas en escritura (Write-Scalability)**

En lugar de tener una sola base de datos central que maneja todos los registros, distribuyes los datos en múltiples servidores independientes:

1. **Shard Key (Llave de partición)**: Eliges un atributo (por ejemplo, `user_id`) que servirá para decidir a qué servidor enviar el dato.
2. **Distribución**: Cuando el sistema recibe una escritura, calcula qué servidor le corresponde según su `user_id`.
3. **Escalabilidad**: Si tu carga de trabajo aumenta, simplemente añades más servidores (más _shards_) y redistribuyes los datos.

**Extensión para cargas intensivas en lectura (Read-Scalability):**

Para optimizar la lectura sobre una arquitectura sharded, se implementa la **Replicación**:

1. **Réplicas de lectura (Read Replicas)**: Cada "shard" no es un servidor único, sino un clúster compuesto por un nodo maestro (que maneja las escrituras del shard) y múltiples réplicas (que manejan exclusivamente las lecturas).
2. **Distribución de carga**: Las peticiones de lectura se reparten entre las réplicas mediante un balanceador de carga.
3. **Sinergia**: Mientras el _sharding_ escala la **escritura** al dividir la carga entre varios maestros, la _replicación_ escala la **lectura** al multiplicar los puntos de acceso para consultar los datos ya particionados.

---

**¿Cuándo elegir entre colas y sharding?**

- **Usas colas (desacoplamiento)**: Cuando el problema es el **pico de tráfico** (demasiadas escrituras en un intervalo corto). La cola actúa como un colchón: los usuarios escriben en la cola, y la base de datos procesa esos mensajes a su propio ritmo.
- **Usas sharding**: Cuando el problema es el **límite físico** (tu base de datos ya no puede guardar más gigabytes o procesar más peticiones por segundo, aunque esté estable). Aquí no basta con "esperar", necesitas más potencia física distribuida.
