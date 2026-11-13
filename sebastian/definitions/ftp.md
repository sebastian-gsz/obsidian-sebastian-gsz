---
def-type: atomic
version: 1.0
id: def-ftp
status: estandar
category: redes
contexto: transferencia-de-archivos
date: 2026-11-11
tags:
  - redes
  - protocolos
  - transferencia-de-archivos
aliases:
  - protocolo ftp
  - file transfer protocol
  - ftp
---
**FTP** (_File Transfer Protocol_) es un protocolo de red estándar para **transferir archivos entre dos sistemas conectados a una red TCP/IP**, basado en un modelo cliente-servidor: un cliente FTP se conecta a un servidor FTP para subir, descargar y gestionar archivos remotos.

#### Mecánica Técnica: dos canales separados

-  **Canal de control**: intercambia comandos y respuestas (conectarse, enumerar directorios, descargar, cargar). Los códigos de respuesta numéricos indican el resultado de cada operación (`200` éxito, `550` archivo no disponible...).
-  **Canal de datos**: transporta el contenido real de los archivos, independiente del canal de comandos — una separación que hace el protocolo eficiente pero que complica su paso por firewalls y NAT.
-  Comandos típicos: `USER`/`PASS` (autenticación), `LIST` (enumerar), `RETR` (descargar), `STOR` (cargar).

#### Ventajas y Desventajas

-  **Ventajas**: protocolo sencillo y fácil de usar; eficiente gracias a sus dos canales; estándar universal compatible con casi todos los sistemas operativos y dispositivos.
-  **Desventajas**: **no es seguro** — datos y credenciales viajan en texto sin cifrar, interceptables con un simple sniffer; y no gestiona eficientemente archivos muy grandes o conexiones inestables.

#### Diferencia Crítica: FTP vs. sus sucesores seguros

FTP heredó la confianza de una era pre-Internet en la que el tráfico no se espiaba; hoy sus variantes seguras lo reemplazan: **FTPS** (FTP cifrado con TLS), **SFTP** (transferencia sobre SSH, un protocolo distinto que no comparte los dos canales) y **SCP**. Para cualquier transferencia que cruce Internet, el FTP plano es inaceptable: expone contenido y contraseñas por igual.

### Propósito fundamental

FTP definió el estándar de cómo mueve archivos una red TCP/IP — y su principal lección: la eficiencia sin cifrado es una eficiencia inútil, porque cualquier intermedio puede leerlo todo. Sigue vivo en redes internas de confianza, pero como protocolo expuesto es una vulnerabilidad, no una función.
