---
def-type: atomic
version: 1.0
id: def-playbook
status: estandar
category: ciberseguridad
contexto: operaciones
date: 2026-11-11
tags:
  - playbook
  - soc
  - operaciones
  - respuesta
aliases:
  - playbook
  - manual operativo
  - libro de jugadas
---
Un **playbook** es un **manual que proporciona detalles sobre cualquier acción operativa**: el procedimiento escrito de CÓMO hacer algo — paso a paso, con decisiones, responsables y criterios — para que la operación no dependa de la memoria o el criterio de una sola persona.

#### En el Mundo SOC

-  Los playbooks de respuesta a incidentes definen el camino para cada escenario: phishing confirmado, malware en un endpoint, cuenta comprometida — pasos de contención, evidencia, erradicación, comunicación.
-  El **SOAR** los automatiza: el playbook humano se convierte en flujo ejecutable — la orquestación repite el manual sin cansarse y sin olvidar pasos.
-  El valor real: el analista N1 sin experiencia ejecuta el playbook del N3 — el conocimiento senior se vuelve proceso replicable.

#### Componentes Típicos

-  **Criterios de activación**: qué desencadena este playbook (alerta, reporte, umbral).
-  **Pasos ordenados** con responsables: contener → investigar → erradicar → documentar.
-  **Puntos de decisión**: si X, entonces Y; cuándo escalar al N2 o al cliente.
-  **Post-acción**: documentación, lecciones aprendidas, cierre.

#### Diferencia Crítica: Playbook vs. Runbook

-  El **playbook** responde a un ESCENARIO con decisiones ramificadas: "si el atacante sigue dentro, haz A; si hay exfiltración, haz B" — es guiado por condiciones y adapted por caso.
-  El **runbook** es un procedimiento lineal y repetible: "para rotar el certificado: pasos 1-5" — rutina estándar sin ramas.
-  En corto: el runbook es la receta; el playbook es el plan de partido — y ambos conviven en la operación madura.

### Propósito fundamental

El playbook convierte el conocimiento operativo en proceso ejecutable: manual detallado de cada acción — con criterios de activación, pasos, decisiones y escalamiento — para que la respuesta sea consistente, replicable y mejorable — la diferencia entre un equipo que improvisa bajo presión y uno que ejecuta lo que ya practicó.
