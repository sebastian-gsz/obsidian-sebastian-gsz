---
def-type: atomic
version: 1.0
id: def-logstash
status: estandar
category: ciberseguridad
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - elastic-stack
  - logstash
  - logs
  - ingesta
aliases:
  - logstash
  - motor de ingesta de datos
---
**Logstash** es el **motor de ingesta, análisis y formato de registros del Elastic Stack**: recibe datos de cualquier fuente, los procesa y transforma en el camino, y los entrega a su destino (normalmente Elasticsearch) limpios, enriquecidos y en el formato correcto. Es el centro de procesamiento del pipeline — el músculo entre la recolección y el almacenamiento.

#### El Pipeline de Tres Etapas

-  **Input (entrada)**: plugins de recepción — archivos, syslog, Beats, Kafka, colas... Logstash acepta de casi todo.
-  **Filter (filtro)**: la etapa que lo define — parsear (grok), enriquecer (añadir campos con geo-IP o lookup), renombrar, descartar, condicionar por contenido. Aquí el log crudo se convierte en dato estructurado y útil.
-  **Output (salida)**: entrega al destino — típicamente Elasticsearch, también archivos, colas, sistemas de ticketing.

#### Diferencia Crítica: Logstash vs. Beats

-  Los **Beats** son shippers livianos: se instalan en cada servidor y **envían** los datos con consumo mínimo de CPU y memoria — recolectan, no procesan.
-  **Logstash** es el motor pesado: concentra los datos de muchos shippers y aplica la **transformación intensiva** (parsing, enriquecimiento) antes de almacenarlos.
-  El patrón canónico: Beats recolecta en los endpoints → Logstash procesa en un nodo central → Elasticsearch indexa → Kibana visualiza. Cada pieza hace UN trabajo y lo hace bien.

#### Cuándo Usarlo

Cuando los logs necesitan **transformación real antes de almacenarse**: formatos dispares que unificar, campos que extraer de líneas de texto, datos que enriquecer con contexto externo. Si los datos llegan ya estructurados y solo hay que almacenarlos, el paso por Logstash puede sobrar (ingesta directa).

### Propósito fundamental

Logstash es la sala de procesamiento del pipeline de logs: convierte el ruido crudo y heterogéneo que producen los sistemas en datos estructurados, enriquecidos y consistentes — la diferencia entre almacenar texto y almacenar información sobre la que se puede buscar, alertar y analizar.
