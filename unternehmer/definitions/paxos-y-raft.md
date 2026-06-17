---
def-type: atomic
aliases:
  - Paxos
  - Raft
  - Protocolos de consenso
tags:
  - algoritmos/distribuidos
  - sistemas/distribuidos
  - consenso
category: algoritmos
contexto: sistemas-distribuidos
version: 1.0
date: 2026-06-15
status: estandar
---
Paxos y Raft son protocolos de consenso utilizados en sistemas distribuidos para garantizar que múltiples nodos se pongan de acuerdo sobre un valor único o un estado, incluso si algunos nodos fallan. Son la base de la consistencia en sistemas modernos como bases de datos, sistemas de archivos y orquestadores.

- **Algoritmos de consenso**

	* **Paxos**: Es el estándar académico clásico de consenso. Fue diseñado para ser matemáticamente correcto bajo diversas condiciones de fallo, aunque su implementación real es compleja y difícil de auditar.
	* **Raft**: Fue diseñado con la intención de ser comprensible y fácil de implementar. Divide el problema en subproblemas: elección de líder, replicación de log y seguridad.

- **Diferencias fundamentales**

	* **Complejidad**: Raft simplifica la gestión del estado mediante un modelo de líder-seguidor, mientras que Paxos carece de un concepto rígido de líder en su forma original.
	* **Implementación**: Raft es el protocolo preferido para implementaciones modernas debido a su claridad en la lógica de elección de líder y gestión de logs.
	* **Robustez**: Ambos garantizan la consistencia (Safety) y la disponibilidad (Liveness), pero Raft lo logra de forma más explícita y estructurada.

- **Uso en la industria**

	Los protocolos de consenso son el corazón de herramientas de infraestructura distribuida:

	- **etcd**: Utiliza Raft para mantener la consistencia del almacenamiento de claves-valores en Kubernetes.
	- **Consul**: Implementa Raft para la gestión de servicios y configuración distribuida.
	- **Apache ZooKeeper**: Aunque utiliza una variante propia llamada ZAB (ZooKeeper Atomic Broadcast), sus principios de diseño son comparables a Paxos.

**Ejemplo de verificacion en entornos Raft**

* Para consultar el estado del cluster en etcd (que usa Raft): **`etcdctl endpoint status --write-out table`**
