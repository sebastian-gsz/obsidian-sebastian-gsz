---
def-type: atomic
version: 1.0
id: def-azure-scope
status: estandar
category: gobernanza-cloud
contexto: administración-de-nube
date: 2026-06-16
tags:
  - azure
  - gobernanza
  - iam
  - cloud
aliases:
  - azure scope
  - ámbito azure
  - azure hierarchy
  - jerarquía azure
---
Se refiere al nivel dentro de la estructura jerárquica de Azure donde se aplican configuraciones, políticas de gobernanza (_Azure Policy_) o asignaciones de control de acceso basado en roles (_RBAC_).

-  **Jerarquía de niveles (de mayor a menor alcance):**
    
    -  **Grupo de Administración:** Gobernanza global y cumplimiento para múltiples suscripciones.
    -  **Suscripción:** Unidad lógica de facturación, límites de servicio y despliegue.
    -  **Grupo de Recursos:** Contenedor lógico que agrupa recursos con un ciclo de vida compartido.
    -  **Recurso:** Instancia específica de un servicio (VM, Base de datos, etc.).
-  **Faceta de herencia:**
    
    -  Las políticas y permisos asignados en un ámbito superior se heredan automáticamente en todos los niveles inferiores (_Child scopes_).
    -  Permite delegar administración de forma granular o masiva según sea necesario.
-  **Propósito estratégico:** Garantizar que los controles de seguridad, el cumplimiento normativo y la gestión de costos se apliquen de manera consistente y escalable a toda la infraestructura _cloud_.