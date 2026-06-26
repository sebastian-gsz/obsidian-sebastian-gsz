---
def-type: atomic
version: 1.0
id: def-pci-dss
status: finalizado
category: framework
contexto: normativa_externa
organismo: PCI Security Standards Council
date: 2026-06-13
tags:
  - ciberseguridad/compliance
  - pagos/fintech
  - infosec/normativas
aliases:
  - pci data security standard
  - estándar de seguridad de datos para la industria de tarjeta de pago
  - pci-dss
---
El PCI-DSS es el marco de referencia global obligatorio para cualquier entidad que almacene, procese o transmita datos de tarjetas de pago. Su diseño no es meramente administrativo, sino un conjunto de requisitos técnicos críticos para garantizar la seguridad del **Cardholder Data Environment (CDE)**.

#### Alcance y protección del CDE

La norma define estrictamente qué datos deben protegerse y bajo qué condiciones:

-  **Datos del titular (PAN):** El número de tarjeta debe ser cifrado, truncado o tokenizado cuando se almacena.
-  **Datos sensibles de autenticación:** Información como el código CVV/CVC o datos de banda magnética que, tras la autorización, no deben almacenarse bajo ninguna circunstancia.

#### Pilares de la arquitectura de cumplimiento

El cumplimiento de PCI-DSS en entornos cloud e infraestructura moderna se apoya en tres controles arquitectónicos fundamentales:

-  **Segmentación de redes:** Es el requisito más crítico. Se debe aislar el CDE del resto de la red corporativa. Si un servidor web o un puesto de trabajo no necesita acceder a datos de tarjetas, no debe estar en la misma red. La segmentación reduce drásticamente el alcance de las auditorías.
-  **Control de acceso y mínimos privilegios:** Implementación de IAM (Identity and Access Management) riguroso. Cada acceso al CDE debe ser identificado, autenticado (con MFA) y registrado.
-  **Monitorización continua:** La infraestructura debe ser capaz de detectar y alertar sobre cambios en archivos críticos, accesos no autorizados y actividad sospechosa, alimentando esta información a sistemas de gestión de logs y SIEM.

#### Riesgos operativos por incumplimiento

El incumplimiento del estándar no solo acarrea sanciones financieras por parte de los bancos adquirentes, sino que puede comprometer la licencia de operación:

-  **Sanciones:** Multas recurrentes mensuales mientras se mantenga el incumplimiento.
-  **Operatividad:** Revocación de la capacidad para procesar transacciones (bloqueo de pasarelas de pago).
-  **Responsabilidad civil:** El daño reputacional tras una brecha de datos (data breach) es, a menudo, más costoso que las multas regulatorias, debido a la pérdida de confianza de los clientes y los costes legales derivados.
