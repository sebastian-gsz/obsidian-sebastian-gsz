---
def-type: atomic
version: 1.0
id: def-mimikatz
status: estandar
category: ciberseguridad
contexto: herramientas-seguridad
date: 2026-11-11
tags:
  - ciberseguridad
  - credenciales
  - windows
  - herramientas
aliases:
  - mimikatz
---
**Mimikatz** es una **herramienta que expone hashes de contraseñas y credenciales almacenados en una máquina Windows**, particularmente efectiva para extraer información de inicio de sesión desde la memoria del proceso LSASS — y para romper o reutilizar esos hashes posteriormente. Creada por Benjamin Delpy, empezó como demostración educativa y se convirtió en la herramienta de credenciales más citada de la seguridad Windows.

#### Qué Hace

-  **Extrae credenciales de la memoria (LSASS)**: contraseñas en texto claro (con configuraciones viejas), hashes NTLM, tickets Kerberos.
-  **Pass-the-hash / Pass-the-ticket**: permite autenticarse en otros sistemas SIN conocer la contraseña — reutilizando el hash o el ticket robado.
-  **Abusa de mecanismos legítimos de Windows**: su eficacia nace de entender el protocolo de autenticación mejor que sus defensores.

#### Doble Filo: Test y Arma

-  **Lado legítimo**: es la herramienta estándar para **probar defensas de credenciales** — si Mimikatz extrae algo en tu red, tu configuración falla; los equipos rojos la usan para demostrarlo.
-  **Lado abusivo**: es el equipo estándar de todo atacante Windows serio — integrada en frameworks de post-explotación. Su existencia obligó a Microsoft a endurecer Windows.

#### Cómo Defenderse de Ella

-  **Credential Guard** y **LSA Protection**: aislar y proteger el proceso LSASS.
-  Desactivar el almacenamiento en claro (WDigest) y depuración remota; **no correr como administrador** lo innecesario (el proceso debe ser admin para leer LSASS).
-  Monitorear el acceso a LSASS y las técnicas pass-the-hash en el SIEM — el intento es detectable.

#### Diferencia Crítica: Mimikatz vs. un Hash Cracker

-  Un **cracker** de hashes ataca offline: recibe hashes y los rompe por fuerza — lento, limitado por la fortaleza de la contraseña.
-  **Mimikatz** ni siquiera necesita romper: extrae credenciales vivas de la memoria y las **reutiliza tal cual** (pass-the-hash) — por eso el remedio no es "contraseñas más largas" sino proteger dónde viven.

### Propósito fundamental

Mimikatz es la prueba de estrés del modelo de credenciales de Windows: su existencia obligó a rediseñar cómo Windows protege y comparte credenciales — y estudiarla no es aprender a atacar, sino entender qué debe proteger un administrador serio: la memoria donde duermen las llaves de todo el dominio.
