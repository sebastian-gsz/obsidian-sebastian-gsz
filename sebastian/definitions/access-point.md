---
def-type: atomic
version: 1.0
id: def-access-point
status: estandar
category: redes
contexto: conectividad
date: 2026-11-11
tags:
  - redes
  - wifi
  - infraestructura
aliases:
  - punto de acceso
  - access point
  - ap wifi
---
Los **puntos de acceso** (_Access Points_ — AP) actúan como **centros de comunicación para usuarios en dispositivos inalámbricos**: son el puente que conecta equipos WiFi con la red cableada — pueden ser dispositivos independientes o **integrarse en un enrutador** (como el AP que trae dentro el router de casa) — y facilitan la conexión inalámbrica en las redes.

#### Qué Hace un AP

-  Convierte la porción inalámbrica de una LAN: emite el SSID (el nombre de la red) y gestiona la asociación de clientes — cada teléfono, laptop o sensor se comunica con él por radio.
-  **Conecta WiFi con el cable**: todo lo que recibe por el aire lo pasa al switch/red cableada (y viceversa) — sin AP, los dispositivos inalámbricos quedan fuera de la red.
-  En redes empresariales, **múltiples APs** cubren un edificio — con controladores que gestionan itinerancia (roaming): el usuario camina y su conexión pasa de un AP al otro sin notarlo.

#### Dónde Vive

-  **Integrado en el enrutador**: el caso doméstico — router + AP + switch en una caja.
-  **Independiente**: en empresas, APs dedicados gestionados centralmente, con política, MFA y monitoreo unificados — la red inalámbrica corporativa.

#### Diferencia Crítica: Access Point vs. Router

-  El **AP** solo traduce aire↔cable dentro de UNA red: no enruta, no asigna IPs, no decide rutas.
-  El **router** conecta redes distintas (LAN↔WAN) y enruta paquetes por IP — el AP extiende la red local al aire; el router la une con el mundo.
-  Por eso la caja doméstica es "router WiFi": un router que incluye el AP — y por eso añadir APs a una red existente expande la cobertura sin tocar el enrutamiento.

#### Nota de Seguridad

Un AP es superficie de ataque directa: SSID, cifrado (WPA2/WPA3) y acceso de invitados separado son sus decisiones básicas — un AP corporativo mal configurado es una LAN interna con puertas invisibles al aire libre.

### Propósito fundamental

El punto de acceso es el puente entre el aire y el cable: convierte la red local en red inalámbrica — gestión de asociaciones, cobertura e itinerancia — y es la pieza que hace que "estar conectado" signifique poder moverse sin desconectarse nunca.
