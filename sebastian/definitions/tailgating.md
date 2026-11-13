---
def-type: atomic
version: 1.0
id: def-tailgating
status: estandar
category: amenazas
contexto: ingenieria-social
date: 2026-11-12
tags:
  - ingenieria-social
  - seguridad-fisica
  - amenazas
aliases:
  - tailgating
  - colarse tras alguien
  - piggybacking
---
El **tailgating** es una **táctica de ingeniería social en la que una persona no autorizada entra en una zona restringida siguiendo de cerca a un usuario autorizado**: colarse por la puerta que el otro acaba de abrir con su credencial — la intrusión física sin necesidad de forzar nada.

#### Cómo Funciona

-  El atacante espera en la puerta con control de acceso (tarjeta, biometría) y **sigue de cerca** al empleado legítimo que acaba de pasar — por cortesía ("¿me aguantas la puerta?"), por despiste (brazos cargados, uniforme de técnico, conversación amable) o simplemente por velocidad.
-  La puerta cierra tras el intruso: ya está DENTRO de la zona restringida — sin tarjeta, sin registro, sin alarma.
-  El nombre viene de la carretera: "ir pegado" al vehículo de delante para pasar por la barrera que él abrió.

#### Dónde Golpea

-  **Oficinas y datacenters**: la sala de servidores detrás de una sola puerta de credencial.
-  **Laboratorios y áreas de producción**: zonas donde el físico es el único control.
-  Es el complemento físico del ataque digital: dentro de la zona restringida, un atacante puede conectar dispositivos a la red (puertos vivos), instalar hardware de escucha o robar equipos.

#### Defensa

-  **Mantrap / sas de acceso**: vestíbulos de doble puerta que solo permiten a UNA persona por ciclo.
-  **Cultura de "no colar a nadie"**: la cortesía es la grieta — la política es cortés pero inflexible, y el personal tiene autoridad (y obligación) de pedir credencial a quien no reconoce.
-  **Vigilancia y badging**: cámaras en los accesos y registro obligatorio de visitas — el tailgater evita ser visto y registrado.

#### Diferencia Crítica: Tailgating vs. Baiting

-  El **baiting** deja un CEBO pasivo (el USB "olvidado") y espera que la víctima muerda.
-  El **tailgating** es ACTIVO y presencial: el atacante entra él mismo aprovechando el acceso ajeno.
-  Ambos son ingeniería social física, pero uno explota la curiosidad a distancia y el otro la cortesía en persona.

### Propósito fundamental

El tailgating demuestra que la mejor puerta digital se abre con la cortesía de un humano: la intrusión física sin forcejeo — y su defensa no es tecnológica sino cultural: sas de acceso, vigilancia y una regla social clara de que la puerta se cierra tras cada persona, una por una.
