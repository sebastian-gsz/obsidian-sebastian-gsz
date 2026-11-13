---
def-type: atomic
version: 1.0
id: def-network-overlap
status: estandar
category: redes
contexto: direccionamiento-ip
date: 2026-11-11
tags:
  - redes
  - ip
  - migracion
  - cloud
aliases:
  - solapamiento de redes
  - network overlap
  - superposición de redes
---
El **solapamiento de redes** ocurre cuando **dos redes lógicamente separadas — como la red local _on-premises_ y una nueva red en la nube — utilizan el mismo rango de direcciones IP**: si ambas usan `192.168.1.0/24`, los dispositivos de la nube y del centro de datos tendrán direcciones que, para un enrutador, son idénticas.

#### Las Consecuencias — Severas

-  **Fallo de comunicación**: los paquetes no sabrán a dónde ir — el enrutador no distingue entre un dispositivo en la nube y uno en la oficina si ambos tienen la misma IP.
-  **Problemas de enrutamiento**: las tablas de enrutamiento se rompen — imposible interconectar ambos entornos de forma confiable.
-  **Riesgos de seguridad**: complica las reglas de firewall y el aislamiento de segmentos — la lógica de las políticas se confunde cuando dos mundos comparten direcciones.

#### La Buena Práctica para Migrar a la Nube

La clave es **separación y planificación a largo plazo**:

-  **Tratar la nube como un nuevo "país" de redes**: no es una extensión de la red local — es un segmento con su propia soberanía, con un bloque de IP **único y dedicado**.
-  **Auditar y documentar la red actual**: radiografía completa de los rangos on-premises (`10.x`, `172.16.x`, `192.168.x`) — **la única forma de saber qué rangos evitar en la nube**.
-  **Usar una superred (_supernetting_) dedicada**: asignar un bloque grande y no usado — como `10.0.0.0/8` — para toda la infraestructura cloud: espacio para crear cientos de subredes sin riesgo.
-  **Diseñar para el futuro**: planificar para lo que se necesita hoy (clústeres, bases de datos) y reservar espacio amplio de crecimiento — la planificación de IP es un ejercicio de **ingeniería de la previsión**.

#### El Caso Práctico: Mismo Bloque, Subredes Distintas

El problema NO es que un bloque contenga a otro — es que dos segmentos usen las **mismas direcciones**:

-  ✅ **Válido**: Red local `10.0.1.0/24` + Red cloud `10.0.50.0/24` — ambas dentro de `10.0.0.0/8`, pero con direcciones **únicas y distintas** (el CIDR `/24` reserva los primeros 24 bits para red). El router local sabe que `10.0.50.50` está fuera de su `/24` y enruta por el Cloud Interconnect hacia GCP.
-  ❌ **Solapamiento**: Red local `10.0.1.0/24` + Red cloud `10.0.1.0/24` — al pedir `10.0.1.56`, el router no sabe si es un servidor en la nube o un equipo de la oficina: el dolor de cabeza monumental.
-  La regla final: usar el mismo bloque privado RFC 1918 es válido — siempre que las **subredes específicas** de cada entorno no se repitan.

### Propósito fundamental

El solapamiento de redes es el error de planificación que rompe la conexión local-nube: direcciones idénticas en dos mundos que el enrutador no puede distinguir — y su prevención es puro diseño: auditar lo que existe, dedicar bloques exclusivos a la nube y reservar espacio para el futuro — porque renumerar una red entera cuesta infinitamente más que planificarla bien una vez.
