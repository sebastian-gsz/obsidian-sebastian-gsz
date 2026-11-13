---
def-type: atomic
version: 1.0
id: def-pppoe
status: estandar
category: protocolos-de-red
contexto: systemtechnik
date: 2026-11-11
tags:
  - protocolos
  - red
  - acceso
aliases:
  - point-to-point protocol over ethernet
  - protocolo punto a punto sobre ethernet
---
**PPPoE** es un protocolo que combina las características del PPP (Point-to-Point Protocol) con la infraestructura de redes Ethernet; se utiliza principalmente para proporcionar conexiones de acceso a Internet donde se necesita autenticación individualizada por usuario, como en servicios DSL o fibra óptica.

### Fases del proceso

-  **``Fase 1`` — Descubrimiento (PPPoE Discovery Stage)**: El cliente y el servidor se encuentran y negocian la conexión:

	-  **PADI (PPPoE Active Discovery Initiation):** El cliente envía un paquete de descubrimiento a todos los servidores disponibles.
	-  **PADO (PPPoE Active Discovery Offer):** Los servidores responden ofreciendo sus servicios.
	-  **PADR (PPPoE Active Discovery Request):** El cliente selecciona un servidor y envía una solicitud formal.
	-  **PADS (PPPoE Active Discovery Session-confirmation):** El servidor confirma la sesión y asigna un identificador de sesión (Session ID).
-  **``Fase 2`` — Sesión PPP (PPP Session Stage)**: Una vez establecida la conexión, PPP toma el control para negociar parámetros como direcciones IP, autenticación (PAP o CHAP) y otros aspectos de la comunicación.

### ¿Quiénes lo utilizan además de los ISP?

-  **Empresas con múltiples sedes**: conexiones individuales y seguras entre cada sucursal y el centro de datos central, con gestión centralizada de autenticación y facturación.
-  **Universidades y campus**: acceso a Internet individualizado para estudiantes, profesores y personal, con monitoreo del uso de recursos.
-  **Redes Wi-Fi públicas (hotspots)**: autenticación previa al acceso y facturación por uso o tiempo de conexión.
-  **Operadores de fibra punto a punto (FTTH)**: gestión de conexiones individuales y identificación única de cada cliente.

### Propósito fundamental

PPPoE permite que una red Ethernet compartida entregue sesiones punto a punto con autenticación y contabilidad por usuario, heredando el modelo de acceso del mundo telefónico a las redes modernas.
