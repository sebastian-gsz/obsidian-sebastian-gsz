---
def-type: atomic
version: 1.0
id: def-elastalert
status: estandar
category: ciberseguridad
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - ciberseguridad
  - elastic-stack
  - alertas
  - siem
aliases:
  - alertas elásticas
  - elast alert
  - elastic alert
---
**ElastAlert** es un motor de alertas de código abierto ( Yelp/ElastAlert2 ) que supervisa de forma continua los datos indexados en _Elasticsearch_ y dispara notificaciones cuando una regla definida por el operador se cumple. Es el puente entre el almacenamiento pasivo de logs y la respuesta activa: sin alertado, un _SIEM_ solo guarda evidencia; con él, convierte patrones en avisos accionables.

#### Mecánica de Funcionamiento

-  **Reglas en YAML**: cada regla declara un índice a consultar, un filtro (query) y un tipo de detección. El motor las ejecuta en ciclos periódicos.
-  **Tipos de regla**: `any` (cada evento matchea), `frequency` (N eventos en un intervalo), `spike` (aumento anómalo de volumen), `flatline` (silencio sospechoso: un servicio dejó de reportar), `change` (un campo mutó de valor) y `new_term` (aparición de un valor nunca visto).
-  **Lookback**: la consulta se hace de forma retrospectiva sobre ventanas de tiempo, con lo que la alerta puede reaccionar con segundos o minutos de retraso, no en tiempo real estricto.
-  **Alerters**: las salidas son módulos intercambiables — correo, Slack, Discord, webhook, Jira, ejecución de comandos — permitiendo integrar la alerta en flujos de respuesta (SOC, ticketing, automatización).

#### Diferencia Crítica: ElastAlert vs. su ecosistema

-  **vs. Kibana Alerting**: la solución nativa de Elastic cubre casos generales con interfaz gráfica; ElastAlert gana en reglas complejas versionables como código (_rule-as-code_) y despliegue sin licencia de pago.
-  **vs. Beats**: no compiten — los Beats recolectan y envían los datos que ElastAlert después consulta. Uno alimenta el índice, el otro lo vigila.
-  **vs. Logstash**: Logstash procesa el evento en tránsito (enrichment); ElastAlert actúa después del almacenamiento, sobre series históricas.

#### Casos de Uso en un SOC

-  Detectar **fuerza bruta**: más de 5 eventos de fallo de login `4625` en Windows para el mismo usuario en 2 minutos.
-  Detectar **pico de errores**: un spike de respuestas `5xx` en un servidor web tras un despliegue.
-  Detectar **caída silenciosa**: flatline en los logs de un agente que dejó de transmitir (host comprometido o apagado).

### Propósito fundamental

ElastAlert transforma los logs almacenados en señales de alarma: define en código qué constituye un comportamiento anómalo y automatiza el aviso, convirtiendo al stack de observabilidad en un sistema de detección activo en lugar de un archivo consultable solo tras el incidente.
