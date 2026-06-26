---
def-type: atomic
version: 1.0
id: def-hub
status: estandar
category: dispositivos-de-red
contexto: arquitectura-de-redes
date: 2026-06-19
tags:
  - redes
  - hardware
  - lan
aliases:
  - hub
  - concentrador de red
  - concentrador
  - concentrator
  - network concentrator
---
El hub (o concentrador) es un dispositivo de red que opera en la capa física (Capa 1 del modelo OSI). Actúa como un punto de conexión central, recibiendo tramas de datos y retransmitiéndolas a todos los puertos conectados.

-  **Funcionamiento:** Opera exclusivamente mediante difusión (_broadcasting_). Al carecer de inteligencia para identificar direcciones físicas (MAC), el dispositivo es incapaz de filtrar el tráfico hacia un destino específico.
-  **Impacto operativo:** Genera tráfico innecesario dentro de la red, ya que todos los dispositivos conectados procesan la información, independientemente de si son el destino real.
-  **Gestión de colisiones:** Su arquitectura propicia la ocurrencia de colisiones de datos, lo que degrada el rendimiento de la comunicación al compartir el mismo dominio de colisión.
-  **Uso:** Su implementación está limitada a redes domésticas o entornos pequeños y sencillos donde el rendimiento y la seguridad no representan factores críticos.