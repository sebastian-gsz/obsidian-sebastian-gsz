---
def-type: atomic
version: 1.0
id: def-serverless
status: estandar
category: cloud-computing
contexto: computacion-en-la-nube
date: 2026-11-11
tags:
  - serverless
  - cloud
  - arquitectura
aliases:
  - serverless
  - sin servidor
  - funciones serverless
---
**Serverless** es un **modelo de computación en la nube en el que el desarrollo y la ejecución de aplicaciones se realiza sin necesidad de gestionar la infraestructura del servidor**. Aunque el nombre sugiere que no hay servidores involucrados — **en realidad los servidores existen, pero son completamente gestionados por el proveedor de la nube**: tú solo escribes código; el resto respira solo.

#### Sus Características

-  **Gestión automática de infraestructura**: el proveedor se encarga de configuración, mantenimiento y escalabilidad de los servidores — tú no ves una máquina en tu vida.
-  **Facturación basada en uso**: se paga solo por el **tiempo de ejecución y los recursos utilizados** — sin costos fijos por servidores apagados o sobredimensionados.
-  **Escalabilidad automática**: la plataforma absorbe los picos de carga **sin intervención manual** — de 0 a millones de invocaciones sin tocar nada.
-  **Foco en el desarrollo**: el desarrollador escribe funciones o microservicios; nada de servidores que parchear ni sistemas que cuidar.
-  **Desarrollo basado en eventos**: las funciones se ejecutan **en respuesta a eventos** — una petición HTTP, un cambio en la base de datos, un mensaje en cola.

#### Ventajas

-  **Reducción de costos**: pagas por ejecución — nada por recursos ociosos.
-  **Rápido tiempo de desarrollo**: implementar nuevas funcionalidades es desplegar código, no aprovisionar máquinas.
-  **Escalabilidad sencilla**: variaciones de carga manejadas automáticamente.
-  **Mantenimiento reducido**: sin infraestructura que gestionar, el esfuerzo se concentra en el producto.

#### Desventajas

-  **Latencia en el arranque (_cold start_)**: una función invocada tras mucho tiempo de reposo tarda en arrancar — puede afectar el rendimiento de la primera petición.
-  **Limitaciones de ejecución**: límites de tiempo y recursos — problemáticos para tareas largas o complejas.
-  **Dependencia del proveedor** (_vendor lock-in_): la infraestructura es suya — migrar es reescribir; el riesgo de bloqueo es real.
-  **Control limitado**: sin acceso a la infraestructura, hay menos opciones de personalización y optimización.

#### Diferencia Crítica: Serverless vs. Contenedores

-  Los **contenedores** (Docker/Kubernetes) siguen gestionando infraestructura — tuya o gestionada: tú controlas el entorno, el escalado y el runtime.
-  **Serverless** elimina incluso eso: código + evento, y el proveedor hace todo lo demás — máxima abstracción, máxima dependencia.
-  La elección por caso: trabajo por eventos, carga irregular y equipos pequeños → serverless; control del entorno, cargas constantes y portabilidad → contenedores.

### Propósito fundamental

Serverless es el grado máximo de abstracción en la nube: los servidores existen, pero dejan de ser tu problema — pagas por la ejecución de tu código y el proveedor respira por ti — el modelo que convierte "desplegar una aplicación" en "subir una función", con el precio de confiar toda la infraestructura a las manos de un solo proveedor.
