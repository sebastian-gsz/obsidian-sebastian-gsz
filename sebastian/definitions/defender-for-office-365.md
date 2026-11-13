---
def-type: atomic
version: 1.0
id: def-mdo
status: estandar
category: cloud-computing
contexto: defensa-corporativa
date: 2026-11-11
tags:
  - microsoft
  - defender
  - correo
  - phishing
aliases:
  - microsoft defender for office 365
  - defender for office 365
  - mdo
---
**Microsoft Defender for Office 365 (MDO)** es la capa de defensa del correo y la colaboración de Microsoft 365: **filtra correos de phishing, bloquea URLs y detecta archivos adjuntos maliciosos _antes_ de que lleguen al usuario final o sean abiertos** — el primer muro de la cadena de ataque, donde casi todo empieza.

#### Por Qué es Clave: el Correo es la Puerta

El ataque a menudo empieza con un **correo de phishing**: el usuario hace clic en un enlace malicioso o abre un archivo adjunto infectado. Defender for Office 365 actúa ANTES de ese clic:

-  **Filtrado de phishing**: análisis del remitente, el contenido y las señales de suplantación antes de entregar el mensaje.
-  **Verificación de enlaces** (_Safe Links_): reescribe y comprueba cada URL en el momento del clic — si el destino es malicioso, se bloquea aunque el correo ya esté en la bandeja.
-  **Detonación de adjuntos** (_Safe Attachments_): los archivos se abren en entorno aislado antes de llegar — si explotan, nunca llegan.
-  **Post-entrega**: si la amenaza se detecta tarde, purga el mensaje de las bandejas automáticamente.

#### Su Lugar en la Cadena de Defensa

MDO es la primera barrera del kill chain corporativo: si detiene el correo, el ataque muere ahí. Si no lo detiene — o no está implementado — la amenaza pasa al siguiente eslabón: el endpoint (Defender for Endpoint) y de ahí a las identidades y las apps en la nube. Cada capa de la familia Defender cubre el hueco de la anterior.

#### Diferencia Crítica: MDO vs. Defender for Endpoint

-  **MDO** defiende el **canal de llegada**: el correo y las URLs — actúa sobre mensajes, antes del clic.
-  **MDE** defiende el **dispositivo**: el exploit o malware que ya llegó y se intenta ejecutar.
-  El phishing que MDO no vio se convierte en la ejecución que MDE debe frenar — dos capas, el mismo enemigo en momentos distintos.

### Propósito fundamental

Defender for Office 365 ataca el punto donde nace la mayoría de las intrusiones: el correo — filtrando el phishing, verificando los enlaces al hacer clic y detonando los adjuntos antes de entregarlos — porque el clic que no ocurre es el incidente que no hay que investigar.
