---
def-type: atomic
version: 1.0
id: def-socket
status: estandar
category: redes
contexto: transporte-de-datos
date: 2026-11-11
tags:
  - redes
  - socket
  - programacion
aliases:
  - socket
  - sockets
  - enchufe de red
---
Un **socket** es el **"enchufe" virtual que permite que dos programas se comuniquen a través de una red**: la **combinación de una dirección IP (el edificio) y un puerto (la puerta específica)** — y cuando ambos extremos se conectan, el socket es el canal activo por el que fluyen los datos.

#### La Analogía del Teléfono

-  La **IP** es el número de teléfono del edificio — te lleva al lugar correcto.
-  El **puerto** es la extensión de la oficina específica dentro del edificio — te lleva al servicio correcto.
-  El **socket** es la **conexión activa** entre tu auricular y el de la otra persona: **mientras el socket esté abierto, fluyen los datos**.
-  Un extremo queda identificado por IP:puerto — el socket completo de la conversación es el PAR: tu IP:puerto ←→ su IP:puerto.

#### Cómo se Abre

-  El cliente abre un socket desde su IP local y un **puerto efímero** (aleatorio, por ejemplo 51423).
-  Se conecta al socket del servidor — por ejemplo `192.168.1.10:22` (SSH) — cuyo servicio está "escuchando" en ese puerto.
-  Por ese socket viaja todo el intercambio — cifrado o no según el protocolo que lo recorra.
-  En el desarrollo: el socket es la API del sistema operativo para hablar por red — el programa escucha en un socket (bind/listen/accept) o se conecta a uno (connect), y lee y escribe como si fuera un archivo.

#### Tipos de Sockets

-  **TCP sockets**: orientados a la conexión — como una llamada telefónica: te aseguras de que el otro recibió el mensaje. Es lo que usa SSH, HTTP, y toda comunicación que exige garantía.
-  **UDP sockets**: sin conexión — como lanzar volantes desde un avión: rápidos y sin garantía de llegada. Se usa mucho en streaming, juegos y DNS.

#### Diferencia Crítica: Socket vs. Puerto

-  El **puerto** es el número estático: la puerta — `22` es SSH, siempre.
-  El **socket** es la CONEXIÓN activa usando esa puerta: la conversación concreta entre un cliente concreto y el servicio.
-  Miles de conexiones pueden pasar por el MISMO puerto del servidor — cada una es un socket distinto (diferenciado por el par IP:puerto de cada lado). El puerto es la infraestructura; el socket, la llamada.

### Propósito fundamental

El socket es la conexión activa que convierte direcciones en conversaciones: IP y puerto identifican; el socket TRANSMITE — el enchufe virtual por el que dos programas de cualquier parte del mundo se hablan, ya sea con la garantía de TCP o la velocidad de UDP.
