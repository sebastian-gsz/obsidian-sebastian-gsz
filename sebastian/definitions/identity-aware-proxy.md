---
def-type: atomic
version: 1.0
id: def-iap
status: estandar
category: cloud-computing
contexto: control-de-acceso
date: 2026-11-11
tags:
  - gcp
  - zero-trust
  - acceso
  - seguridad
aliases:
  - identity-aware proxy
  - iap
  - proxy con reconocimiento de identidad
---
**IAP** (_Identity-Aware Proxy_ — proxy con reconocimiento de identidad) es un **servicio de Google Cloud que actúa como un portero de seguridad para tus aplicaciones y máquinas virtuales**: centraliza el acceso de modo que nadie llega a la aplicación sin que antes se haya verificado **quién es y en qué contexto** — identidad antes que red.

#### Cómo Funciona

-  El usuario ya no accede directamente a la aplicación: pasa por **IAP**, que autentica su identidad (integrado con la gestión de identidades de Google Cloud) y evalúa el **contexto** de la petición (quién es, desde qué dispositivo, qué rol tiene).
-  Solo si la identidad y el contexto cumplen la política, IAP **reenvía la petición** a la aplicación — que nunca necesita estar expuesta al público.
-  La verificación es **por petición**, no un túnel que se abre una vez y confía para siempre.

#### Qué Elimina del Diseño Tradicional

-  **VPNs para acceso administrativo**: el administrador llega a la app por IAP con su identidad, no por un túnel de red.
-  **Reglas de firewall por IP**: ya no hace falta confiar en "la IP del oficinista" — se confía en la identidad verificada.
-  **Confianza por ubicación de red**: estar "dentro de la red" ya no concede nada — el paradigma **zero-trust**: nunca confiar, siempre verificar.

#### Diferencia Crítica: IAP vs. VPN

-  La **VPN** entrega a quien se conecta el **acceso a la red**: detrás del túnel, muchas cosas quedan alcanzables — si la credencial de la VPN se filtra, el atacante camina por la red.
-  **IAP** entrega acceso **a la aplicación concreta y solo si la identidad lo justifica**: no hay red que recorrer, no hay túnel que reutilizar.
-  Es la misma filosofía de la gestión de identidad y acceso elevada al perímetro: la identidad es el nuevo firewall.

### Propósito fundamental

IAP materializa el modelo zero-trust en el acceso a aplicaciones: convierte la identidad verificada por petición en la condición de entrada, elimina la confianza ciega en la red y reduce la superficie expuesta a cero — el portero que pregunta quién eres en cada visita, en lugar de darte una llave de la casa.
