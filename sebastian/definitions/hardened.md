---
def-type: atomic
version: 1.0
id: def-hardening
status: estandar
category: gobernanza-y-seguridad
contexto: ingeniería-de-sistemas
date: 2026-06-20
tags:
  - ciberseguridad
  - infraestructura
  - hardening
aliases:
  - hardening
  - endurecimiento
  - fortalecimiento de sistemas
---
El _hardening_ (endurecimiento) es el proceso técnico de asegurar un sistema, servidor o aplicación mediante la reducción de su superficie de ataque. Esto se logra eliminando funciones innecesarias, cerrando puertos, deshabilitando servicios superfluos y aplicando configuraciones de seguridad estrictas.

### Objetivos y prácticas

-  **Objetivo principal:** Minimizar las vulnerabilidades explotables limitando las vías de entrada al sistema.
-  **Eliminación de software innecesario:** Desinstalar cualquier componente que no sea estrictamente requerido para la operación.
-  **Principio de menor privilegio:** Asegurar que usuarios y procesos posean exclusivamente los permisos mínimos necesarios para ejecutar sus funciones.
-  **Gestión de parches:** Mantener el software actualizado con las correcciones de seguridad más recientes.
-  **Configuración de seguridad:** Aplicar perfiles basados en estándares (ej. CIS Benchmarks) para inhabilitar protocolos obsoletos y configurar cifrado por defecto.
-  **Defensa en profundidad:** Es un componente crítico que dificulta el compromiso del sistema incluso si un atacante obtiene acceso inicial a la red.

### Hardening por Ámbito

-  **Administración de Sistemas (OS):** Centrado en kernel y espacio de usuario, implementando controles de acceso (SELinux/AppArmor) y asegurando el sistema de archivos.
-  **Ciberseguridad (Network/Application):** Enfocado en el perímetro y la lógica de validación mediante WAF, segmentación (VLANs), cifrado TLS 1.3 y validación de entradas contra inyecciones.
-  **Arquitectura Cloud:** Gestión del plano de control y APIs mediante IAM, auditoría (CloudTrail), cifrado de volúmenes (KMS) y políticas _deny-all_ en Security Groups.
-  **Ciencia de Datos:** Protección del pipeline de datos mediante anonimización, validación frente a _data poisoning_ y protección de endpoints contra ataques adversarios.

**Nota de Arquitecto:** Un sistema _hardened_ es aquel que, por defecto, se comporta como si estuviera bajo ataque constante.