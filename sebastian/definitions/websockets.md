---
def-type: atomic
version: 1.0
id: def-websockets
status: estandar
category: protocolos-de-red
contexto: web
date: 2026-11-12
tags:
  - websockets
  - web
  - protocolos
  - tiempo-real
aliases:
  - websockets
  - websocket
  - ws protocol
---
**WebSockets** es un protocolo que permite una **comunicación bidireccional, persistente y de baja latencia entre un cliente (navegador) y un servidor**: a diferencia de **HTTP** — donde el cliente debe iniciar cada solicitud — el WebSocket **crea una conexión abierta y continua** en la que los datos fluyen en ambos sentidos sin nuevas peticiones.

#### Qué Cambia Respecto a HTTP

-  **HTTP** es petición-respuesta: el cliente pregunta, el servidor responde, se cierra — para recibir novedades, el cliente tiene que preguntar de nuevo (polling) o fingir persistencia con _long polling_.
-  **WebSocket** abre la conexión UNA vez (handshake inicial sobre HTTP, luego upgrade a `ws://` o `wss://`) y de ahí en adelante **ambos lados hablan cuando quieran** — el servidor puede EMPUJAR datos sin que nadie los pida.
-  El resultado: latencia mínima y cero sobrecarga de pedir — ideal para **aplicaciones que necesitan actualizaciones en tiempo real**: chats, juegos en línea o paneles de control en vivo.

#### Dónde Brilla

-  **Chats y mensajería**: el mensaje del otro lado llega al instante, sin refrescar.
-  **Juegos en línea y colaboración**: cada movimiento y cursor en vivo, sin latencia de polling.
-  **Paneles de control en vivo**: métricas, cotizaciones, monitoreo — el dashboard que respira sin recargar.
-  **Notificaciones push** desde el servidor hacia el navegador — el canal que HTTP nunca tuvo.

#### Diferencia Crítica: WebSockets vs. HTTP

-  **HTTP**: uni-direccional por transacción (el cliente siempre inicia), cada petición autónoma, sin estado.
-  **WebSocket**: bidireccional, persistente, con estado de conexión — la conversación telefónica frente al intercambio de cartas.
-  La elección: solicitudes puntuales y cacheables → HTTP; flujo continuo en ambos sentidos → WebSocket — y en la web moderna conviven: HTTP para cargar, WebSocket para vivir.

#### Diferencia Crítica: WebSocket vs. MQTT

-  Ambos mantienen canal persistente con push: el **WebSocket** es el tubo (transporte); **MQTT** es el modelo pub/sub (contenido y distribución).
-  De hecho se combinan: MQTT sobre WebSockets — el mensajero liviano del IoT usando el túnel que los navegadores aceptan.

### Propósito fundamental

WebSockets es el canal permanente de la web: una conexión abierta, bidireccional y de baja latencia que convierte el navegador de espectador en participante — la pieza que hizo posibles los chats, juegos y paneles en vivo sin trucos de polling, donde el servidor por fin puede hablar primero.
