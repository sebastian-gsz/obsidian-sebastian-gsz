---
def-type: atomic
version: 1.0
id: def-https
status: estandar
category: protocolos-de-red
contexto: web
date: 2026-11-11
tags:
  - https
  - tls
  - web
  - seguridad
aliases:
  - protocolo de transferencia de hipertexto seguro
  - https
  - http seguro
---
**HTTPS** (_Hypertext Transfer Protocol Secure_ — protocolo de transferencia de hipertexto seguro) es la **versión segura de HTTP**: el protocolo que envía datos entre un navegador web y un sitio web **cifrándolos con TLS**, de modo que nadie en el camino puede leerlos ni alterarlos.

#### Qué Añade Respecto a HTTP

-  **Confidencialidad**: la comunicación viaja cifrada — ni el WiFi público, ni el ISP, ni un intermediario puede leer las peticiones, respuestas o contraseñas.
-  **Integridad**: si alguien altera un byte en tránsito, TLS lo detecta y la conexión se rompe — sin corrupción silenciosa.
-  **Identidad del servidor**: el certificado digital emitido por una autoridad de certificación prueba que el sitio es quien dice ser — el candado del navegador no solo significa "cifrado", sino "esta identidad fue verificada".

#### Cómo Funciona (a grandes rasgos)

1.  El navegador se conecta al puerto 443 y arranca el **handshake TLS**: negocian versiones y cifras.
2.  El servidor presenta su **certificado**, el cliente lo valida contra las autoridades conocidas.
3.  Se establece una **clave de sesión** que cifra todo el intercambio HTTP por encima — HTTP sigue hablando lo mismo, pero dentro de un tubo cifrado.

#### Diferencia Crítica: HTTPS vs. HTTP

-  HTTP envía todo en **texto plano**: un sniffer en la red lee contraseñas, cookies y contenido.
-  HTTPS cifra todo el canal: el sniffer solo ve tráfico ilegible hacia un servidor verificado.
-  El costo es mínimo hoy (una fracción de milisegundo de handshake, reutilizado) — por eso HTTPS es el estándar de facto y los navegadores marcan HTTP como "No seguro". Regla absoluta: ninguna autenticación debería viajar jamás por HTTP plano.

### Propósito fundamental

HTTPS convierte la web abierta en una web donde la privacidad es el valor por defecto: mismo idioma de petición-respuesta que HTTP, pero dentro de un canal cifrado y autenticado — la diferencia entre conversar en una plaza pública y hacerlo en una habitación con la puerta cerrada y el anfitrión identificado.
