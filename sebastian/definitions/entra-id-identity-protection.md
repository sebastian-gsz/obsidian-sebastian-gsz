---
def-type: atomic
version: 1.0
id: def-entra-id-identity-protection
status: estandar
category: cloud-computing
contexto: control-de-acceso
date: 2026-11-11
tags:
  - microsoft
  - entra
  - identidades
  - zero-trust
aliases:
  - entra id identity protection
  - identity protection
  - azure ad identity protection
---
**Microsoft Entra ID Identity Protection** se enfoca en **detectar actividades de riesgo y amenazas relacionadas con tus identidades en la nube** (Azure AD / Entra ID): vigila cada inicio de sesión y cada uso de cuenta buscando señales de compromiso — el radar de las identidades, el activo que hoy es el objetivo principal de los atacantes.

#### Qué Detecta

-  **Riesgos de inicio de sesión**: _impossible travel_ (login simultáneo desde continentes distintos), IPs anónimas o de botnet, hosts infectados conocidos, contraseña filtrada en filtraciones públicas.
-  **Riesgo de usuario**: comportamiento anómalo acumulado de una cuenta — el usuario que de pronto actúa como otro.
-  **Respuesta automática**: políticas basadas en riesgo — exigir MFA al login arriesgado, forzar cambio de contraseña, bloquear el acceso o pedir re-registro — el riesgo no solo se reporta: se actúa en el momento.

#### Cómo se Integra

Con las políticas de **acceso condicional** de Entra ID: la decisión de permitir un login pasa por "¿quién es, desde dónde, con qué riesgo?" — la materialización del zero-trust a nivel de identidad, complementando a la gestión de identidad y acceso (IAM) que define qué puede hacer cada identidad una vez dentro.

#### Diferencia Crítica: Entra ID Protection vs. Defender for Endpoint

-  **Entra ID Identity Protection** cubre las **identidades en la nube**: los logins y el uso de cuentas de Entra ID.
-  **MDE** cubre los **dispositivos y la red local**: endpoints, servidores, controladores de dominio on-premises.
-  Ambas trabajan para detectar el uso sospechoso o el compromiso de cuentas **en sus respectivos ámbitos** — el par que cubre identidad digital en los dos mundos del híbrido moderno.

#### Diferencia Crítica: Identity Protection vs. IAM

-  El **IAM** administra: crea identidades, define roles, gestiona el ciclo de vida — la estructura del acceso.
-  **Identity Protection** vigila: detecta cuando una identidad legítima se comporta de forma ilegítima — la detección sobre la estructura.
-  Una identidad mal administrada (exceso de permisos) y una identidad comprometida (uso anómalo) son problemas distintos que estas dos capas atacan por separado.

### Propósito fundamental

Entra ID Identity Protection responde a la realidad de que la identidad es el nuevo perímetro: cuando el atacante ya no rompe la red sino que entra con una contraseña robada, lo que salva la organización es detectar el uso anómalo en el momento del login — y actuar sobre ese riesgo automáticamente, no mañana.
