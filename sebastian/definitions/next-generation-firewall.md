---
def-type: atomic
version: 1.0
id: def-ngfw
status: estandar
category: ciberseguridad
contexto: defensa-de-red
date: 2026-11-11
tags:
  - ciberseguridad
  - redes
  - firewall
  - ips
aliases:
  - firewalls de próxima generación
  - ngfw
  - next generation firewall
---
Un **NGFW** (_Next-Generation Firewall_ — firewall de próxima generación) es un firewall que va más allá del filtrado por IP y puerto: integra **inspección profunda de paquetes, análisis de aplicaciones y funciones de seguridad avanzadas** en un solo dispositivo que decide por identidad, aplicación y contenido, no solo por dirección.

#### Capacidades que lo Definen

-  **Inspección profunda de paquetes (DPI)**: analiza el **contenido de las cargas útiles**, no solo los encabezados — ve qué hay dentro del tráfico, incluso cifrado (mediante terminación TLS).
-  **Análisis de aplicaciones**: identifica y controla el tráfico de aplicaciones específicas (Teams, torrents, SSH...) aunque usen puertos estándar o cifrado — decisiones por comportamiento de aplicación.
-  **Funciones integradas**: prevención de intrusiones (IPS), detección de malware, filtrado de URL y control de aplicaciones en la misma caja.
-  **Inteligencia de amenazas**: consume feeds de indicadores para identificar y bloquear activamente IPs, dominios y firmas maliciosas conocidas en tiempo real.
-  **Visibilidad y gestión centralizada**: mayor visibilidad del tráfico y administración unificada de políticas de seguridad en toda la red.

#### Diferencia Crítica: NGFW vs. Firewall tradicional

-  El firewall tradicional pregunta: "¿qué IP y qué puerto?" — responde a la pregunta del *transporte*. Un atacante que mete su C2 por el 443 pasa limpio.
-  El NGFW pregunta: "¿qué aplicación, qué usuario, qué contenido?" — y detecta que detrás de ese HTTPS legítimo viaja exfiltración de datos. La diferencia no es de potencia sino de *nivel de abstracción* de la política: del puerto a la intención.

### Propósito fundamental

El NGFW responde a la realidad de que el tráfico moderno es cifrado y va por puertos estándar: al mirar dentro de las aplicaciones y el contenido, convierte el firewall de un guardia que cuenta paquetes en un punto de control que entiende qué corre por la red — y bloquea lo que *es*, no solo por dónde llega.
