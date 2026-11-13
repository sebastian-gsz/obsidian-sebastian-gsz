---
def-type: atomic
version: 1.0
id: def-rdma
status: estandar
category: redes
contexto: alta-performance
date: 2026-11-11
tags:
  - rdma
  - redes
  - alto-rendimiento
  - clusters
aliases:
  - rdma
  - remote direct memory access
  - acceso directo a memoria remota
---
Una **red de clúster RDMA** (_Remote Direct Memory Access_ — acceso directo a memoria remota) es una **infraestructura de red diseñada para permitir la transferencia de datos entre servidores o nodos SIN involucrar la CPU en el proceso**: la memoria de un nodo se escribe directamente en la memoria de otro — el camino más corto que existe entre dos servidores.

#### Qué Cambia Respecto a la Red Tradicional

-  En la red clásica, cada transferencia pasa por la CPU de ambos extremos: interrupciones, copias entre kernel y usuario, procesamiento de protocolo — la CPU es el cuello de botella.
-  Con **RDMA**, la NIC escribe directamente en la memoria del destinatario: sin copias, sin interrupciones, sin CPU — latencia de microsegundos y la CPU queda libre para el trabajo real.

#### Las Tecnologías que la Implementan

-  **InfiniBand**: la red dedicada de alto rendimiento — el estándar de los superclusters.
-  **RDMA sobre Converged Ethernet (RoCE)**: la misma técnica sobre Ethernet convencional — RDMA sin red nueva.

#### Dónde Brilla

-  **Superclusters de IA**: miles de GPUs intercambiando datos entre sí con latencia mínima — el entrenamiento distribuido moderno depende de RDMA: la GPU no puede esperar a la CPU mientras sincroniza gradientes.
-  **Computación en la nube y análisis de datos**: bases de datos distribuidas y almacenamiento en clúster donde cada milisegundo de red se multiplica por millones de operaciones.
-  **Oracle Cloud Infrastructure (OCI)**: emplea RDMA en redes de clúster para mejorar el rendimiento de bases de datos autónomas y servicios de alto rendimiento; en **Hyper-V Failover Clusters** puede generar advertencias si los adaptadores de red no son compatibles — la técnica exige hardware que la soporte.

#### Diferencia Crítica: RDMA vs. Red Tradicional (TCP/IP)

-  La red **TCP/IP** procesa cada paquete en software y CPU — universal, flexible, y con coste por byte en ciclos.
-  **RDMA** bypass la pila: hardware que habla directo a memoria — ultraeficiente pero exige hardware específico y configuración cuidadosa.
-  El trade-off: universalidad (TCP) frente a latencia mínima y CPU libre (RDMA) — por eso RDMA vive en los clústeres donde el costo de la espera se paga con millones de horas de GPU.

### Propósito fundamental

RDMA elimina al intermediario de la transferencia de datos: la memoria de un servidor escrita directamente en la de otro, sin CPU en el camino — la infraestructura que hace viables los superclusters de IA y las bases de datos distribuidas de élite, donde la red deja de ser un canal y pasa a ser una extensión de la memoria.
