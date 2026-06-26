---
def-type: atomic
version: 1.0
id: def-self-hosted
status: estandar
category: conceptos-generales
contexto: software
date: 2026-06-26
tags:
  - infraestructura
  - despliegue
  - soberanía
aliases:
  - self-hosted
  - on-premises
  - auto-hospedado
  - auto hospedado
---
La modalidad _self-hosted_ o _on-premises_ define el modelo operativo donde una organización o individuo asume la propiedad total de la infraestructura (física o virtual) necesaria para ejecutar sus servicios y aplicaciones. A diferencia del modelo de nube pública, donde la responsabilidad es compartida, aquí el cliente retiene la soberanía absoluta sobre la capa de ejecución.

#### Ventajas de la soberanía

El modelo _on-premises_ es frecuentemente la elección estratégica en sectores donde la privacidad y el control son innegociables:

-  **Control soberano sobre los datos:** Los datos residen en infraestructura propia, eliminando riesgos de jurisdicción legal asociados a proveedores de nube pública.
-  **Cumplimiento normativo estricto:** Facilita la auditoría de controles físicos y lógicos requeridos por marcos regulatorios específicos (ej. banca, defensa, sector público).
-  **Ausencia de Vendor Lock-in:** Se elimina la dependencia de las APIs o ecosistemas cerrados de un proveedor de nube específico, permitiendo mayor libertad de movimiento y portabilidad técnica.

#### Desafíos operativos

La autonomía conlleva una carga administrativa y técnica total (_full-stack responsibility_):

-  **Gestión del ciclo de vida:** El usuario es responsable de todo, desde la instalación inicial hasta la aplicación de parches de seguridad y actualizaciones de _firmware_.
-  **Seguridad integral:** La responsabilidad abarca desde la seguridad física del centro de datos (acceso, energía, refrigeración) hasta la seguridad lógica (segmentación de red, firewalls, cifrado).
-  **Alta disponibilidad:** Garantizar el tiempo de actividad (_uptime_) recae exclusivamente en la arquitectura interna; la redundancia de hardware, energía y conectividad debe ser diseñada y mantenida por el equipo interno.

#### Estrategia de adopción

Esta estrategia es ideal para cargas de trabajo críticas que requieren latencias ultrabajas, manipulación de datos altamente sensibles o cuando el costo de transferencia de datos (_egress costs_) en la nube pública se vuelve prohibitivo para la escala de la operación. La clave reside en la capacidad del equipo técnico para gestionar la infraestructura con la misma eficiencia que un proveedor de servicios gestionados.