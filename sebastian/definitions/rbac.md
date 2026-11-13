---
def-type: atomic
version: 1.0
id: def-rbac
status: estandar
category: cloud-computing
contexto: control-de-acceso
date: 2026-11-11
tags:
  - rbac
  - seguridad
  - accesos
  - iam
aliases:
  - rbac
  - role-based access control
  - control de acceso basado en roles
---
**RBAC** (_Role-Based Access Control_ — control de acceso basado en roles) es un **modelo de seguridad que asigna permisos a los usuarios en función de los roles que desempeñan dentro de una organización**: no se pregunta "¿qué puede hacer Fulano?" sino "¿qué puede hacer un EDITOR?" — y Fulano es editor.

#### Cómo Funciona

-  **El permiso se asigna al ROL, no a la persona**: el rol "Administrador de ventas" agrupa los permisos que esa función necesita; los usuarios heredan todo al ocupar el rol.
-  **Cambio de puesto = cambio de rol**: quitar y asignar roles reemplaza el tejido manual de permisos individuales — el ciclo de vida del acceso se vuelve administrable.
-  **Jerarquía**: los roles pueden heredar de otros (un "Supervisor" hereda lo de "Editor") — la estructura refleja la organización real.

#### Por Qué Escala

-  Con 1.000 usuarios y permisos individuales, cada cambio de puesto son horas de cirugía de permisos y errores garantizados.
-  Con RBAC, el acceso se gestiona en decenas de roles: auditables, revisables en bloque y consistentes — el principio de menor privilegio se implementa por diseño, no por esfuerzo heroico.
-  Ejemplo típico en cloud: los roles de AWS/GCP/Azure y los grupos de Entra ID — la identidad del usuario es una; sus permisos, la suma de sus roles.

#### Diferencia Crítica: RBAC vs. ABAC

-  **RBAC** decide por ROL: quién eres en la organización (estático, predefinido).
-  **ABAC** (_Attribute-Based_) decide por ATRIBUTOS: propiedades del usuario, del recurso y del contexto en el momento (departamento = X, recurso confidencial = sí, red = corporativa) — dinámico y granular, pero más complejo de diseñar.
-  La práctica madura los combina: RBAC para el grueso del acceso diario; ABAC (a menudo vía acceso condicional) para los casos que necesitan contexto.

#### Diferencia Crítica: RBAC vs. el Principio de Menor Privilegio

-  El **menor privilegio** es el PRINCIPIO: cada quien tiene lo mínimo para su función.
-  **RBAC** es el MECANISMO que lo implementa a escala: roles bien diseñados son la forma sostenible de conceder lo mínimo — un mal rol ("Admin genérico para todos") es RBAC violando el principio que debía servir.

### Propósito fundamental

RBAC organiza el acceso por funciones en lugar de por personas: los permisos viven en los roles — estables, auditables y coherentes con la estructura real de la organización — la pieza que hace que el principio de menor privilegio sea operable a escala y no una aspiración revisada a mano.
