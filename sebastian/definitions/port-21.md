---
def-type: atomic
version: 1.0
id: def-port-21
status: estandar
category: redes
contexto: servicios-de-red
date: 2026-11-11
tags:
  - puertos
  - ftp
  - redes
aliases:
  - puerto 21
  - port 21
  - puerto ftp
---
El **puerto 21** es el puerto estándar del **protocolo FTP** (_File Transfer Protocol_) — **utilizado para establecer la conexión de CONTROL** entre el cliente y el servidor FTP: por él viajan los comandos y respuestas, no los archivos. Es uno de los puertos más antiguos y reconocibles de Internet.

#### Los Dos Canales del FTP

-  **Puerto 21 (control)**: comandos (`USER`, `PASS`, `LIST`, `RETR`, `STOR`) y sus códigos de respuesta — la conversación que dirige la sesión.
-  **Los datos van por OTROS puertos**: la transferencia real de archivos usa un canal de datos separado — la arquitectura de dos canales que define a FTP.

#### Los Dos Modos de Operación

-  **Modo activo**: el **cliente abre un puerto y espera** la conexión del servidor — el servidor conecta a ese puerto de datos (por defecto el 20). Problema: el firewall del cliente suele bloquear conexiones entrantes.
-  **Modo pasivo**: el **servidor abre un puerto y espera** la conexión del cliente — friendly con firewalls de cliente; por eso el pasivo es el modo dominante hoy.
-  La negociación del modo y del puerto de datos viaja por el 21 — el canal de control dirige todo.

#### Contexto y Seguridad

-  FTP en texto plano: credenciales y archivos sin cifrar — sobre internet, el reemplazo es **SFTP** o **FTPS**; el puerto 21 abierto al mundo es hoy señal de sistema heredado o de descuido.
-  En auditorías, el puerto 21 responde con el banner del servidor FTP — enumeración clásica: versión, login anónimo habilitado, permisos.

#### Diferencia Crítica: Puerto 21 (control) vs. Puerto 20 (datos)

-  En modo activo, el **21 lleva los comandos** y el **20 lleva los datos** — dos puertos, dos canales, una sesión.
-  La confusión típica: "FTP es el puerto 21" — cierto para el control, incompleto para la transferencia — y en modo pasivo ni siquiera el 20: el servidor abre puertos altos dinámicos que el firewall debe permitir.

### Propósito fundamental

El puerto 21 es el canal de mando del FTP: por él corren los comandos que dirigen cada transferencia, mientras los datos toman otros caminos — entenderlo es entender la arquitectura de dos canales de FTP, sus modos activo/pasivo y por qué el 21 abierto hoy es más un hallazgo de auditoría que un servicio legítimo.
