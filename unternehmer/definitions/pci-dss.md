---
def-type: atomic
aliases:
  - PCI Data Security Standard
  - Estándar de Seguridad de Datos para la Industria de Tarjeta de Pago
  - PCI-DSS
tags:
  - ciberseguridad/compliance
  - pagos/fintech
  - infosec/normativas
category: framework
contexto: normativa_externa
organismo: PCI Security Standards Council
version: 1
date: 2026-06-13
status: finalizado
---

> **Definición:** Es un conjunto de requisitos técnicos y operativos diseñado para proteger los datos de las tarjetas de pago y a los titulares de las mismas durante todo el ciclo de vida de la transacción.

- **¿Qué protege?**

  La norma se enfoca en asegurar la confidencialidad e integridad de:
  - **Datos del titular (PAN):** Número de tarjeta, nombre del titular, fecha de expiración.
  - **Datos sensibles de autenticación:** Código CVV/CVC, datos de banda magnética o chips.

- **Alcance y aplicación**

  El cumplimiento no es opcional para el ecosistema financiero. Aplica a **toda entidad** que almacene, procese o transmita datos de tarjetas de pago, independientemente de su tamaño.
  - **Responsabilidad:** Las entidades deben implementar controles que cubran redes, sistemas, aplicaciones y procesos de negocio.
  - **Consecuencias del incumplimiento:**
    - Multas económicas severas por parte de los bancos adquirentes.
    - Suspensión de la capacidad para procesar pagos con tarjeta.
    - Daño reputacional y pérdida de confianza del cliente.

- **Relación con otros marcos**

  PCI-DSS no opera en el vacío. Se apoya en buenas prácticas de seguridad general como:
  - La tríada **CIA** (Confidencialidad, Integridad y Disponibilidad).
  - Control de acceso basado en el principio de "mínimo privilegio".
  - Segmentación de redes para aislar el entorno de datos de tarjetas (CDE).
