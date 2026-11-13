---
def-type: atomic
version: 1.0
id: def-netflow
status: estandar
category: redes
contexto: analisis-de-trafico
date: 2026-11-11
tags:
  - netflow
  - ipfix
  - monitoreo
  - redes
aliases:
  - netflow
  - ipfix
  - flujo de red
---
**NetFlow e IPFIX** son **protocolos de recopilación de información de tráfico de red** que permiten a los administradores **monitorear y analizar el tráfico**: recopilan información sobre los paquetes que atraviesan un dispositivo de red — dirección IP de origen y destino, puerto de origen y destino, protocolo y tamaño — sin capturar los paquetes completos.

#### Cómo Funciona

-  Un **exporter** (router, switch, firewall) observa cada conversación que lo cruza y la resume como un **registro de flujo** (_flow record_): quién habló con quién, por qué puertos, con qué protocolo, cuántos bytes y paquetes, durante cuánto tiempo.
-  Los registros se envían a un **collector** que los almacena y analiza — el resultado es un libro de contabilidad de todo el tráfico, sin el peso de guardar los paquetes enteros.
-  **IPFIX** (_IP Flow Information Export_) es la estandarización abierta de la idea: NetFlow nació como tecnología de Cisco; IPFIX es su versión estándar IETF — mismo concepto, formato universal.

#### Para Qué Sirve

-  **Monitoreo y capacidad**: qué conversaciones consumen el ancho de banda, entre qué hosts, a qué horas.
-  **Detección de anomalías**: un host que de pronto habla con miles de destinos (escaneo), flujos anómalos hacia un país inusual (exfiltración) — los patrones delatan.
-  **Forense ligera**: reconstruir qué pasó en la red hace semanas con registros resumidos — algo imposible si no guardaste los paquetes.

#### Diferencia Crítica: NetFlow/IPFIX vs. Captura de Paquetes

-  La **captura** (PCAP — como hace netsniff-ng) guarda los **paquetes enteros**: evidencia completa, coste de almacenamiento brutal, ventana de retención corta.
-  **NetFlow/IPFIX** guardan el **resumen por conversación**: una fracción del espacio, retención de meses, respuesta a "¿quién habló con quién y cuánto?" — pero no al contenido del mensaje.
-  El diseño maduro combina ambos: NetFlow siempre para el panorama y el histórico; capturas selectivas y a demanda cuando se necesita el contenido.

### Propósito fundamental

NetFlow e IPFIX son el libro mayor del tráfico de red: convierten millones de paquetes en registros de flujo legibles — quién, con quién, cuánto y cuándo — la visibilidad económica que sostiene el monitoreo, la planificación de capacidad y la detección de anomalías a escala que la captura de paquetes no puede pagar.
