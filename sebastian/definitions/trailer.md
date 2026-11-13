---
def-type: atomic
version: 1.0
id: def-trailer
status: estandar
category: redes
contexto: enlace-de-datos
date: 2026-11-12
tags:
  - redes
  - ethernet
  - tramas
aliases:
  - trailer
  - trailer de trama
  - tráiler de trama
---
El **trailer** se utiliza principalmente en la **capa 2 de enlace de datos** para **agregar información de control y detección de errores al final de los marcos de datos** antes de transmitirlos: cuando los datos de la capa 3 se encapsulan en tramas, el trailer es el remate que cierra el sobre — y su contenido crítico es la verificación de integridad.

#### **Qué puede contener un trailer**

1.  **Checksum/CRC (_Cyclic Redundancy Check_)**: la técnica de detección de errores — el receptor calcula el CRC de lo recibido y lo compara con el transmitido; si difieren, la trama se corrompió (el átomo FCS de este glosario detalla la mecánica).
2.  **Direcciones de destino y fuente**: generalmente van en el ENCABEZADO — algunos protocolos exóticos podrían incluirlas al final, pero **en la práctica habitual (Ethernet) las direcciones siempre van en el encabezado**.
3.  **Tipo/Longitud**: el protocolo de la capa superior o la longitud del marco.
4.  **Control de flujo y de error**: información adicional según el diseño del protocolo.
#### **El trailer en Ethernet**

-  **Campo FCS (Frame Check Sequence)**: un **CRC de 32 bits** — la verificación de integridad del marco (4 bytes al final).
-  **Padding**: bytes de relleno para garantizar la **longitud mínima** del marco (64 bytes totales).
#### **La estructura completa de una trama Ethernet**

1.  **Encabezado de Destino** (6 bytes): dirección MAC del receptor.
2.  **Encabezado de Origen** (6 bytes): dirección MAC del emisor.
3.  **Tipo/Length** (2 bytes): el protocolo de la capa de red (IPv4, ARP...) o la longitud.
4.  **Payload** (variable): los datos propiamente dichos — mínimo 46, máximo 1500 bytes, con **padding** si no se alcanza el mínimo.
5.  **Trailer** (FCS — 4 bytes): el Frame Check Sequence que verifica la integridad.
-  🗒️ **Nota**: con etiquetado **VLAN (802.1Q)**, el campo VLAN (4 bytes adicionales) se inserta entre la dirección de origen y el Tipo/Length.
#### **Diferencia crítica: Header vs. Trailer**

-  El **header** ANUNCIA: quién envía, a quién, qué contiene — la información que se necesita ANTES de procesar la trama.
-  El **trailer** VERIFICA: la integridad de lo que ya llegó — la información que se evalúa DESPUÉS de recibirla.
-  La lógica del diseño: lo que dirige va delante; lo que certifica va detrás — y en Ethernet, el trailer es esencialmente el FCS.
### Propósito fundamental

El trailer es el sello de verificación de la trama: cierra el sobre de la capa 2 con el CRC que certifica que lo que llegó es lo que salió — la contraparte final del encabezado, y el lugar donde Ethernet puso su apuesta de integridad: cuatro bytes de FCS que validan cada uno de los millones de marcos por segundo.
