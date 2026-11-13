---
def-type: atomic
version: 1.0
id: def-snmp
status: estandar
category: redes
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - snmp
  - monitoreo
  - redes
  - protocolos
aliases:
  - snmp
  - simple network management protocol
  - protocolo simple de administración de red
---
**SNMP** (_Simple Network Management Protocol_ — protocolo simple de administración de red) es un **protocolo de red utilizado para monitorear y administrar dispositivos en una red**: el estándar con el que un sistema central pregunta estado a switches, routers, servidores e impresoras — y con el que estos avisan cuando algo pasa.

#### Su Modelo de Tres Actores

-  **Manager (gestor)**: la central de monitoreo — pregunta, recolecta, alerta.
-  **Agent (agente)**: corre en cada dispositivo gestionado — responde y reporta.
-  **MIB/OID**: la base de datos de variables gestionadas — cada dato accesible tiene un **OID** (identificador jerárquico: uso de CPU, temperatura, tráfico por interfaz, uptime). El manager consulta OIDs concretos o recorre el árbol completo.

#### Sus Dos Modos de Operación

-  **Polling (consulta)**: el manager pregunta periódicamente — GET para leer valores, SET para cambiarlos (con cuidado: SET puede reconfigurar el dispositivo).
-  **Traps (avisos)**: el agente AVISA solo — "se cayó una interfaz", "me reinicié" — sin esperar a ser preguntado. El monitoreo maduro combina ambos: polling para tendencias, traps para la urgencia.

#### Versiones

-  **v1/v2c**: simples y universales — pero la "comunidad" (la contraseña de facto) viaja en texto claro.
-  **v3**: añade autenticación, cifrado y control de acceso — la única versión aceptable fuera de un laboratorio.

#### Diferencia Crítica: SNMP vs. NetFlow

-  **SNMP** ve el DISPOSITIVO: sus contadores y estado — CPU, memoria, interfaces up/down, errores por puerto.
-  **NetFlow** ve el TRÁFICO: las conversaciones que lo cruzan — quién habló con quién y cuánto.
-  Un dispositivo puede estar sano (SNMP: todo verde) mientras el tráfico que lo cruza es malicioso (NetFlow lo delata) — el monitoreo completo pregunta a ambos.

### Propósito fundamental

SNMP es el idioma de la gestión de dispositivos de red: un estándar mínimo que convierte cualquier equipo — de cualquier fabricante — en algo consultable y alertable por una central única — la capa de visibilidad operativa que hace administrable una red con cientos de nodos sin visitarlos uno por uno.
