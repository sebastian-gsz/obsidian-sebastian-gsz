---
def-type: atomic
version: 1.0
id: def-pua
status: estandar
category: amenazas
contexto: ciberseguridad
date: 2026-06-26
tags:
  - software
  - seguridad
  - malware-ligero
aliases:
  - pua
  - potentially unwanted application
  - aplicación potencialmente no deseada
---
Las aplicaciones potencialmente no deseadas, a menudo clasificadas como _grayware_, son programas que, si bien no siempre se catalogan como malware con intenciones destructivas directas, se instalan sin el consentimiento pleno del usuario o mediante técnicas de engaño. Su presencia en la red corporativa o en endpoints individuales representa un riesgo significativo de seguridad y productividad.

#### Características de impacto

-  **Degradación del rendimiento:** Consumen ciclos de CPU, memoria y ancho de banda innecesarios, afectando la experiencia del usuario y la estabilidad del SO.
-  **Intrusismo y privacidad:** Instalan barras de herramientas (_toolbars_), secuestradores de navegadores (_browser hijackers_) y motores de búsqueda que monitorean el historial de navegación para generar perfiles con fines comerciales no autorizados.
-  **Vulnerabilidades latentes:** Muchas PUA carecen de mantenimiento de seguridad. Al instalarse, pueden abrir puertas traseras o introducir dependencias obsoletas que los atacantes pueden explotar para escalar privilegios o ejecutar código arbitrario.
    

#### Riesgos en entornos corporativos

El peligro principal de las PUA en una empresa no es el software en sí, sino lo que habilita:

1.  **Precursor de infecciones:** Son frecuentemente utilizados como vectores de entrada para _malware_ más agresivo (como troyanos o ransomware).
2.  **Exfiltración de telemetría:** El monitoreo constante puede capturar datos sensibles de la empresa que son enviados a servidores de terceros, violando políticas de cumplimiento y privacidad de datos.
3.  **Ofuscación:** La presencia de PUA complica la labor de los equipos de ciberseguridad, ya que generan "ruido" en los logs de seguridad y pueden ocultar actividades de actores maliciosos dentro de un mar de falsos positivos.
    

#### Estrategia de defensa

La gestión de PUA se basa en tres pilares técnicos:

-  **Control de aplicación (Allowlisting):** Implementar políticas de grupo o soluciones EDR que bloqueen la ejecución de binarios no firmados o no autorizados por el departamento de TI.
-  **Filtrado de DNS/Web:** Bloquear el acceso a dominios conocidos por distribuir instaladores de _adware_ o _bundlers_ (instaladores que agrupan software legítimo con componentes no deseados).
-  **Hardening de navegadores:** Deshabilitar la capacidad de instalar extensiones de terceros mediante políticas centralizadas para evitar la inyección de _toolbars_ no deseadas.