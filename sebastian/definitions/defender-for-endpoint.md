---
def-type: atomic
version: 1.0
id: def-mde
status: estandar
category: cloud-computing
contexto: defensa-corporativa
date: 2026-11-11
tags:
  - microsoft
  - defender
  - edr
  - endpoints
aliases:
  - microsoft defender for endpoint
  - defender for endpoint
  - mde
---
**Microsoft Defender for Endpoint (MDE)** es la **principal línea de defensa en los dispositivos y servidores** de la organización: un EDR (_Endpoint Detection and Response_) que puede **prevenir la ejecución inicial de un exploit o malware y, si logra ejecutarse, detectar y bloquear su comunicación hacia el servidor de Comando y Control**. Además protege los **controladores de dominio locales**, detectando ataques dirigidos a identidades en la red _on-premises_.

#### Qué Hace en Cada Momento del Ataque

-  **Antes de la ejecución**: la superficie de ataque se reduce — bloqueo de exploits, protección de red, control de aplicaciones.
-  **En la ejecución**: el comportamiento del proceso se evalúa en tiempo real — un exploit que intenta correr o un malware que se instala se bloquean por señal, no solo por firma.
-  **Después (si algo corrió)**: detección y respuesta — el C2 (_Command and Control_) del atacante se identifica y se corta; el equipo queda aislado; el SOC investiga la línea de tiempo completa.

#### El Segundo Frente: los Controladores de Dominio

Los DCs locales custodian las identidades del dominio — el objetivo preferido tras un movimiento lateral. MDE los vigila como activos críticos: detecta ataques dirigidos a identidades on-premises (credenciales extraídas, escaladas, uso anómalo de cuentas de servicio) — el mismo frente que Entra ID Identity Protection cubre en la nube.

#### Diferencia Crítica: MDE vs. Entra ID Identity Protection

-  **MDE** vigila los **dispositivos y la red local**: exploits, malware, C2, ataques a DCs on-premises.
-  **Entra ID Identity Protection** vigila las **identidades en la nube**: logins anómalos, viajes imposibles, uso riesgoso de cuentas Azure AD/Entra ID.
-  Ambas trabajan para detectar el uso sospechoso o el compromiso de cuentas **en sus respectivos ámbitos** — el atacante moderno actúa en ambos mundos, y la defensa también.

#### Diferencia Crítica: MDE vs. MDO

-  **MDO** actúa en el correo — el canal de llegada del phishing.
-  **MDE** actúa en el dispositivo — lo que se ejecuta cuando el phishing tuvo éxito.
-  Son eslabones consecutivos de la misma cadena: el enlace que se salta la primera capa encuentra a la segunda esperándolo.

### Propósito fundamental

Defender for Endpoint es la última oportunidad de detención en el dispositivo: previene la ejecución inicial, corta la comunicación con el atacante si algo corrió y vigila los controladores de dominio donde viven las identidades — porque cuando la amenaza ya está dentro, lo que importa es detectarla en minutos, no en meses.
