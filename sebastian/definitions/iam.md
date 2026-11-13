---
def-type: atomic
version: 1.0
id: def-iam
status: estandar
category: identidad-y-acceso
contexto: control-de-acceso
date: 2026-11-11
tags:
  - iam
  - identidad
  - acceso
  - cuentas
aliases:
  - gestión de identidad y acceso
  - identity and access management
  - iam
---
La **gestión de identidad y acceso** (_IAM_ — _Identity and Access Management_) es el conjunto de **procesos y tecnologías que administran las cuentas digitales** de una organización: quién existe como identidad, cómo prueba que es quien dice ser, qué puede hacer una vez dentro, y cómo nace, cambia y muere esa cuenta.

#### Sus Cuatro Funciones

-  **Identificación**: cada usuario, servicio o dispositivo tiene una identidad única en el sistema.
-  **Autenticación**: verificar que quien reclama la identidad es realmente esa identidad (contraseñas, MFA, certificados, biometría).
-  **Autorización**: decidir qué puede hacer la identidad autenticada — roles, permisos, políticas de mínimo privilegio.
-  **Ciclo de vida (aprovisionamiento)**: la administración de la cuenta de principio a fin.

#### El Aprovisionamiento de Usuarios

Es la parte operativa del ciclo de vida: **crear, modificar, suspender y eliminar cuentas** en todos los sistemas según el estado de la persona — alta de empleado (onboarding) con sus accesos mínimos, cambios de rol (ajuste de permisos), y baja (offboarding) con revocación inmediata de todo acceso. Un aprovisionamiento descuidado deja cuentas huérfanas: identidades activas de gente que ya no está — una de las vías de entrada favoritas de los atacantes.

#### Diferencia Crítica: IAM vs. sus subprocesos

-  **Autenticación** y **autorización** son funciones técnicas puntuales — verificar y decidir en cada acceso.
-  **IAM** es la disciplina completa que las orquesta junto al ciclo de vida: incluye la gobernanza de las identidades (quién aprueba un acceso, cada cuánto se revisa, cómo se audita).
-  La autenticación responde "¿eres tú?"; IAM responde además "¿quién te dio acceso, por qué, y debería seguir teniéndolo?".

### Propósito fundamental

IAM es la base de todo modelo de seguridad: cada ataque necesita una identidad para moverse, y un IAM sano garantiza que solo existan las identidades necesarias, que prueben serlo y que tengan exactamente los permisos mínimos — reducir IAM a contraseñas es dejar la puerta con la cerradura puesta pero la llave pegada.
