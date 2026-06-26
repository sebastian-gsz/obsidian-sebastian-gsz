---
def-type: atomic
version: 1.0
id: def-dnssec
status: estandar
category: protocolos-de-red
contexto: seguridad-en-redes
date: 2026-06-20
tags:
  - redes
  - dns
  - ciberseguridad
  - criptografía
aliases:
  - extensiones de seguridad del sistema de nombres de dominio
  - dnssec
  - domain name system security extensions
---
DNSSEC (_Domain Name System Security Extensions_) es un conjunto de extensiones criptográficas diseñadas para robustecer el protocolo DNS, proporcionando mecanismos de autenticación de origen e integridad de los datos. Su función principal es mitigar riesgos críticos como el envenenamiento de caché (_cache poisoning_) y la suplantación (_spoofing_), escenarios donde un atacante intenta redirigir el tráfico legítimo hacia sitios maliciosos manipulando la resolución de nombres.

-  **Firma digital (RRSIG):** El protocolo garantiza que todos los registros DNS sean firmados digitalmente. Esto permite al cliente verificar que la respuesta recibida proviene de la fuente legítima y no ha sido alterada durante el tránsito.
-  **Cadena de confianza:** Implementa una jerarquía validada criptográficamente que se extiende desde la zona raíz (.) hasta el dominio específico. Esto permite al cliente validar de forma independiente la veracidad de la información DNS en cada nivel del árbol de resolución.
-  **Autenticidad de origen:** Asegura que la información provenga efectivamente de la zona autoritativa (el dueño real del dominio) y no de un intermediario no autorizado, protegiendo al usuario final de conexiones inadvertidas a servidores falsos.
-  **Impacto operativo:** Sin la implementación de DNSSEC, el protocolo DNS es vulnerable a manipulaciones que el sistema operativo o el navegador no pueden detectar por sí mismos, haciendo de esta tecnología un componente esencial para la integridad de la navegación web.