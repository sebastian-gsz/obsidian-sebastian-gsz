---
def-type: atomic
version: 1.0
id: def-nist-sp-800-53
status: estandar
category: ciberseguridad
contexto: gobernanza
date: 2026-11-11
tags:
  - nist
  - controles
  - cumplimiento
  - gobernanza
aliases:
  - nist sp 800-53
  - sp 800-53
  - 800-53
---
**NIST SP 800-53** es una **publicación especial del NIST que proporciona un catálogo de controles de seguridad y privacidad para sistemas de información**: la lista maestra y detallada de controles que un sistema federal estadounidense debe implementar — y el catálogo de referencia que la industria adopta como base de sus propios programas.

#### Cómo se Organiza: Familias e Identificadores

-  Los controles se agrupan en **familias** por área, cada una con un código: **AC** (Control de Acceso), **IA** (Identificación y Autenticación), AU (auditoría), CM (gestión de configuración), IR (respuesta a incidentes), entre otras.
-  Cada control lleva un identificador único: **AC-2** (gestión de cuentas), **AC-3** (aplicación del acceso), **IA-2** (identificación y autenticación de usuarios, incluidos los privilegiados), **IA-8** (identificación y autenticación no organizacional) — controles que abordan la gestión de cuentas, la aplicación del acceso y la autenticación.
-  Cada control se **basal y reforza por líneas de base** (low, moderate, high) según la categoría de impacto del sistema.

#### Su Relación con el Ecosistema NIST

-  **El CSF** (Cybersecurity Framework) organiza el programa en funciones estratégicas — identificar, proteger, detectar, responder, recuperar.
-  **SP 800-53** es el catálogo concreto que ejecuta la función "Proteger" (y las demás): el CSF dice QUÉ dimensiones cubrir; la SP 800-53 lista los controles EXACTOS con qué implementarlas.
-  Se seleccionan y ajustan con **SP 800-53B** (líneas de base y tailoring) — el catálogo aplicado a tu contexto.

#### Diferencia Crítica: Catálogo de Controles vs. Marco

-  El **marco (CSF)** es la arquitectura del programa: funciones y categorías — el plano del edificio.
-  El **catálogo (SP 800-53)** es el listado de materiales: cada control con su identificador, requisitos y guías de evaluación.
-  La confusión común es citarlos como equivalentes: uno organiza, el otro especifica — un programa maduro usa el marco para estructurar y el catálogo para implementar y auditar.

### Propósito fundamental

NIST SP 800-53 es el diccionario de controles de seguridad: convierte "proteger el sistema" en controles identificables, medibles y auditables (AC-2, IA-2...) — el puente entre la política de seguridad y la implementación verificable, y la base de la línea de base de controles de cualquier organización seria.
