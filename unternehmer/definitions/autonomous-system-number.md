---
def-type: atomic
version: 1.0
id: def-autonomous-system
status: estandar
category: infraestructura-de-red
contexto: redes-de-computadoras
date: 2026-06-16
tags:
  - redes
  - bgp
  - enrutamiento
  - internet
aliases:
  - autonomous system number
  - sistema autónomo
  - asn
  - autonomous system
  - sistema autónomo de red
---
Un Sistema Autónomo (AS) es una agrupación de una o más redes IP bajo una única entidad administrativa (como un ISP, una gran corporación o una institución académica) que opera bajo una política de enrutamiento clara e independiente.

-  **Identificador (ASN):** Cada AS se identifica mediante un número único (ASN) asignado globalmente por los Registros Regionales de Internet (RIRs). Este identificador es esencial para el enrutamiento global.
-  **Protocolo de comunicación (BGP):** Los sistemas autónomos utilizan el _Border Gateway Protocol_ (BGP) para intercambiar información de alcanzabilidad entre ellos, anunciando los prefijos IP que cada AS gestiona.
-  **Componentes de la arquitectura:**
    
    -  **Gobernanza interna:** El AS define sus propias métricas y políticas de enrutamiento interno.
    -  **Escalabilidad global:** Permite la descentralización de Internet, ya que los nodos no necesitan conocer toda la topología, solo el "siguiente salto" hacia el ASN de destino
-  **Propósito:** Proporcionar una estructura jerárquica y eficiente que permita la comunicación entre redes de diferentes administraciones, garantizando que el tráfico encuentre el camino óptimo hacia su destino.