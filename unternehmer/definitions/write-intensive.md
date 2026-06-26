---
def-type: atomic
version: 1.0
id: def-write-intensive
status: estandar
category: tipos-de-carga
contexto: arquitectura-de-datos
date: 2026-06-26
tags:
  - arquitectura
  - rendimiento
  - bases-de-datos
  - escalabilidad
aliases:
  - write-intensive
  - intensiva en escritura
---
Una carga de trabajo _write-intensive_ define arquitecturas donde la frecuencia y el volumen de operaciones de creación, modificación o actualización de datos superan sistemáticamente a las de lectura. Estos sistemas son fundamentales en infraestructuras donde la captura de estado y la persistencia de eventos son más críticas que la consulta inmediata.

#### Faceta de rendimiento

El cuello de botella principal en estos sistemas suele ser la latencia de entrada/salida (I/O) del medio de almacenamiento. A diferencia de las cargas _read-intensive_ (que pueden mitigarse fácilmente con caché), las operaciones de escritura requieren persistencia en disco o un consenso entre nodos para garantizar la integridad (commit), lo que genera contención por bloqueos (_locking_) y latencia de escritura.

#### Estrategias de escalabilidad

Para manejar altas tasas de ingesta sin degradar la disponibilidad, se emplean estrategias específicas:

-  **Desacoplamiento (buffering):** Uso de colas de mensajes (como Apache Kafka) para absorber picos de escritura y aplanar la carga sobre la base de datos principal.
-  **Append-only:** Implementación de modelos inmutables donde los datos solo se añaden, evitando actualizaciones costosas en el medio de almacenamiento.
-  **Particionamiento (sharding):** Distribución de la carga de escritura a través de múltiples nodos físicos para paralelizar el I/O.

#### Casos de uso

-  **IoT y telemetría:** Ingesta masiva y continua de eventos desde miles de sensores.
-  **Log management:** Registro constante de eventos de auditoría y telemetría de sistemas.
-  **AdTech:** Registro en tiempo real de impresiones y clics publicitarios.
-  **Blockchain:** Adición secuencial e inmutable de transacciones a un libro mayor distribuido.

#### Comando de evaluación (benchmark)

Para validar la capacidad de escritura de un volumen o base de datos utilizando `fio` (flexible I/O tester), se utiliza el siguiente comando de prueba: `fio --name=write-test --ioengine=libaio --rw=write --bs=4k --size=1G --numjobs=4 --iodepth=16 --runtime=60 --group_reporting`

