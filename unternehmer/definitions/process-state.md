---
def-type: atomic
version: 1.0
id: def-estado-proceso
status: estandar
category: sistemas-operativos
contexto: computación
date: 2026-06-21
tags:
  - procesos
  - ejecución
  - sistemas-operativos
  - estados
aliases:
  - estado de proceso
  - process state
  - ciclo de vida del proceso
  - process lifecycle
---
El estado de un proceso es el indicador dinámico de su posición dentro del ciclo de vida gestionado por el planificador (scheduler) del sistema operativo. Estos estados permiten al SO administrar de manera eficiente el uso de la CPU y la memoria, priorizando las tareas que están listas para ejecutarse frente a aquellas que aguardan recursos.

#### Estados clave en la gestión de tareas

- **En cola (Queued/Pending):** El proceso ha sido creado o solicitado, pero espera su turno en la cola de ejecución. Se encuentra cargado en memoria esperando a que el planificador le asigne ciclos de CPU.
- **En ejecución (In progress/Running):** El proceso tiene el control de la CPU. Sus instrucciones están siendo procesadas activamente por el hardware.
- **En pausa (Paused/Suspended):** El proceso se encuentra detenido temporalmente. Su contexto (registros, contador de programa, pila) se guarda para permitir su reanudación exacta en el futuro sin pérdida de datos.
- **Completado (Completed/Succeeded):** El proceso ha finalizado su ejecución exitosamente. Ha liberado todos los recursos que tenía asignados (memoria, descriptores de archivos, puertos).
- **Fallido (Failed/Error):** El proceso terminó de manera abrupta debido a una excepción, un error de segmentación o una lógica fallida. A menudo genera un "core dump" para su análisis posterior.
- **Cancelado (Cancelled):** El proceso fue terminado prematuramente por una señal externa, ya sea por intervención directa del usuario (ej. comando kill) o por una política de administración del sistema.
- **Tiempo agotado (Timed out):** El sistema fuerza la terminación del proceso porque ha excedido un presupuesto de tiempo o cuota de recursos predefinida, garantizando que un proceso "colgado" no bloquee permanentemente el sistema.

#### Gestión y observabilidad

En sistemas operativos tipo Unix/Linux, la transición de estos estados puede ser monitorizada mediante comandos que consultan la tabla de procesos del kernel. Por ejemplo, para identificar procesos en estado de espera (sleep) o interrumpibles en comparación con los activos: `ps aux --sort=-%cpu`

