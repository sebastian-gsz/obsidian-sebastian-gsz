---
def-type: atomic
version: 1.0
id: def-acl
status: estandar
category: conceptos-generales
contexto: seguridad-informatica
date: 2026-06-21
tags:
  - seguridad
  - control-de-acceso
  - permisos
  - gobernanza
aliases:
  - acl
  - access control list
  - lista de control de acceso
---
Una lista de control de acceso (ACL) es un conjunto de reglas o filtros aplicados a un objeto (archivo, directorio, interfaz de red o servicio) que determina qué permisos tiene una entidad específica (usuario, grupo o sistema) sobre dicho recurso.

**Funcionamiento:** Funciona como una tabla de decisiones que el sistema consulta ante cada solicitud de acceso. Cada entrada en la lista especifica la identidad del sujeto y la operación permitida (lectura, escritura, ejecución, denegación).

**Tipos comunes:**

- **ACL de archivos:** Administradas por el sistema operativo (NTFS, POSIX) para controlar acceso a nivel de usuario.
- **ACL de red:** Aplicadas en routers y firewalls para filtrar paquetes basándose en direcciones IP, puertos y protocolos, actuando como una barrera de seguridad perimetral.

**Propósito:** Implementar el principio de menor privilegio, asegurando que solo las entidades autorizadas puedan interactuar con los recursos protegidos.