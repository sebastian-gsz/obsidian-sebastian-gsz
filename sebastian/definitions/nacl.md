---
def-type: atomic
version: 1.0
id: def-nacl
status: estandar
category: cloud-computing
contexto: defensa-corporativa
date: 2026-11-11
tags:
  - aws
  - seguridad
  - redes
  - nacl
aliases:
  - nacl
  - network access control list
  - lista de control de acceso de red
---
Una **NACL** (_Network Access Control List_ — lista de control de acceso de red) es una **capa de seguridad adicional a nivel de subred en AWS que permite o deniega el tráfico hacia los recursos de la subred**: el firewall opcional que filtra en la puerta del barrio, antes de llegar a cada casa.

#### Sus Propiedades Clave

-  **Opera a nivel de subred**, no de instancia: una misma NACL cubre todos los recursos de la subred que la usa.
-  Aplica reglas explícitas de **permitir (allow) o denegar (deny)** el tráfico entrante y saliente — puede denegar explícitamente, algo que los Security Groups no pueden.
-  Las reglas se procesan **en orden numérico, comenzando por el más bajo** — la primera regla que matchea decide; por eso dejar huecos de numeración (100, 110, 120...) es práctica estándar para poder insertar reglas después.
-  Es **stateless** (sin estado): cada paquete se evalúa de forma independiente — debes configurar **reglas separadas para entrada y salida**, incluido el tráfico de respuesta de una conexión que tú iniciaste.

#### El Escudo de Dos Capas de AWS

Tráfico entrante → **NACL de la subred** → **Security Group de la instancia** → recurso. Dos filtros independientes: la NACL es la puerta del barrio y el Security Group la puerta de casa — la defensa en profundidad aplicada a la red cloud.

#### Diferencia Crítica: NACL vs. Security Group

-  **NACL**: a nivel de **subred**, **stateless** (reglas duplicadas entrada/salida), soporta reglas **deny**, se evalúa por orden numérico.
-  **Security Group**: a nivel de **instancia**, **stateful** (las respuestas de una conexión permitida vuelven sin reglas extra), solo permite **allow**, se evalúa todo antes de decidir.
-  La elección: control grueso y explícito por subred (bloquear rangos enteros, negar IPs) → NACL; control fino por recurso y servicio → Security Group — y en arquitecturas maduras, ambos a la vez.

### Propósito fundamental

La NACL es el firewall de la subred de AWS: aporta la capa de control que el Security Group no puede — denegar explícitamente y filtrar a nivel de barrio — y su naturaleza sin estado enseña la lección de diseño más importante de la red cloud: saber exactamente qué tráfico entra, qué sale y quién lo autorizó en cada capa.
