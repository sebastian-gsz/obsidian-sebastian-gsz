---
def-type: atomic
version: 1.0
id: def-stateless-firewall
status: estandar
category: ciberseguridad
contexto: defensa-de-red
date: 2026-11-11
tags:
  - ciberseguridad
  - redes
  - firewall
aliases:
  - firewall sin estado
  - firewall de filtrado de paquetes
  - packet filtering firewall
---
Un **firewall sin estado** (_stateless firewall_ o firewall de filtrado de paquetes) es un tipo de firewall que **examina cada paquete de datos individualmente, sin considerar el contexto de la conexión ni el estado de la sesión**: la decisión depende únicamente de las reglas de filtrado establecidas y de los campos del propio paquete.

#### Funcionamiento

-  El firewall evalúa cada paquete contra la **lista de reglas** (ACL): origen, destino, puerto, protocolo y dirección.
-  Si el paquete **cumple una regla**, se permite; si **no la cumple o es sospechoso**, se bloquea.
-  Cada paquete pasa la evaluación completo desde cero: el firewall no recuerda nada entre paquetes — ni siquiera que el mismo flujo le envió uno hace un milisegundo.

#### Ventajas

-  **Simplicidad**: reglas fáciles de escribir, auditar y entender; ideal para ACLs de routers y controles básicos.
-  **Menos sobrecarga**: sin tabla de estado que mantener, es rápido y consume pocos recursos — útil en enlaces de altísimo caudal o hardware modesto.

#### Diferencia Crítica: Sin estado vs. Con estado

-  La ceguera de contexto es su debilidad estructural: no distingue un paquete de **respuesta** legítima de uno **falsificado** que imita sus cabeceras (flags TCP) para colarse.
-  Tampoco puede hacer dinámico el filtrado de protocolos que abren puertos nuevos en plena sesión (FTP activo): exige dejar rangos enteros abiertos "por si acaso".
-  Por eso los firewalls con estado lo reemplazaron en los perímetros; sobrevive como capa complementaria (ACLs en routers y switches) donde la simpleza es la virtud.

### Propósito fundamental

El firewall sin estado es el filtrado elemental de paquetes: rápido, simple y predecible, pero ciego a las conversaciones — útil como primera línea o control interno, y como recordatorio permanente de que filtrar sin memoria es filtrar a medias.
