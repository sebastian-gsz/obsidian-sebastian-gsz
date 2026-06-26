---
def-type: atomic
version: 1.0
id: def-snat
status: estandar
category: arquitectura-de-redes
contexto: redes
date: 2026-06-26
tags:
  - redes
  - nat
  - cloud
  - seguridad
  - routing
aliases:
  - snat
  - source network address translation
---
El SNAT es una técnica de traducción de direcciones de red que permite que múltiples dispositivos dentro de una red privada utilicen una única dirección IP pública para comunicarse con redes externas, como internet. En arquitecturas modernas, es el mecanismo estándar para habilitar el tráfico de salida (egress) desde subredes privadas, manteniendo el aislamiento de red al no requerir IPs públicas directas en cada instancia.

#### Mecánica de funcionamiento

El proceso se ejecuta en la capa de red mediante un dispositivo intermediario (NAT Gateway, firewall o router):

-  **Sustitución de origen:** Cuando un paquete sale de la red privada, el dispositivo de red sustituye la dirección IP privada de origen por su propia dirección IP pública (o la del gateway) antes de enviarlo al destino externo.
-  **Seguimiento de estado:** El dispositivo mantiene una tabla de estados (connection tracking) que asocia los puertos y direcciones internos con la conexión saliente. Esto permite que, cuando llega una respuesta desde internet, el dispositivo pueda identificar correctamente el dispositivo privado original y redirigir el tráfico de vuelta.

#### Uso en arquitectura cloud y seguridad

-  **Aislamiento de red:** Permite que recursos como bases de datos o instancias de aplicación en subredes privadas descarguen actualizaciones, parches o accedan a servicios API públicos sin estar expuestos a intentos de conexión entrantes desde internet.
-  **Optimización de recursos:** Permite gestionar una flota extensa de servidores utilizando un pool limitado de direcciones IP públicas, reduciendo costes y simplificando la gestión de la visibilidad externa.

#### Gestión vía cli

En sistemas Linux utilizados como pasarelas de red, el SNAT (a menudo implementado como masquerading para IPs dinámicas) se configura mediante el siguiente comando: `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE`

