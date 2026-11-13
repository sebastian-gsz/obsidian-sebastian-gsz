---
def-type: atomic
version: 1.0
id: def-grpc
status: estandar
category: desarrollo-software
contexto: microservicios
date: 2026-11-11
tags:
  - grpc
  - microservicios
  - http2
  - api
aliases:
  - grpc remote procedure call
  - llamada a procedimiento remoto
  - rpc de google
---
**gRPC** (_gRPC Remote Procedure Call_) es un _framework_ de código abierto desarrollado por Google que **permite a una aplicación llamar a un método en otro ordenador (servidor) como si fuera una llamada de método local**. Utiliza **HTTP/2** como protocolo de transporte y está optimizado para la alta eficiencia y la comunicación entre microservicios — más rápido y ligero que los protocolos tradicionales basados en texto.

#### Cómo Funciona

-  **Contrato primero**: los servicios se definen en un archivo `.proto` (interfaz con métodos, parámetros y tipos); de ahí se **genera automáticamente el código cliente y servidor** en los lenguajes del proyecto — cliente y servidor hablan el mismo contrato sin negociar formatos.
-  **Serialización binaria**: los mensajes viajan en _Protocol Buffers_ (protobuf) — un formato binario compacto, mucho más pequeño y rápido de parsear que JSON en texto.
-  **HTTP/2 de transporte**: multiplexa muchas llamadas simultáneas en una sola conexión y habilita **streaming bidireccional** (flujos de mensajes en ambas direcciones), además de timeouts y cancelación por llamada.

#### Diferencia Crítica: gRPC vs. REST

-  **REST** habla recursos sobre HTTP/1.1 con JSON en texto: universal, legible con cualquier herramienta, ideal para **APIs públicas** y navegadores.
-  **gRPC** habla métodos sobre HTTP/2 con protobuf binario: llamadas tipadas, latencia mínima y streaming — ideal para la **comunicación interna entre microservicios**, donde el rendimiento manda y ambas partes comparten el contrato `.proto`.
-  La regla práctica: hacia afuera, REST por compatibilidad; entre tus propios servicios, gRPC por eficiencia.

### Propósito fundamental

gRPC devuelve la programación distribuida a su forma más natural: llamar a una función que vive en otra máquina como si fuera local — y con protobuf y HTTP/2 hace que esa ilusión sea además la opción más rápida y barata en tráfico interno, que es exactamente lo que una malla de microservicios necesita a escala.
