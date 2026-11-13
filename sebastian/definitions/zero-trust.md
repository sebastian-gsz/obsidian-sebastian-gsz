---
def-type: atomic
version: 1.0
id: def-zero-trust
status: estandar
category: ciberseguridad
contexto: gobernanza
date: 2026-11-12
tags:
  - zero-trust
  - seguridad
  - arquitectura
aliases:
  - zero trust
  - confianza cero
  - zero trust security
---
**Zero Trust** es una **estrategia de seguridad** — una **mentalidad, no un producto o servicio**: el principio de **nunca confiar, siempre verificar** — ningún usuario, dispositivo o red recibe confianza por su ubicación o por haberse autenticado una vez; cada acceso se verifica en cada momento.

#### El Principio que Rompe el Modelo Antiguo

-  La seguridad clásica era un castillo: muro perimetral fuerte y **confianza interior** — quien estaba "dentro de la red" podía moverse.
-  Zero Trust elimina la confianza implícita: **estar dentro de la red no significa nada** — cada petición verifica identidad, dispositivo, contexto y permiso, como si viniera de internet.
-  La motivación: el atacante moderno entra con credenciales robadas y mueve lateralmente — el modelo de castillo le entrega toda la red tras una sola puerta; zero trust le pone una verificación en cada habitación.

#### Sus Pilares Operativos

-  **Identidad fuerte**: autenticación por petición (MFA, identidad verificada — Entra ID Identity Protection) — la identidad es el nuevo perímetro.
-  **Dispositivo verificado**: no solo quién, sino desde QUÉ equipo — salud, cumplimiento, gestión.
-  **Acceso mínimo por aplicación**: no túneles de red completos — acceso granular al recurso concreto (el modelo del Identity-Aware Proxy).
-  **Segmentación y verificación continua**: redes divididas, permisos revisados, cada sesión revalidada.

#### Dónde se Materializa en Este Glosario

-  **IAP** (Identity-Aware Proxy): acceso por identidad por petición, sin VPN.
-  **Entra ID Identity Protection**: verificación de riesgo por identidad.
-  **RBAC + menor privilegio**: los permisos mínimos que zero trust exige por diseño.
-  La estrategia que unifica a todos: verificar siempre, confiar nunca.

#### Diferencia Crítica: Zero Trust vs. Perímetro Tradicional

-  El **perímetro** confía en el LUGAR: dentro = confiable, fuera = hostil — el muro.
-  **Zero Trust** elimina el concepto de "confiable por ubicación": TODA petición se verifica — no hay "dentro".
-  El cambio es de filosofía, no de compra: puede empezar con MFA y acceso condicional hoy — y no termina nunca, porque es una mentalidad de verificación continua, no un proyecto con fecha de fin.

### Propósito fundamental

Zero Trust es la mentalidad que elimina la confianza implícita de la seguridad: nunca confiar, siempre verificar — identidad, dispositivo y contexto comprobados en cada acceso — la estrategia que responde al mundo donde el atacante entra con credenciales válidas y mueve lateralmente: la red ya no es el perímetro; la verificación continua lo es.
