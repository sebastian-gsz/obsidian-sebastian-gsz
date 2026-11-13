---
def-type: atomic
version: 1.0
id: def-firewall
status: estandar
category: ciberseguridad
contexto: defensa-de-red
date: 2026-11-11
tags:
  - ciberseguridad
  - redes
  - defensa
aliases:
  - cortafuegos
  - firewall de red
  - filtro de tráfico
---
Un **firewall** (cortafuegos) es un dispositivo o software de seguridad de red que **controla el tráfico entrante y saliente** según reglas definidas, permitiendo el legítimo y bloqueando el peligroso. Es la puerta con portero de la red: protege contra ataques cibernéticos, malware y robo de datos decidiendo qué conexiones pueden cruzar el límite.

#### Función Básica

-  Examina cada conexión y paquete que cruza el perímetro contra un conjunto de **reglas** (origen, destino, puerto, protocolo, dirección).
-  Decide por tráfico: **permitir, denegar o registrar** (log) — el registro es la mitad olvidada pero vital: sin logs, un firewall no deja evidencia de qué intentó entrar.
-  Define la frontera entre zonas de confianza: Internet (hostil) frente a red interna (protegida), o entre segmentos internos (usuarios frente a servidores).

#### La Familia de Firewalls

-  **Firewall sin estado** (_packet filtering_): examina cada paquete aislado contra reglas fijas — simple y rápido, ciego al contexto.
-  **Firewall con estado** (_stateful_): mantiene una tabla de conexiones activas y sabe si un paquete pertenece a una sesión válida.
-  **NGFW** (_Next-Generation Firewall_): añade inspección profunda de paquetes, identificación de aplicaciones, prevención de intrusiones e inteligencia de amenazas.

#### Diferencia Crítica: Firewall vs. IDS vs. IPS

-  El **firewall** es una barrera de decisión: aplica política y bloquea o permite *en el límite*.
-  El **IDS** (detección de intrusiones) solo *observa y alerta*: ve el ataque pasar pero no puede detenerlo.
-  El **IPS** (prevención de intrusiones) está en línea y *bloquea activamente* lo que detecta. El firewall define quién puede tocar la puerta; el IDS vigila quién merodea; el IPS pone una mano en el hombro del sospechoso.

### Propósito fundamental

El firewall convierte la seguridad de red en política explícita: en lugar de confiar en que cada servicio interno esté bien configurado, se establece en un punto único qué comunicación está permitida — todo lo demás se bloquea por defecto, que es la postura defensiva básica de cualquier red seria.
