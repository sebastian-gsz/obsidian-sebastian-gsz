---
def-type: atomic
aliases:
  - Autonomous System Number
  - Sistema Autónomo
  - ASN
tags:
  - redes
  - bgp
  - enrutamiento
  - internet
category: infraestructura-de-red
contexto: redes-de-computadoras
version: 1.2
date: 2026-06-16
status: estandar
---
Un Sistema Autónomo (AS) es una agrupación de una o más redes IP bajo una única entidad administrativa que opera bajo una política de enrutamiento clara e independiente del resto de Internet.

* **Faceta de infraestructura y redes**: Funciona como una red autónoma con su propia gobernanza, donde la entidad decide qué rutas prefiere para el tráfico interno y cómo se comunica con redes externas. Es la unidad fundamental de construcción de Internet a gran escala.
* **Faceta de identificadores (Número de ASN)**: Cada AS se identifica mediante un número único (ASN), asignado globalmente por los Registros Regionales de Internet (RIRs) para los sistemas públicos, o configurado localmente para uso privado. Este número actúa como un identificador único en la tabla de enrutamiento global.
* **Faceta de comunicación (Protocolo BGP)**: Los sistemas autónomos utilizan el protocolo BGP (Border Gateway Protocol) como el "lenguaje" estándar para intercambiar información de alcanzabilidad. A través de este, los ASN anuncian qué rangos de direcciones IP (prefijos) son capaces de gestionar, permitiendo que el tráfico fluya correctamente entre las diversas redes que componen Internet.
* **Propósito**: Permitir la escalabilidad y la descentralización de la gestión de rutas a nivel global, facilitando que el tráfico encuentre el camino más eficiente entre nodos de diferentes administraciones.