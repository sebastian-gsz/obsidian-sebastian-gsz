---
def-type: atomic
version: 1.0
id: def-replay-attack
status: estandar
category: amenazas
contexto: ataques-de-red
date: 2026-11-11
tags:
  - amenazas
  - ataques
  - redes
  - autenticacion
aliases:
  - ataque de reproducción
  - replay attack
  - ataque de repetición
---
Un **ataque de reproducción** (_replay attack_) consiste en **capturar una comunicación legítima y retransmitirla tal cual** para engañar al sistema: el atacante no descifra ni modifica el mensaje — simplemente lo **repite**, y el receptor, que no distingue la copia del original, la ejecuta como válida.

#### El Escenario Clásico

-  La víctima envía una petición válida — un ticket de autenticación, una orden de transferencia firmada, un código de acceso — y el atacante (con rastreo de paquetes, packet sniffing) la captura.
-  Horas después (o segundos), el atacante **reenvía el mensaje idéntico**: para el servidor es la misma comunicación legítima que ya aceptó una vez — el login entra, la transferencia se repite, el acceso se abre.
-  El poder del ataque: no requiere romper cifrado ni claves — **abusa de la validez repetible del mensaje original**.

#### Por Qué Funciona — y Cómo se Frena

-  Falla cuando el protocolo trata cada mensaje como válido SIEMPRE — sin contexto temporal ni unicidad.
-  Las defensas son exactamente las que rompen la reutilización:
  - **Timestamps**: el mensaje expira — una petición de hace 2 horas se rechaza por vieja.
  - **Nonces** (números usados una sola vez): el servidor memoriza los nonces recibidos y rechaza repetidos.
  - **Números de secuencia** en TCP: cada mensaje vale en su posición — repetido, rompe la secuencia.
  - **Desafíos aleatorios** en la autenticación: la respuesta criptográfica vale solo para el desafío de esta sesión.

#### Diferencia Crítica: Replay vs. MitM

-  El **MitM** intercepta Y manipula: ve, modifica y decide el tráfico en tiempo real.
-  El **replay** no entiende el mensaje: lo copia y lo repite — funciona incluso contra tráfico cifrado (no necesita leerlo, solo repetirlo).
-  Por eso el replay es más sutil: la defensa no es cifrar más fuerte — es hacer cada mensaje **irrepetible**.

### Propósito fundamental

El ataque de reproducción demuestra que un mensaje válido puede ser un arma cuando se repite: no rompe la criptografía — rompe la unicidad — y por eso todo protocolo serio de autenticación y transacción incluye timestamps, nonces y secuencia: el diseño que convierte cada comunicación en algo que solo puede ocurrir una vez.
