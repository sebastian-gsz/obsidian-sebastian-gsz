---
def-type: atomic
aliases:
  - azure scope
  - Ámbito Azure
tags:
  - azure
  - gobernanza
  - IAM
  - cloud
category: gobernanza-cloud
contexto: administración-de-nube
version: 1
date: 2026-06-16
status: estandar
---
Se refiere al nivel dentro de la estructura jerárquica de Azure donde se aplican configuraciones, políticas de gobernanza (Azure Policy) o asignaciones de control de acceso basado en roles (RBAC).

*  **Faceta de administración y facturación**: La jerarquía permite una organización lógica que va desde lo más general (Grupo de Administración) hasta lo específico (Recurso). Esto facilita la gestión centralizada de presupuestos y la herencia de configuraciones.
*  **Faceta de seguridad (RBAC)**: Determina el alcance de los permisos. Un rol asignado en un ámbito superior se **hereda** automáticamente en todos los niveles inferiores, permitiendo delegar administración de forma granular o masiva.
*  **Jerarquía técnica**:
  
    1. **Grupo de Administración**: Gobernanza global para múltiples suscripciones.
    2. **Suscripción**: Límite lógico de facturación y despliegue.
    3. **Grupo de Recursos**: Contenedor para activos relacionados de un mismo ciclo de vida.
    4. **Recurso**: La instancia individual de servicio.
*  **Propósito**: Garantizar que los controles de seguridad y las políticas de negocio se apliquen de manera consistente y escalable a través de toda la infraestructura.