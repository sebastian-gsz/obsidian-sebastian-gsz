---
def-type: atomic
version: 1.0
id: def-reverse-proxy
status: estandar
category: redes
contexto: servicios-de-red
date: 2026-11-11
tags:
  - redes
  - proxy
  - web
  - seguridad
aliases:
  - proxy inverso
  - reverse proxy
---
Un **proxy inverso** actúa como **intermediario entre los usuarios de internet y el servidor web interno**: el usuario habla con el proxy — que está expuesto — y el servidor real queda oculto dentro del dominio corporativo, nunca directamente alcanzable desde internet. El proxy maneja las solicitudes externas, filtra el tráfico y lo redirige de forma segura hacia el servidor interno.

#### Qué Resuelve

-  **El servidor deja de estar expuesto**: las IP reales de los servidores se ocultan detrás del proxy — los ataques directos (incluido el pivoting hacia la red interna tras comprometer el web) pierden su objetivo.
-  **El tráfico no autorizado se filtra antes de tocar el servidor interno**.

#### Sus Ventajas (todas fundamentales)

-  **Seguridad**: oculta las direcciones IP reales — privacidad y dificultad para ataques directos.
-  **Balanceo de carga**: distribuye las peticiones entre múltiples servidores — rendimiento optimizado sin sobrecargas.
-  **Caché**: almacena contenido estático — menos carga en los servidores, respuestas más rápidas para los usuarios.
-  **Encriptación SSL/TLS**: termina el HTTPS en el proxy — libera a los servidores internos de la carga computacional del cifrado.
-  **Economía de direcciones IP**: múltiples servidores web detrás de una única IP pública.

#### Diferencia Crítica: Proxy Inverso vs. Proxy (directo)

-  Son el mismo intermediario en dirección opuesta: el **proxy directo** trabaja PARA el cliente (sale con su tráfico, lo filtra, le da anonimato — como en proxychains); el **proxy inverso** trabaja PARA el servidor (recibe el tráfico del mundo y lo protege).
-  El proxy directo oculta al CLIENTE; el inverso oculta al SERVIDOR. La palabra "inverso" es literal: la perspectiva se invierte.

### Propósito fundamental

El proxy inverso es el portero profesional del servicio web: expone una única cara controlada al internet hostil, oculta la infraestructura real detrás, y de paso balancea, cachea y cifra — la diferencia entre tener tu servidor pegado a la calle y tenerlo detrás de una recepción que filtra todo lo que entra.
