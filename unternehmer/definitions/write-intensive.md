---
def-type: atomic
aliases:
  - write-intensive
  - intensiva en escritura
tags:
  - arquitectura
  - rendimiento
  - bases-de-datos
  - escalabilidad
category: tipos-de-carga
contexto: arquitectura-de-datos
version: 1
date: 2026-06-16
status: estandar
---
Se refiere a cualquier sistema o arquitectura cuya operación predominante consiste en la creación, modificación o actualización continua de datos, superando en frecuencia y volumen a las operaciones de lectura.

*  **Faceta de rendimiento**: El principal cuello de botella suele ser la latencia de escritura en el medio de almacenamiento (I/O) o la necesidad de confirmación de integridad (commit) en sistemas transaccionales.
*  **Faceta de escalabilidad**: Requiere arquitecturas que soporten altas tasas de ingesta sin bloquear el acceso a los datos. Las técnicas comunes incluyen el uso de colas de mensajes (buffering) para aplanar los picos de escritura o bases de datos orientadas a registros inmutables (append-only).
*  **Casos de uso típicos**:
  
    * **IoT y telemetría**: Recepción masiva de eventos desde sensores.
    * **Log management**: Almacenamiento continuo de registros de eventos.
    * **AdTech**: Registro en tiempo real de impresiones y clics publicitarios.
    * **Blockchain**: Adición de transacciones inmutables a un libro mayor.
*  **Propósito**: Evaluar la capacidad de un motor de base de datos para manejar el throughput de escritura y determinar si se requiere una estrategia de desacoplamiento mediante colas o particionamiento (sharding) para mantener la disponibilidad.