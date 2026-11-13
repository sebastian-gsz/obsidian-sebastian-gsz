---
def-type: atomic
version: 1.0
id: def-ids
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-11
tags:
  - ids
  - deteccion
  - soc
  - redes
aliases:
  - ids
  - intrusion detection system
  - sistema de detección de intrusiones
---
Un **sistema de detección de intrusiones** (_IDS_ — _Intrusion Detection System_) es una **aplicación que supervisa la actividad del sistema y alerta sobre posibles intrusiones**: el sensor de la red que vigila en busca de comportamiento malicioso y avisa — **sin detener nada por sí mismo**.

#### Sus Dos Tipos

-  **NIDS** (_Network IDS_): monitorea el **tráfico de red** — mira los paquetes que cruzan su punto de escucha buscando firmas y anomalías (Snort, Suricata en modo detección).
-  **HIDS** (_Host IDS_): monitorea **un solo dispositivo o host** — archivos del sistema, logs, procesos del propio equipo (por ejemplo Cisco Secure Endpoint en rol de detección).

#### Sus Limitaciones — y Por Qué Aun Así Importa

-  **Solo escanea ataques conocidos o anomalías obvias**: los ataques nuevos y sofisticados pueden no detectarse — el firmado ve lo que ya tiene firma; el heurístico ve lo que ya es obvio.
-  **No detiene nada**: el IDS ALERTA, pero **no bloquea el tráfico entrante** — depende de que el administrador (o el IPS) actúe antes de que el daño ocurra.
-  Aun así es indispensable: es el OJO de la red — sin detección, el ataque transita sin que nadie sepa que pasó; el IDS convierte el tráfico en señales investigables que alimentan al SOC, al SIEM y al threat hunting.

#### Diferencia Crítica: IDS vs. IPS

-  El **IDS** informa: ve la anomalía y ALERTA — la decisión y el bloqueo son de otro (analista o IPS).
-  El **IPS** actúa: ve la anomalía y la DETIENE en el mismo instante — bloquea el remitente, descarta los paquetes.
-  La analogía establecida: el IDS es el guardia que da la voz de alarma; el IPS es el que pone la mano — la elección entre ellos es una decisión de riesgo: detección sin riesgo de bloqueos falsos vs. prevención con la responsabilidad de cortar tráfico legítimo.

#### Diferencia Crítica: IDS vs. Firewall

-  El **firewall** decide por POLÍTICA: qué puede pasar según reglas de IP/puerto/aplicación — no entiende de contenido.
-  El **IDS** inspecciona el CONTENIDO: detecta lo que la política permite pero es malicioso — el ataque que entra por un puerto legítimo.
-  Se complementan en profundidad: el firewall cierra lo prohibido; el IDS vigila lo permitido.

### Propósito fundamental

El IDS es el sistema nervioso de la detección: supervisa y alerta — no detiene, no cura — pero convierte el silencio de la red en visibilidad: cada intrusión detectada a tiempo es un incidente evitado, y su limitación honesta (ver solo lo conocido, no detener nada) es la que justifica su pareja natural: el IPS y el SOC que actúa sobre sus alertas.
