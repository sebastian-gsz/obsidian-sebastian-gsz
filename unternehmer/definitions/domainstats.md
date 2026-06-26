---
def-type: atomic
version: 1.0
id: def-domainstats
status: estandar
category: herramientas-de-análisis
contexto: ciberseguridad
date: 2026-06-20
tags:
  - inteligencia-de-amenazas
  - análisis-de-dominios
  - seguridad-red
aliases:
  - domainstats
  - herramienta whois
  - whois
---
DomainStats (y otras herramientas de consulta WHOIS) son servicios de inteligencia de amenazas fundamentales para obtener información detallada sobre la titularidad, la infraestructura técnica y el historial de registro de los dominios de Internet. Estas herramientas proporcionan el contexto necesario para evaluar la reputación de un dominio dentro de un ecosistema de ciberseguridad.

Al realizar búsquedas sobre un dominio, los analistas pueden obtener datos críticos como la fecha de creación, los servidores DNS asociados, el registrador y el estado del dominio. Esta visibilidad permite aplicar técnicas de análisis para discernir si una entidad es legítima o si, por el contrario, presenta características propias de infraestructura maliciosa.

-  **Evaluación de riesgos:** Resulta vital para detectar dominios recién registrados (o dominios "dormidos") que son utilizados frecuentemente en campañas de _phishing_ o como nodos de _Command and Control_ (C2) para malware.
-  **Contexto de Inteligencia de Amenazas:** Ayuda a los equipos de seguridad a correlacionar hallazgos, identificando patrones comunes entre múltiples dominios sospechosos.
-  **Análisis OSINT:** Es una herramienta de referencia en las etapas iniciales de la investigación de incidentes, permitiendo mapear la infraestructura del atacante y determinar su nivel de sofisticación mediante el análisis de su huella digital histórica.
-  **Propósito operativo:** Facilitar la toma de decisiones basada en datos concretos, permitiendo bloquear proactivamente dominios que no cumplen con los estándares de reputación o antigüedad esperados para servicios corporativos legítimos.