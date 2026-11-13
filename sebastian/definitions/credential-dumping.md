---
def-type: atomic
version: 1.0
id: def-credential-dumping
status: estandar
category: amenazas
contexto: credenciales
date: 2026-11-12
tags:
  - credenciales
  - amenazas
  - windows
  - postexplotacion
aliases:
  - volcado de credenciales
  - credential dumping
  - dumping de credenciales
---
El **volcado de credenciales** (_credential dumping_) es un método que **intenta obtener información de inicio de sesión extrayendo y rompiendo los hashes de contraseña** almacenados en un sistema: los hashes son **transformaciones unidireccionales de las contraseñas en texto sin cifrar** — y el atacante va a por ellas donde duermen.

#### Qué se Volca y Desde Dónde

-  **La memoria LSASS** en Windows: el proceso que guarda hashes NTLM, tickets Kerberos y credenciales en claro (según configuración) — el objetivo estrella de Mimikatz.
-  **La base SAM** local y la base **NTDS.dit** del dominio: los archivos donde Windows almacena los hashes de cuentas locales y de TODO el dominio.
-  **Archivos de configuración y tokens**: secretos mal guardados, claves de API, cookies de sesión.

#### Qué Hace el Atacante con el Volcado

-  **Crackear offline**: contra los hashes extraídos, fuerza bruta o tablas arcoíris — la contraseña original se recupera si era débil.
-  **Pass-the-hash / pass-the-ticket**: sin crackear nada — reutilizar el hash o ticket tal cual para autenticarse en otros sistemas del dominio.
-  **Movimiento lateral**: con las credenciales del administrador de dominio volcadas, todo el dominio cae — el volcado es el paso que convierte UN endpoint comprometido en el dominio entero.

#### Defensa

-  **Credential Guard** y **LSA Protection**: aislar y blindar el proceso donde duermen las credenciales.
-  Deshabilitar el almacenamiento en claro (WDigest); cuentas de servicio sin privilegios de dominio; **tiered administration** (nunca hacer login administrativo en máquinas de usuario — donde el volcado las cazaría).
-  Monitorear el acceso a LSASS y las técnicas de volcado en el SIEM — el intento se detecta aunque el volcado no se complete.

#### Diferencia Crítica: Volcado de Credenciales vs. Cracking de Contraseñas

-  El **volcado** EXTRAER: saca los hashes de donde el sistema los guarda — dentro del sistema comprometido.
-  El **cracking** DESCIFRA: fuerza bruta y tablas arcoíris contra hashes ya en mano — fuera del sistema.
-  Son las dos mitades de la cadena: el volcado consigue el material; el cracking intenta abrirlo — y la técnica pass-the-hash demuestra que a veces ni siquiera hace falta abrirlo.

### Propósito fundamental

El volcado de credenciales es la minera de las contraseñas ajenas: extraer del sistema los hashes — las transformaciones unidireccionales — donde el sistema los guarda — el paso de post-explotación que convierte un equipo tocado en dominio capturado, y la razón por la que proteger la MEMORIA donde duermen las credenciales es tan crítico como proteger las contraseñas mismas.
