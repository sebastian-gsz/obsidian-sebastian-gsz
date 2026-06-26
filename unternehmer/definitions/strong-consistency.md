---
def-type: atomic
version: 1.0
id: def-consistencia-fuerte
status: estandar
category: concepto
contexto: bases-de-datos
date: 2026-06-26
tags:
  - arquitectura/sistemas-distribuidos
  - consistencia
  - bases-de-datos
aliases:
  - consistencia fuerte
  - strong consistency
---
La consistencia fuerte es un modelo en sistemas distribuidos que garantiza que, tras una operación de escritura exitosa, cualquier operación de lectura posterior devolverá obligatoriamente el valor más reciente en todos los nodos del sistema.

#### Características principales

-  **Priorización de integridad:** Asegura que el usuario siempre visualice la versión más reciente del dato, eliminando ambigüedades sobre el estado de la información.
-  **Sincronización global:** Requiere que las réplicas alcancen un consenso o confirmen la recepción de la escritura antes de finalizar la transacción, garantizando una visión uniforme en toda la infraestructura.
-  **Modelo intuitivo:** Facilita el desarrollo de aplicaciones al abstraer la complejidad de manejar conflictos de datos o versiones obsoletas en la lógica de negocio.

#### Compromisos

-  **Latencia elevada:** El tiempo de respuesta se incrementa debido al bloqueo necesario para coordinar la sincronización entre nodos.
-  **Disponibilidad reducida:** Ante el fallo o lentitud de un nodo, el sistema puede denegar escrituras para evitar inconsistencias, priorizando la precisión sobre la operatividad del servicio.
-  **Escalabilidad limitada:** La dificultad de escalar horizontalmente a grandes distancias geográficas es significativa, ya que el coste de comunicación y coordinación crece exponencialmente con la adición de nuevos nodos.
