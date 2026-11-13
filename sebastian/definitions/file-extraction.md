---
def-type: atomic
version: 1.0
id: def-file-extraction
status: estandar
category: ciberseguridad
contexto: analisis-de-trafico
date: 2026-11-11
tags:
  - ciberseguridad
  - forense
  - analisis-de-trafico
  - redes
aliases:
  - extracción de archivos
  - file extraction
  - extracción de archivos desde el cable
---
La **extracción de archivos** en análisis de tráfico es la capacidad de **extraer y volver a ensamblar varios tipos de archivos directamente desde el cable** — es decir, desde el flujo de paquetes capturado en la red — sin acceder al disco de los equipos implicados. El archivo viaja fragmentado en paquetes TCP/HTTP/SMB; el extractor reordena los fragmentos, reconstruye el flujo y recupera el archivo original.

#### Cómo Funciona

-  **Reensamblado de sesiones**: la captura sigue cada conexión TCP, reordena los segmentos por número de secuencia y reconstruye el stream completo de bytes.
-  **Reconocimiento de protocolo y fichero**: sobre el stream se identifican los transportes de archivos — HTTP (GET/respuesta), SMB/CIFS en Windows, FTP, correo con adjuntos — y se detectan las firmas de los formatos (_magic bytes_ de PDF, ZIP, imágenes...).
-  **Vaciado del objeto**: los bytes del archivo se vuelcan a disco como evidencia independiente de la captura original.

#### Herramientas Representativas

-  **Wireshark**: `File → Export Objects` extrae archivos de HTTP, SMB, TFTP y más, directamente de una captura.
-  **NetworkMiner**: reconstrucción automática de archivos y credenciales desde pcap.
-  **Zeek**: extracción de archivos programática en línea, integrada en monitoreo de red.

#### Diferencia Crítica: Extracción de Red vs. _File Carving_

-  La extracción **de red** reconstruye archivos a partir del **tráfico capturado**: la fuente es el cable, y el archivo ni siquiera existe todavía en el equipo que analiza.
-  El _file carving_ es **forense de disco**: recupera archivos de un medio de almacenamiento buscando sus cabeceras en los sectores, sin apoyarse en el sistema de archivos.
-  Ambos comparten la idea de "recuperar del flujo bruto", pero el medio cambia: paquetes en tránsito frente a bloques en reposo.

### Propósito fundamental

La extracción de archivos desde el cable convierte una captura pasiva de red en evidencia tangible: permite a un analista ver exactamente qué ficheros entraron o salieron de la red — _malware_ descargado, documentos exfiltrados — sin tocar los endpoints, un pilar del análisis forense de tráfico y la detección de exfiltración.
