---
def-type: atomic
version: 1.0
id: def-loopback
status: estandar
category: conceptos-generales
contexto: systemtechnik
date: 2026-11-11
tags:
  - red
  - direccionamiento
  - conceptos
aliases:
  - dirección loopback
  - loopback address
  - 127.0.0.1
---
La dirección loopback es una dirección IP especial reservada en el rango de direcciones IP privadas que se utiliza para dirigir el tráfico de red de un dispositivo a sí mismo: cuando un dispositivo envía datos a su propia dirección loopback, estos se procesan internamente sin salir de la propia máquina.

### Características

-  **Tráfico interno**: Los datos enviados a la interfaz loopback nunca llegan a la red física; el sistema operativo los procesa localmente.
-  **Rango reservado**: El bloque loopback IPv4 está definido como ``127.0.0.0/8``, siendo ``127.0.0.1`` la dirección más utilizada (identifica a la propia máquina como "localhost").

### Propósito fundamental

La interfaz loopback permite probar la pila de red y los servicios locales sin depender de la conectividad externa: un servicio que responde en ``127.0.0.1`` confirma que funciona con independencia del estado de la red.
