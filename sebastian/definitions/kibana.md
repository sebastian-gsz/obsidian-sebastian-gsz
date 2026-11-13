---
def-type: atomic
version: 1.0
id: def-kibana
status: estandar
category: ciberseguridad
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - elastic-stack
  - kibana
  - visualizacion
  - logs
aliases:
  - kibana
  - panel de kibana
---
**Kibana** es el **panel web del Elastic Stack que ofrece visualizaciones de los datos de registro ingeridos y exploración de datos**: la capa donde los logs almacenados en Elasticsearch se convierten en búsquedas interactivas, dashboards y gráficos que un analista puede leer sin escribir consultas crudas.

#### Qué Ofrece

-  **Discover**: exploración libre de los logs ingeridos — filtrar por tiempo, campos y términos para encontrar los eventos relevantes.
-  **Dashboards**: composiciones de visualizaciones (líneas temporales, tablas, mapas, pies) que resumen la salud de sistemas o la actividad de una red de un vistazo.
-  **KQL**: su lenguaje de consulta filtrado, simple pero potente, para acotar millones de eventos a los que importan.
-  En contexto SOC: es la ventana principal sobre los logs que los Beats recolectan y Elasticsearch indexa — donde el analista ve el ataque que ElastAlert ya alertó.

#### El Detalle del Ecosistema (SecurityOnion)

En entornos de monitoreo como SecurityOnion, **Kibana y Squert pueden recurrir a CapME para recuperar capturas de paquetes completos**: desde una alerta visualizada se salta a la captura de red completa del evento — ver no solo el log que delató, sino el tráfico crudo que lo causó.

#### Diferencia Crítica: Kibana vs. Elasticsearch

-  **Elasticsearch** es el motor: almacena, indexa y ejecuta las búsquedas — el músculo.
-  **Kibana** es la interfaz: consume Elasticsearch y presenta — los ojos.
-  Sin Elasticsearch no hay nada que ver; sin Kibana, los datos están pero hay que interrogarlos por API. Son capas distintas de la misma pila, como el almacén y el mostrador.

### Propósito fundamental

Kibana cierra el ciclo del pipeline de observabilidad: los logs que se recolectan e indexan solo generan valor cuando alguien puede verlos y explorarlos — convierte millones de eventos crudos en dashboards y búsquedas legibles, el punto donde la infraestructura de monitoreo se encuentra con el criterio del analista.
