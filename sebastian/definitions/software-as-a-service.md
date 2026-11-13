---
def-type: atomic
version: 1.0
id: def-saas
status: estandar
category: computacion-en-la-nube
contexto: modelos-de-servicio
date: 2026-07-03
tags:
  - saas
  - software
  - nube
  - aplicaciones
  - suscripcion
aliases:
  - saas
  - software as a service
---
El software como servicio es un modelo de distribución de software en la nube donde el proveedor aloja, mantiene y gestiona las aplicaciones, ofreciéndolas a los usuarios a través de internet, generalmente mediante un navegador web o APIs. El usuario final no tiene control ni responsabilidad sobre la infraestructura, la plataforma ni el código de la aplicación.

#### Características técnicas

-  **Multi-inquilino:** El sistema está diseñado para servir a múltiples clientes (tenants) desde una única instancia de software, garantizando el aislamiento lógico de los datos.
-  **Modelo de suscripción:** Se basa en esquemas de pago por uso o licencias por usuario/tiempo, lo que elimina la necesidad de compras de software perpetuo o despliegue local.
-  **Mantenimiento centralizado:** El proveedor gestiona automáticamente las actualizaciones, los parches de seguridad y las copias de seguridad, eliminando la carga operativa para el cliente.

#### Propósito arquitectónico

SaaS representa el mayor nivel de abstracción en los modelos de servicio en la nube. Permite a las organizaciones delegar la gestión operativa de herramientas críticas (como CRM, ERP, o suites de productividad) al proveedor, permitiendo que el equipo se enfoque exclusivamente en el uso, la configuración y la integración de los datos empresariales.