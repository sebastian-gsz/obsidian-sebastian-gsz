---
def-type: atomic
version: 1.0
id: def-throughput
status: estandar
category: conceptos-fundamentales
contexto: ingeniería-de-sistemas
date: 2026-06-26
tags:
  - métricas
  - rendimiento
  - redes
  - arquitectura
aliases:
  - rendimiento
  - tasa de transferencia
  - capacidad de flujo
  - throughput
---
El _throughput_ es la medida fundamental de la capacidad de procesamiento de un sistema. Define la cantidad total de trabajo útil (datos, transacciones o tareas) que un sistema completa con éxito dentro de un intervalo de tiempo específico. Es el indicador crítico para evaluar la escalabilidad y la eficiencia operativa de una infraestructura.

#### Dominios de aplicación y medición

La métrica se adapta al contexto del sistema evaluado:

-  **Infraestructura de redes:** Representa la tasa real de datos transferidos exitosamente a través de un canal. A diferencia del ancho de banda (capacidad teórica), el _throughput_ descuenta la pérdida de paquetes, la retransmisión y el _overhead_ de los protocolos de comunicación.
-  **Bases de datos y aplicaciones:** Se cuantifica mediante el volumen de trabajo transaccional:
    
    -  **TPS:** Transacciones por segundo.
    -  **QPS:** Consultas por segundo.
    -  **RPS:** Peticiones por segundo.

#### Distinción técnica: Latencia vs. Throughput

Es un error común confundir estos términos. La relación es la siguiente:

-  **Latencia:** Mide el tiempo que tarda una sola unidad de trabajo en viajar de origen a destino (velocidad de un solo paquete/solicitud).
-  **Throughput:** Mide la capacidad total del sistema para procesar múltiples unidades de trabajo en paralelo (capacidad de carga).

> **Analogía operativa:** Si comparamos un sistema con una autopista, la **latencia** es la velocidad máxima a la que circula un vehículo (tiempo de viaje), mientras que el **throughput** es el número total de vehículos que cruzan el peaje en una hora (capacidad de flujo).

#### Importancia estratégica

Un _throughput_ alto indica que el sistema aprovecha sus recursos (CPU, RAM, I/O) de manera eficiente para maximizar la productividad. En el diseño de sistemas de alta carga, el objetivo no es solo reducir la latencia, sino optimizar el paralelismo y la concurrencia para elevar el _throughput_ máximo sin degradar la estabilidad. Cuando el _throughput_ alcanza su límite y la latencia comienza a aumentar exponencialmente, el sistema ha llegado a su punto de saturación.