---
def-type: atomic
version: 1.0
id: def-threat-agent
status: estandar
category: amenazas
contexto: ciberseguridad
date: 2026-06-26
tags:
  - amenazas
  - riesgo
  - ciberseguridad
aliases:
  - threat agent
  - agente de amenaza
---
Un agente de amenaza es cualquier entidad —ya sea un individuo, grupo, organización o incluso un fenómeno accidental— capaz de explotar una vulnerabilidad en un sistema, aplicación o red corporativa. Es el componente activo en la ecuación del riesgo que, mediante una acción deliberada o negligente, pone en peligro la tríada de seguridad (Confidencialidad, Integridad, Disponibilidad).

#### Diferenciación fundamental

Es crucial distinguir entre los conceptos de _actor_ y _agente_ para una correcta gestión de riesgos:

-  **Actor de amenaza:** Es el "quién" (ej. un grupo de hackers patrocinados por un estado, un empleado descontento, un competidor industrial).
-  **Agente de amenaza:** Es el vector o la capacidad ejercida (ej. malware, técnicas de ingeniería social, denegación de servicio).
-  **La capacidad y motivación:** Son los factores determinantes para establecer la probabilidad de éxito. Un agente con alta motivación (ej. ganancia financiera) y alta capacidad (ej. acceso a _zero-days_) incrementa exponencialmente el nivel de riesgo residual.

#### Taxonomía de agentes

Los agentes suelen clasificarse según su origen y naturaleza:

-  **Agentes Externos:** Entidades fuera del perímetro de la organización (ej. grupos de crimen organizado, hacktivistas, agentes estatales).
-  **Agentes Internos:** Usuarios dentro de la red corporativa (ej. empleados maliciosos, contratistas con privilegios excesivos).
-  **Agentes Accidentales/Negligentes:** El factor humano sin intención maliciosa (ej. un usuario que descarga un archivo infectado sin saberlo o un administrador que configura erróneamente un _bucket_ de almacenamiento).

#### Impacto en la gestión de riesgos

El agente de amenaza es el eje central sobre el cual se construyen las **Matrices de Riesgo**:

1. **Identificación:** Permite priorizar qué activos proteger basándose en quién es el agente más probable para ese activo específico.
2. **Estrategia de mitigación:** Las defensas se diseñan considerando las capacidades del agente. (Ej. Contra un agente altamente capacitado, se requieren controles detectivos avanzados; contra un agente negligente interno, se requieren controles preventivos basados en políticas y concienciación).
3. **Cálculo de Probabilidad:** La probabilidad de un incidente no es estática; depende directamente de la presencia y actividad de agentes de amenaza específicos en el ecosistema digital de la organización.

La comprensión profunda del agente de amenaza permite pasar de una postura de seguridad reactiva ("parchear todo") a una postura proactiva y basada en inteligencia ("proteger lo que el agente más probablemente atacará").