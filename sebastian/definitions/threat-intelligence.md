---
def-type: atomic
version: 1.0
id: def-threat-intelligence
status: estandar
category: ciberseguridad
contexto: inteligencia-de-amenazas
date: 2026-11-11
tags:
  - threat-intelligence
  - inteligencia
  - soc
aliases:
  - threat intelligence
  - inteligencia de amenazas
  - servicio de threat intelligence
---
Un **servicio de Threat Intelligence** **recopila, procesa, analiza y difunde información sobre amenazas** — y responde a las actividades que representan una amenaza para las aplicaciones y sistemas: la industria que convierte el ruido mundial de ataques en conocimiento accionable para tus defensas.

#### El Ciclo de la Inteligencia

-  **Recopila**: información sobre vulnerabilidades y explotaciones **en tiempo real** — campañas observadas, indicadores (IOCs: IPs, dominios, hashes), tácticas de grupos de atacantes.
-  **Compila en una única base de datos**: normaliza y correlaciona — un IOC aislado vale poco; en contexto (quién, cómo, contra quién) vale una alerta anticipada.
-  **Difunde entre los consumidores del servicio**: feeds, integraciones con el SIEM y el firewall, informes — el conocimiento llega a donde las defensas pueden usarlo.
-  Ejemplo de proveedor mayor: **Cisco Talos** — uno de los mayores equipos de inteligencia de amenazas del mundo.

#### Los Niveles de Inteligencia

-  **Táctica** (lo técnico): IOCs y firmas — lo que el SIEM consume automáticamente.
-  **Operativa**: campañas y TTPs de grupos concretos — lo que guía al threat hunting contra las técnicas reales (la matriz MITRE ATT&CK es su vocabulario).
-  **Estratégica**: tendencias y motivaciones del panorama — lo que los directivos usan para decidir inversión.

#### Diferencia Crítica: Threat Intelligence vs. SIEM

-  El **SIEM** procesa TU tráfico: correlaciona tus logs y detecta en tu casa.
-  La **threat intelligence** trae el conocimiento DEL MUNDO EXTERIOR: qué atacan otros, qué indicadores corren hoy — el contexto que da sentido a lo que tu SIEM ve.
-  Se alimentan mutuamente: la inteligencia enriquece las reglas del SIEM; los incidentes propios devuelven IOCs al ecosistema.

#### Diferencia Crítica: Threat Intelligence vs. Threat Modeling

-  La **intelligence** mira LO QUE ESTÁ PASANDO ahí fuera: amenazas actuales, observadas, en tiempo real.
-  El **threat modeling** mira TU sistema: cómo se rompería este diseño concreto.
-  El modelado maduro se nutre de la inteligencia — defendiendo las técnicas que el enemigo de verdad usa hoy, no las hipotéticas.

### Propósito fundamental

La threat intelligence convierte el caos mundial de ataques en conocimiento utilizable: recopilar, analizar y difundir lo que los atacantes hacen — para que tus defensas apunten a las amenazas reales de hoy y no a las de hace dos años — porque defender sin inteligencia es jugar a ciegas contra un oponente que sí te está viendo.
