---
def-type: atomic
version: 1.0
id: def-consensus-protocols
status: estandar
category: algoritmos
contexto: sistemas-distribuidos
date: 2026-06-26
tags:
  - algoritmos/distribuidos
  - sistemas/distribuidos
  - consenso
aliases:
  - paxos
  - raft
  - protocolos de consenso
---
Los protocolos de consenso son el mecanismo fundamental en sistemas distribuidos para lograr la replicación de máquinas de estados. Permiten que un grupo de nodos distribuido acuerde un valor único o una secuencia de operaciones (log), incluso frente a fallos de hardware, particiones de red o mensajes perdidos.
#### Algoritmos de consenso

-  **Paxos:** Es el estándar académico y teórico para el consenso. Su diseño se centra en la corrección matemática bajo condiciones adversas. Históricamente, ha sido criticado por su alta complejidad de implementación y dificultad para auditar, ya que el flujo de mensajes puede resultar opaco en implementaciones reales.
-  **Raft:** Diseñado específicamente para ser comprensible y mantenible. Descompone el problema en subproblemas lógicos: elección de líder, replicación de log y seguridad. Es el protocolo preferido en arquitecturas modernas debido a su estructura clara de líder-seguidor.
#### Diferencias fundamentales

-  **Complejidad:** Raft gestiona el estado a través de un líder único (leader-based), lo que facilita el razonamiento sobre el sistema. Paxos, en su forma original, permite que múltiples propuestas converjan, lo que añade complejidad sin una jerarquía rígida.
-  **Implementación:** La arquitectura de Raft permite implementar comprobaciones de seguridad (safety) de manera más directa, lo que facilita el proceso de depuración en entornos de producción.
-  **Robustez:** Ambos garantizan la consistencia (safety) y la disponibilidad (liveness), pero Raft lo hace mediante un proceso de elección y replicación altamente estructurado
#### Uso en la industria

-  **etcd:** Utiliza Raft para mantener la consistencia del almacenamiento clave-valor en clústeres de Kubernetes.
-  **Consul:** Implementa Raft para la gestión de servicios, descubrimiento y configuración distribuida.
-  **Apache ZooKeeper:** Utiliza un protocolo propio denominado ZAB (ZooKeeper Atomic Broadcast), que comparte principios de diseño fundamentales con Paxos y otros algoritmos de consenso, enfocándose en un orden total de transacciones.
#### Ejemplo de verificación en entornos Raft

Para consultar el estado del clúster en etcd, utiliza el siguiente comando: `etcdctl endpoint status --write-out table`


