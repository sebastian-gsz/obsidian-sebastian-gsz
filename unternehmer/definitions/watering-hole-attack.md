---
def-type: atomic
version: 1.0
id: def-watering-hole
status: estandar
category: amenazas
contexto: ciberseguridad
date: 2026-06-26
tags:
  - ciberseguridad
  - ataque
  - ingeniería-social
aliases:
  - watering hole attack
---
El _watering hole attack_ (ataque de abrevadero) es una táctica de ingeniería social y explotación técnica donde el atacante compromete un sitio web legítimo frecuentado habitualmente por los miembros de una organización o sector específico. A diferencia de un ataque directo, este método es pasivo y altamente selectivo, esperando que el objetivo "venga hacia la trampa".

#### Funcionamiento técnico

El ataque se divide en fases de reconocimiento y ejecución silenciosa:

-  **Reconocimiento:** El atacante identifica sitios web de confianza para la organización (ej. foros sectoriales, portales de noticias técnicas o sitios de herramientas de gestión) que poseen vulnerabilidades en su infraestructura o en sus dependencias (bibliotecas JavaScript de terceros).
-  **Compromiso:** El atacante inyecta código malicioso (usualmente _iframes_ invisibles o scripts de redirección) en el sitio web legítimo.
-  **Explotación:** Cuando los empleados del objetivo navegan hacia el sitio, el código malicioso se ejecuta en el navegador de la víctima. Se aprovechan vulnerabilidades del navegador (_zero-day_ o fallos conocidos sin parchear) o se realiza un ataque de _drive-by download_ para desplegar la carga útil.
-  **Persistencia:** La carga útil establece un canal de comunicación con el servidor del atacante, permitiendo la exfiltración de credenciales, instalación de troyanos de acceso remoto (RAT) o movimiento lateral hacia la infraestructura corporativa.

#### Propósito táctico

A diferencia del phishing masivo, el _watering hole_ busca un acceso inicial (_beachhead_) altamente cualificado. Al comprometer un sitio legítimo, el atacante evade gran parte de los filtros de reputación y el escepticismo de los usuarios, ya que el origen del tráfico es una fuente confiable.

#### Estrategias de mitigación

La defensa requiere un enfoque de seguridad en profundidad, dado que la confianza en el sitio web es el vector explotado:

-  **Seguridad de endpoints:** Despliegue de soluciones EDR (Endpoint Detection and Response) capaces de identificar comportamientos anómalos tras la ejecución de procesos (ej. un navegador ejecutando un proceso de consola PowerShell).
-  **Navegación aislada:** Implementación de soluciones de _Remote Browser Isolation_ (RBI) para ejecutar sesiones web en un entorno seguro remoto, evitando que el código malicioso toque el endpoint físico.
-  **Control de salida (Egress filtering):** Bloqueo estricto de conexiones a dominios desconocidos o de baja reputación desde los endpoints, dificultando la conexión del malware con servidores de mando y control (C2).
-  **Parcheo proactivo:** Mantener los navegadores y sus complementos actualizados para cerrar las ventanas de explotación de vulnerabilidades conocidas.

Este ataque es particularmente efectivo contra arquitecturas que confían excesivamente en el perímetro interno de red, asumiendo erróneamente que el tráfico que proviene de "internet" es siempre externo y malicioso, mientras que el que proviene de sitios conocidos es seguro.