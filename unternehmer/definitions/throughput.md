---
def-type: atomic
aliases:
  - rendimiento
  - tasa de transferencia
  - capacidad de flujo
tags:
  - métricas
  - rendimiento
  - redes
  - arquitectura
category: conceptos-fundamentales
contexto: ingeniería-de-sistemas
version: 1
date: 2026-06-16
status: estandar
---
Es la medida de la cantidad total de trabajo (datos, transacciones o tareas) que un sistema es capaz de procesar con éxito dentro de un periodo de tiempo determinado.

* **Faceta de redes**: Se refiere a la tasa real de datos que se transfieren exitosamente a través de un canal de comunicación, considerando la pérdida de paquetes y la sobrecarga (overhead) del protocolo.
* **Faceta de bases de datos/aplicaciones**: Se cuantifica mediante el número de operaciones completadas por unidad de tiempo, tales como transacciones por segundo (TPS), consultas por segundo (QPS) o peticiones por segundo (RPS).
* **Diferencia técnica con la latencia**: Mientras que la latencia mide el tiempo que tarda una sola unidad de trabajo en viajar de principio a fin, el throughput mide la capacidad total del sistema para manejar múltiples unidades de trabajo en paralelo.
* **Propósito**: Es el indicador clave para determinar la escalabilidad y capacidad de carga de una infraestructura. Un throughput alto indica un sistema eficiente que aprovecha sus recursos para maximizar la productividad operativa.