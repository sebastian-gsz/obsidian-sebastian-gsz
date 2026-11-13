---
def-type: atomic
version: 1.0
id: def-pentesting
status: estandar
category: ciberseguridad
contexto: herramientas-seguridad
date: 2026-11-11
tags:
  - pentesting
  - ciberseguridad
  - auditoria
aliases:
  - prueba de penetración
  - pen test
  - pentesting
---
Una **prueba de penetración** (_pen test_) es un **ataque simulado que ayuda a identificar vulnerabilidades en sistemas, redes, sitios web, aplicaciones y procesos** — un profesional autorizado actúa como atacante real para encontrar los huecos ANTES de que los encuentre alguien sin permiso.

#### Cómo se Estructura

-  **Alcance y autorización**: el contrato define QUÉ se puede atacar, CUÁNDO y con qué reglas — sin autorización escrita, un pentest es un delito.
-  **Reconocimiento**: mapear el objetivo (hosts, servicios, tecnologías, personas).
-  **Explotación**: intentar las vías de entrada reales — desde fallos técnicos (software sin parchear, configuraciones débiles) hasta ingeniería social (phishing simulado).
-  **Post-explotación**: demostrar el impacto — qué se puede alcanzar desde la brecha (datos, movimiento lateral, dominio).
-  **Informe**: hallazgos ordenados por riesgo, evidencia y, lo más valioso: recomendaciones concretas de remediación.

#### Tipos por Nivel de Conocimiento

-  **Black box**: el atacante no sabe nada — simula un atacante externo real.
-  **Grey box**: algo de conocimiento (credenciales de usuario normal) — simula un atacante interno o con filtración parcial.
-  **White box**: acceso completo al código y arquitectura — máxima profundidad de hallazgos.

#### Diferencia Crítica: Pentest vs. Escáner de Vulnerabilidades

-  El **escáner** automatiza la detección de vulnerabilidades conocidas — ancho, rápido, superficial.
-  El **pentest** encadena manualmente las vulnerabilidades en un ataque real: explota, escala, demuestra impacto — profundidad, creatividad, y la respuesta a la pregunta que el escáner no contesta: "¿ESTO de verdad se puede comprometer, y qué perderíamos?".

#### Diferencia Crítica: Pentest vs. Red Team

-  El **pentest** acota y reporta: demuestra la vulnerabilidad y para.
-  El **red team** simula una campaña completa persistente — sin límites anunciados al equipo azul, para medir la DETECCIÓN y respuesta, no solo las vulnerabilidades.

### Propósito fundamental

El pentest es la única prueba honesta de la seguridad: convierte el "creemos que estamos protegidos" en una demostración real de qué se rompe y cómo — y su valor no está en la lista de huecos, sino en la priorización de remediación que solo un ataque simulado puede fundamentar.
