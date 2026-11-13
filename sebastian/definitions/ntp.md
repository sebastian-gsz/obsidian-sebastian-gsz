---
def-type: atomic
version: 1.0
id: def-ntp
status: estandar
category: protocolos-de-red
contexto: systemtechnik
date: 2026-11-11
tags:
  - protocolos
  - red
  - sincronizacion
aliases:
  - protocolo de tiempo de red
  - network time protocol
---
**NTP** es el protocolo que sincroniza los relojes de los dispositivos de una red: el cliente consulta la hora actual a un servidor NTP —que a su vez obtiene la hora de una fuente de referencia fiable, como un reloj atómico— y ajusta su reloj interno a ese valor.

### Funcionamiento

-  **Consulta y ajuste**: El cliente pregunta al servidor por la hora y la ajusta a su reloj interno.
-  **Ajuste suavizado**: La corrección del reloj no es instantánea, sino que se aplica gradualmente hacia las fuentes de tiempo de referencia seleccionadas.
-  **Transporte**: Normalmente NTP utiliza UDP como protocolo de transporte; el puerto UDP conocido para el tráfico NTP es el ``123``.

### Depuración con Wireshark

-  Mostrar solo el tráfico basado en NTP: **``ntp``**
-  No se pueden filtrar directamente los protocolos NTP durante la captura; se filtra por el puerto conocido: **``udp port 123``**

### Propósito fundamental

NTP garantiza que todos los equipos de una red compartan una hora coherente, condición necesaria para autenticación, logs correlacionados y protocolos sensibles al tiempo.
