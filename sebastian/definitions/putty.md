---
def-type: atomic
version: 1.0
id: def-putty
status: estandar
category: desarrollo-software
contexto: herramientas
date: 2026-11-11
tags:
  - ssh
  - herramientas
  - terminal
  - windows
aliases:
  - putty
  - putty ssh
  - cliente putty
---
**PuTTY** es un **cliente de terminal que se utiliza para conectarse a servidores a través de protocolos como Telnet, SSH, rlogin y rsh** — el cliente SSH clásico de Windows: ligero, gratuito y presente en el arsenal de todo administrador que gestiona equipos remotos desde una máquina Windows.

#### Qué Hace

-  Abre sesiones de terminal remota: te conectas a un servidor Linux desde Windows y operas su línea de comandos como si estuvieras sentado frente a él.
-  **SSH es su uso dominante**: sesión cifrada y autenticada por contraseña o por par de claves (guarda tus claves con PuTTYgen y las gestiona con Pageant, su agente).
-  También habla los protocolos heredados — **Telnet, rlogin, rsh** — útiles solo en equipos antiguos y sin cifrar (evítalos salvo laboratorio).
-  Extras: serial por consola (equipos sin red), tuneles de puertos, y su gemelo **PSCP/PSFTP** para transferir archivos.

#### Para Qué se Usa en la Práctica

-  **Administración de servidores Linux** desde estaciones Windows — el caso dominante.
-  **Equipos de red**: switches y routers con consola SSH/Telnet.
-  **Laboratorios y SOC**: acceso a VMs de análisis, honeypots y equipos de investigación.

#### Diferencia Crítica: PuTTY vs. OpenSSH (terminal nativo)

-  **PuTTY** nació para Windows, cuando no había cliente SSH nativo — hoy Windows 10/11 incluye OpenSSH integrado, y muchos migraron.
-  PuTTY sigue ganando en: gestión visual de sesiones múltiples, emulación de terminal robusta, consola serial y su ecosistema (PuTTYgen, Pageant).
-  La elección: hábito y consola serial → PuTTY; scripting y flujos modernos → OpenSSH nativo — ambos hablan el mismo SSH, el resto es ergonomía.

### Propósito fundamental

PuTTY es el puente de terminal entre el administrador y sus servidores remotos: convierte una ventana de Windows en la consola de un Linux al otro lado del mundo — cifrado por SSH, autenticado por claves y con décadas de confiabilidad — la herramienta humble sobre la que se sostiene la administración remota cotidiana.
