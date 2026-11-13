---
def-type: atomic
version: 1.0
id: def-mqtt
status: estandar
category: protocolos-de-red
contexto: internet-de-las-cosas
date: 2026-11-11
tags:
  - mqtt
  - iot
  - protocolos
  - publish-subscribe
aliases:
  - mqtt
  - message queuing telemetry transport
  - mosquitto
---
**MQTT** (_Message Queuing Telemetry Transport_) es un **protocolo de comunicación liviano basado en TCP/IP, ideal para sistemas donde el ancho de banda o la energía son limitados**: nació para telemetría de sensores y es hoy el estándar de facto del Internet de las Cosas — mensajes mínimos entre dispositivos que duran años con una batería.

#### El Modelo Publish/Subscribe

-  **Publisher** (publicador): envía mensajes a un "tema" o canal específico (`casa/salon/temperatura`) — no sabe quién los leerá.
-  **Subscriber** (suscriptor): recibe los mensajes de los temas a los que se ha suscrito — no sabe quién los publicó.
-  **Broker** (el intermediario, por ejemplo **Mosquitto**): gestiona las publicaciones y **distribuye cada mensaje a todos los suscriptores interesados** — productores y consumidores nunca se conocen entre sí, solo hablan con el broker.
-  Las **QoS** (niveles de calidad de servicio 0, 1 y 2) permiten elegir entre mensaje veloz pero descartable, garantizado o garantizado sin duplicados — según lo que tolere el caso.

#### Usos Comunes

1.  **Internet de las Cosas (IoT)**: sensores que envían temperatura, humedad o movimiento; actuadores que reciben comandos (encender luces).
2.  **Automatización del hogar**: comunicación entre termostatos, cámaras e interruptores inteligentes.
3.  **Redes de sensores**: dispositivos que reportan periódicamente a una base de datos central.
4.  **Aplicaciones en la nube**: publicación de datos desde dispositivos locales hacia servicios cloud.

#### Diferencia Crítica: MQTT vs. HTTP

-  **HTTP** es petición-respuesta: el cliente pregunta, el servidor responde — cabeceras pesadas, consumo ineficiente para un sensor que reporta cada minuto con batería propia.
-  **MQTT** es publish/subscribe push: cabeceras de pocos bytes, conexión persistente, el dato llega sin que nadie lo pida — y el broker reparte a todos los interesados de golpe.
-  Para un sensor con batería y señal débil, HTTP gasta el presupuesto energético en protocolo; MQTT lo dedica al dato — por eso IoT habla MQTT.

### Propósito fundamental

MQTT es el mensajero mínimo del Internet de las Cosas: un protocolo que pesa casi nada pero reparte telemetría a quien la necesita — publishers y subscribers desacoplados por un broker que absorbe la complejidad — la infraestructura silenciosa detrás de los sensores, los hogares inteligentes y las granjas de dispositivos que reportan sin parar.
