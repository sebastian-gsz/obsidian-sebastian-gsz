---
def-type: atomic
version: 1.0
id: def-authorization
status: estandar
category: conceptos-generales
contexto: gestión-de-identidad
date: 2026-06-16
tags:
  - identidad
  - acceso
  - privilegios
aliases:
  - authorization
  - autorización
  - access control
  - control de acceso
---
Concepto que define el conjunto de permisos, derechos y niveles de acceso otorgados a una entidad previamente autenticada sobre recursos específicos dentro de un sistema.

-  **Principio Rector:** El **Principio de Menor Privilegio (PoLP)**. Establece que toda entidad debe tener únicamente los accesos mínimos indispensables para ejecutar sus tareas asignadas, limitando el impacto ante posibles compromisos de cuenta.
-  **Modelos de control de acceso:**
    -  **RBAC (Role-Based Access Control):** Los permisos se asignan a roles definidos (ej. administrador, usuario, editor) y los usuarios heredan permisos según su rol.
    -  **ABAC (Attribute-Based-Based Access Control):** Los permisos se otorgan dinámicamente basados en atributos (ej. horario, ubicación, dispositivo utilizado).
    -  **DAC/MAC:** Modelos discrecionales o obligatorios basados en la propiedad del recurso o etiquetas de seguridad.
-  **Diferencia clave:** Mientras que la **Autenticación** verifica _quién_ es el usuario, la **Autorización** determina _qué_ puede hacer.