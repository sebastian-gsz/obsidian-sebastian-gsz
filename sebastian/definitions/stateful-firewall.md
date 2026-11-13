---
def-type: atomic
version: 1.0
id: def-stateful-firewall
status: estandar
category: ciberseguridad
contexto: defensa-de-red
date: 2026-11-11
tags:
  - ciberseguridad
  - redes
  - firewall
aliases:
  - firewall con estado
  - firewall de inspección de estado
  - stateful firewall
---
Un **firewall con estado** (_stateful firewall_ o firewall de inspección de estado) es un tipo de firewall que **monitorea el estado de las conexiones de red y hace seguimiento de las sesiones de comunicación**: no decide cada paquete de forma aislada, sino sabiendo a qué conexión pertenece.

#### Funcionamiento

-  **Tabla de estado**: al establecerse una conexión, el firewall registra sus parámetros (IPs, puertos, secuencia, estado) en una tabla que representa todas las sesiones activas.
-  Al llegar un paquete, analiza no solo su **encabezado** (IP, puerto) sino también su **contexto**: ¿corresponde a una conexión establecida previamente?
-  Si el paquete **coincide con una conexión válida**, pasa según las reglas establecidas; si **no coincide o viola las reglas**, se bloquea.
-  Ventaja práctica: basta permitir "conexiones salientes al puerto 443" para que las *respuestas* entrantes pasen automáticamente — sin abrir el 443 entrante al mundo.

#### Ventajas

-  **Mayor seguridad**: las decisiones son contextuales — un paquete `ACK` solitario sin conexión previa (típico de un escaneo) no engaña a nadie.
-  **Mejor rendimiento**: al recordar el estado, procesa los paquetes de conexiones conocidas por la vía rápida, sin reevaluar todas las reglas por paquete.

#### Diferencia Crítica: Con estado vs. Sin estado

-  El firewall **sin estado** ve solo el paquete: un atacante puede falsificar cabeceras (flags TCP) para parecer una respuesta legítima y atravesarlo.
-  El firewall **con estado** ve la sesión: un paquete que *dice* ser parte de una conversación pero no está en su tabla de estado se descarta. La memoria de las conexiones es exactamente la defensa que al filtrado estático le falta.

### Propósito fundamental

El firewall con estado introdujo el contexto en el filtrado de red: al mantener una tabla viva de las sesiones legítimas, puede distinguir el tráfico que responde de una conversación real del tráfico que finge serlo — la base de todo firewall moderno desde los años 90.
