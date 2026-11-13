---
def-type: atomic
version: 1.0
id: def-exposure
status: estandar
category: ciberseguridad
contexto: gestion-de-riesgos
date: 2026-11-11
tags:
  - ciberseguridad
  - riesgos
  - superficie-de-ataque
aliases:
  - exposición
  - exposure
---
La **exposición** es la condición de accesibilidad de un activo, servicio o vulnerabilidad frente a una amenaza potencial. Mientras que una vulnerabilidad es la debilidad técnica en sí misma, la exposición es el estado que permite que dicha debilidad sea alcanzable y, por lo tanto, explotable por un atacante.

#### Diferencia Crítica: Vulnerabilidad vs. Exposición
Para comprender la exposición, es fundamental diferenciarla de conceptos relacionados:

-  **Vulnerabilidad:** El "agujero" en el muro (ej. un servicio de SSH con una versión obsoleta).
-  **Exposición:** El hecho de que el muro esté dando a la calle y no tenga valla (ej. que el puerto 22 esté abierto al internet público).
-  **Riesgo:** La probabilidad de que alguien encuentre el agujero y la magnitud del daño si entra.

#### Gestión de la Exposición
La reducción de la exposición es una de las estrategias más efectivas de defensa en profundidad (**Defense in Depth**), ya que permite mitigar el riesgo incluso cuando no es posible corregir la vulnerabilidad inmediatamente:

-  **Segmentación de red:** Aislar activos críticos en VLANs privadas.
-  **Firewalls / ACLs:** Restringir quién puede llegar al servicio.
-  **VPNs:** Obligar a que el acceso sea a través de un túnel seguro.

**Regla de oro:** Un activo sin exposición es, en la práctica, un activo seguro, independientemente de cuántas vulnerabilidades internas posea.
