---
def-type: atomic
aliases:
  - SNAT
  - Source Network Address Translation
---
El SNAT (**Source Network Address Translation**) es una técnica de traducción de direcciones de red que permite que múltiples dispositivos dentro de una red privada utilicen una única dirección IP pública para comunicarse con redes externas, como internet. En arquitecturas de nube, este mecanismo es fundamental para permitir la salida de tráfico (egress) desde subredes privadas, manteniendo el aislamiento de red al no asignar IP públicas directamente a las instancias.

El proceso implica que el dispositivo de red (NAT Gateway, firewall o router) sustituya la dirección IP de origen privada de un paquete saliente por su propia dirección IP pública (o la del gateway) antes de enviar el paquete al destino externo. El dispositivo mantiene una tabla de estados para asociar las respuestas entrantes con la conexión privada original, garantizando la bidireccionalidad de la comunicación.