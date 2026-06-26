---
def-type: atomic
version: 1.0
id: def-strong-consistency
status: estandar
category: conceptos-teóricos
contexto: teoría-de-sistemas
date: 2026-06-16
tags:
  - sistemas-distribuidos
  - bases-de-datos
  - arquitectura
  - transacciones
aliases:
  - consistencia-fuerte
  - high-consistency
  - strong-consistency
  - atomic-consistency
  - alta consistencia
  - high consistency
  - strong consistency
  - consistencia fuerte
---
La consistencia fuerte (o alta consistencia) es un modelo en sistemas distribuidos que garantiza que, tras una operación de escritura exitosa, todas las operaciones de lectura posteriores devolverán invariablemente el valor más reciente. Es considerado el estándar de oro en sistemas donde cualquier discrepancia en la lectura resulta inaceptable.

-  **Faceta técnica:** Se fundamenta en protocolos de consenso (como Paxos o Raft) o mecanismos de bloqueo (_locks_) que sincronizan el estado entre todos los nodos antes de confirmar cualquier operación.
-  **Relación con el Teorema CAP:** Ante una partición de red, los sistemas que priorizan la consistencia fuerte deben sacrificar la disponibilidad para prevenir la corrupción o divergencia de los datos.
-  **Impacto en el rendimiento:** El proceso de sincronización entre nodos introduce latencia adicional y reduce el _throughput_ (rendimiento) en comparación con modelos de consistencia eventual.
-  **Casos de uso críticos:**
    
    -  **Sistemas financieros:** Gestión de saldos bancarios o transacciones de valores.
    -  **Sistemas de inventario:** Prevención de sobreventa (_overselling_) en productos con disponibilidad limitada.
    -  **Sistemas de autenticación:** Propagación instantánea de cambios en credenciales o privilegios de usuario.
-  **Propósito fundamental:** Asegurar la integridad absoluta de los datos, priorizando la precisión sobre la velocidad de respuesta y la disponibilidad constante en entornos distribuidos.