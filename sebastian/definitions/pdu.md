---
def-type: atomic
version: 1.0
id: def-pdu
status: estandar
category: redes
contexto: protocolos-y-modelos
date: 2026-11-11
tags:
  - redes
  - osi
  - protocolos
aliases:
  - pdu
  - protocol data unit
  - unidad de datos del protocolo
---
Una **PDU** (_Protocol Data Unit_ — unidad de datos del protocolo) es el **bloque de datos que se transmite a través de una red usando un protocolo de comunicación específico**: el nombre oficial que recibe la información EN CADA CAPA del modelo OSI — y cada capa le pone nombre distinto.

#### El Nombre Según la Capa

| Capa OSI | PDU | Qué añade |
|---|---|---|
| Aplicación (5-7) | **Datos** | presentación, sesión, aplicación |
| Transporte (4) | **Segmento** | puertos, número de secuencia y confirmación |
| Red (3) | **Paquete** | direcciones IP, TTL, enrutamiento |
| Enlace de datos (2) | **Trama** (_frame_) | direcciones MAC, control de errores (FCS) |
| Física (1) | **Bits** | transmisión cruda, sin estructura de datos |

#### La Encapsulación: la Cadena de Matrioskas

La PDU de la capa superior **se encapsula** en la PDU de la capa inferior — cada capa añade su información relevante:

-  El mensaje de la aplicación (Datos) se convierte en **segmento** TCP (capa de transporte).
-  El segmento se encapsula en **paquete** IP (capa de red) — con la dirección IP de destino.
-  El paquete se encapsula en **trama** Ethernet (capa de enlace) — con las MAC origen/destino.
-  La trama sale como **bits** por el medio físico.
-  En el receptor ocurre lo inverso — **desencapsulación**: cada capa retira su envoltorio y entrega al siguiente nivel.

#### El Ejemplo del Mensaje

Envías un mensaje desde tu teléfono: los Datos (capa 7) se codifican (6) y organizan en sesión (5); se convierten en **segmento** TCP (4); el segmento se encapsula en **paquete** IP (3); el paquete se convierte en **trama** Ethernet o WiFi (2); y sale como **bits** (1) — al llegar, la pila del receptor desarma cada capa hasta entregar los Datos intactos a la app del destinatario.

#### Diferencia Crítica: Segmento vs. Paquete vs. Trama

-  No son tamaños ni sinónimos: son LA MISMA carga en distintas capas, cada una con SU envoltorio — el segmento lleva puertos; el paquete lleva IPs; la trama lleva MACs.
-  La prueba de concepto: "el paquete IP dentro de la trama" es correcto; "el paquete TCP" es un lapsus de capa — cada PDU lleva el nombre de su capa.

### Propósito fundamental

La PDU es el vocabulario que ordena el viaje de los datos: mismo contenido, distintos envoltorios por capa — datos, segmento, paquete, trama, bits — y entender la encapsulación es entender por qué un mensaje que sale de tu teléfono puede llegar intacto al otro lado del mundo: cada capa cuidó su parte.
