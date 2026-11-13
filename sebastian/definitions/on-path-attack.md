---
def-type: atomic
version: 1.0
id: def-on-path-attack
status: estandar
category: amenazas
contexto: ataques-de-red
date: 2026-11-11
tags:
  - mitm
  - amenazas
  - redes
aliases:
  - ataque en ruta
  - on-path attack
  - man in the middle
---
El **ataque en ruta** (_on-path attack_ — históricamente _Man-in-the-Middle_, MitM) es la **intercepción de comunicaciones**: el atacante se coloca **entre dos partes que creen hablar directamente** — ve, y si puede, modifica todo el tráfico — la escucha activa posicionada en el camino.

#### Cómo se Posiciona el Atacante

-  **ARP poisoning** en la red local: hacerse pasar por el gateway para que el tráfico de la víctima pase por su máquina.
-  **Evil twin / punto de acceso falso**: un WiFi clonado que las víctimas conectan voluntariamente — todo su tráfico atraviesa al atacante.
-  **DNS spoofing**: redirigir el nombre legítimo hacia el servidor del atacante.
-  **BGP hijacking** a gran escala: anunciar rutas falsas para capturar tráfico de redes enteras.
-  **Compromiso de intermediarios**: un proxy corporativo o ISP comprometido — el ataque sin tocar la red de nadie.

#### Qué Puede Hacer desde Ahí

-  **Escuchar** (pasivo): todo lo que viaje sin cifrar queda expuesto — credenciales, sesiones, contenido.
-  **Modificar** (activo): alterar respuestas, inyectar contenido, degradar cifrado (_SSL stripping_ — forzar el HTTP plano cuando el usuario escribe el dominio).
-  **Reproducir**: capturar mensajes válidos para reenviarlos (replay).

#### Por Qué el Cifrado Es la Contra

-  **TLS** es la respuesta estructural: aunque el atacante esté en el medio, solo ve tráfico cifrado — y el certificado del servidor prueba la identidad del extremo.
-  Las derrotas del MitM vienen de las grietas: certificados falsos aceptados, SSL stripping si el usuario nunca llega al HTTPS, y usuarios que aceptan las advertencias del navegador.
-  El nombre actual — **on-path** — describe mejor el ataque: no hay un "hombre en medio" necesariamente humano; es cualquier entidad posicionada EN LA RUTA de la comunicación.

#### Diferencia Crítica: On-Path vs. Suplantación de IP

-  La **suplantación de IP** falsifica el ORIGEN del paquete — el atacante miente sobre quién es y no está en el camino.
-  El **ataque en ruta** ocupa el CAMINO — el atacante no miente sobre origen: intercepta lo que ya pasa por su posición.
-  En un MitM clásico con ARP poisoning hay spoofing de ARP/ip para POSICIONARSE — y después, la posición es lo que vale: ver y modificar la conversación completa.

### Propósito fundamental

El ataque en ruta es la escucha posicionada: no rompe la puerta — se sienta en el pasillo por donde todo pasa — y por eso la defensa no es un muro sino el cifrado extremo a extremo con identidad verificada: la conversación que solo los dos extremos pueden leer sobrevive a cualquier intermediario.
