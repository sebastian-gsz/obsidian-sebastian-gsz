---
def-type: atomic
version: 1.0
id: def-mdca
status: estandar
category: cloud-computing
contexto: defensa-corporativa
date: 2026-11-11
tags:
  - microsoft
  - casb
  - defender
  - cloud
aliases:
  - microsoft defender for cloud apps
  - defender for cloud apps
  - casb
---
**Microsoft Defender for Cloud Apps (MDCA)** es fundamental como tu **CASB** (_Cloud Access Security Broker_ — intermediario de seguridad del acceso a la nube): **monitoriza el tráfico hacia y desde las aplicaciones en la nube, detectando patrones que sugieran una fuga de datos o el acceso no autorizado a información sensible** — la capa que ve lo que pasa en los servicios cloud, incluso fuera del control de TI.

#### Qué Hace un CASB

-  **Descubrir** (_shadow IT_): inventaria qué apps cloud usa realmente la organización — incluidas las que nadie aprobó — y califica su riesgo.
-  **Monitorizar el uso**: sesiones, descargas masivas, comparticiones externas, logins anómalos — el comportamiento de los datos en cada servicio.
-  **Aplicar políticas en línea**: bloquear o limitar sesiones riesgosas (descargar el CRM completo desde una IP de hotel), cifrar o etiquetar al vuelo.
-  **Detectar fugas**: patrones que sugieren exfiltración — un usuario que de pronto mueve cientos de archivos a un almacenamiento personal.

#### Cómo se Integra en la Cadena

Es el eslabón cloud de la familia Defender: el phishing que cruzó el correo (MDO), sobrevivió al endpoint (MDE) y usó una identidad comprometida (Entra ID Protection) acaba tocando aplicaciones cloud — y es MDCA quien ve esa actividad: el movimiento anómalo de datos, el acceso desde dónde no corresponde, la fuga que se está cocinando.

#### Diferencia Crítica: CASB vs. Firewall

-  El **firewall** decide a nivel de red: qué IP y puerto puede hablar con el exterior — ciego al contenido y a la app.
-  El **CASB** actúa a nivel de aplicación y de dato: ve QUÉ app se usa, QUÉ archivo se baja, CON QUÉ identidad — y puede actuar sobre la sesión concreta.
-  El tráfico cloud cifrado a servicios legítimos atraviesa el firewall sin preguntas; el CASB es quien se las hace — porque el exfiltrado moderno no sale por puertos raros: sale por el navegador, hacia la nube, con credenciales válidas.

### Propósito fundamental

Defender for Cloud Apps cierra el ciego de la era cloud: la organización ya no controla solo su datacenter — sus datos viven en decenas de servicios SaaS, muchos sin aprobar — y el CASB es la capa que restaura visibilidad y control sobre ese tráfico: qué app, qué usuario, qué dato, y si esa combinación huele a fuga, la corta en la sesión.
