---
def-type: atomic
version: 1.0
id: def-vlan
status: estandar
category: redes
contexto: topologia-de-redes
date: 2026-11-12
tags:
  - vlan
  - redes
  - segmentacion
aliases:
  - vlan
  - red de área local virtual
  - virtual lan
---
Una **VLAN** (_Virtual LAN_ — red de área local virtual) es una **agrupación lógica de estaciones de trabajo, servidores y otros dispositivos que pueden no estar físicamente en el mismo lugar, pero que la red trata como una LAN propia**: la segmentación lógica sobre la misma infraestructura física — varias redes en un solo cable.

#### Qué Resuelve

-  **Segmentación sin cablear de nuevo**: separar ventas, servidores e invitados en redes distintas SIN comprar un switch por grupo — el mismo switch aloja varias VLANs lógicas.
-  **Dominios de broadcast separados**: cada VLAN es un **dominio de broadcast independiente** — el ruido de una no golpea a las otras, y el tráfico entre VLANs pasa por enrutamiento (donde puede filtrarse y controlarse).
-  **Seguridad por diseño**: el tráfico entre VLANs cruza el enrutador — punto donde aplicar políticas: los invitados no tocan los servidores aunque compartan el switch.

#### ¿Qué es una SVI?

**SVI = _Switched Virtual Interface_** (interfaz virtual de switch): una **interfaz lógica dentro del switch que pertenece a una VLAN** y que permite:

-  Asignar una **dirección IP al switch** (que de otro modo es solo un conmutador sin identidad propia).
-  Administrar el switch por **Telnet/SSH**.
-  Hacer **routing entre VLANs** — si el switch es de capa 3 (switch L3), las SVIs son los puertas de cada VLAN y él mismo enruta entre ellas.

#### ¿Puedo Usar la Misma Red en Dos VLANs Distintas?

No — y la razón es estructural:

-  Cada VLAN es un **dominio de broadcast independiente**.
-  Cada dominio de broadcast debe tener **su propio rango IP** — si repites la red (`192.168.1.0/24` en ambas), los dispositivos no sabrán a qué VLAN pertenece cada IP, y los routers **no pueden enrutar entre dos redes idénticas**.
-  La regla conecta con el solapamiento de redes: la misma prohibición entre entornos aplicada dentro del switch — IPs únicas por dominio, sin excepción.

#### Diferencia Crítica: VLAN vs. Subred

-  La **VLAN** es una división de **capa 2** (switches): separa dominios de broadcast y tráfico físico.
-  La **subred** es una división de **capa 3** (IP): agrupa direcciones enruteables.
-  La práctica estándar: una VLAN por subred — la VLAN segmenta el cable; la subred organiza las direcciones — alineadas pero de capas distintas.

### Propósito fundamental

La VLAN es la segmentación lógica sobre el cable compartido: redes independientes, dominios de broadcast separados y seguridad entre grupos sin tirar un cable más — la tecnología que hace que un solo switch sea muchas redes, y que el tráfico entre ellas pase SIEMPRE por donde se le puede poner una regla.
