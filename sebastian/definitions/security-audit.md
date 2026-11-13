---
def-type: atomic
version: 1.0
id: def-security-audit
status: estandar
category: procesos
contexto: gobernanza-y-compliance
date: 2026-06-26
tags:
  - cumplimiento
  - evaluacion
  - controles
aliases:
  - security audit
  - auditoría de seguridad
---
Una auditoría de seguridad es el examen sistemático y objetivo de los controles, políticas, configuraciones y procedimientos operativos de una organización. Su propósito no es simplemente detectar vulnerabilidades técnicas, sino medir la eficacia de la postura de seguridad global frente a un estándar definido, una política interna o una normativa regulatoria (como ISO 27001, SOC2 o NIST).

#### Fases críticas del proceso

Para que una auditoría sea efectiva, debe seguir un ciclo estructurado que garantice resultados accionables:

-  **Planificación y alcance:** Definición de los activos sujetos a revisión (ej. infraestructura Cloud, bases de datos transaccionales, acceso físico). Se establece qué estándares se utilizarán para la evaluación.
-  **Recolección de evidencias:** Fase donde se recopilan registros, configuraciones de red, políticas de acceso (IAM) y evidencias de controles operativos.
-  **Análisis y evaluación:** Comparativa entre la configuración actual y los requisitos del marco de referencia. Aquí se identifican las brechas (_gaps_) entre el estado actual y el estado deseado.
-  **Reporte y plan de remediación:** Documentación de hallazgos clasificados por criticidad. Se entrega a la dirección un mapa de ruta detallado para mitigar riesgos y alinear la operación con las políticas de seguridad.

#### Marcos de referencia comunes

Las auditorías suelen alinearse con marcos de madurez reconocidos internacionalmente:

-  **ISO/IEC 27001:** Enfoque en la gestión de riesgos y la mejora continua del SGSI (Sistema de Gestión de Seguridad de la Información).
-  **NIST Cybersecurity Framework:** Utilizado para evaluar la capacidad de la organización en torno a cinco funciones: Identificar, Proteger, Detectar, Responder y Recuperar.
-  **PCI-DSS:** Específico para entornos que procesan, almacenan o transmiten datos de tarjetas de pago, con requisitos técnicos muy estrictos de segmentación y cifrado.

#### Diferencia con otras evaluaciones

Es vital distinguir la auditoría de otros ejercicios de seguridad:

-  **Auditoría:** Enfocada en **cumplimiento (compliance)** y efectividad de procesos. Evalúa si "haces lo que dices que haces" según una norma.
-  **Penetration Testing:** Enfocado en la **explotación activa** de vulnerabilidades para medir la resistencia técnica ante atacantes reales.
-  **Vulnerability Assessment:** Enfocado en el **escaneo automatizado** para identificar debilidades conocidas en sistemas sin intentar explotarlas activamente.

#### Valor estratégico

Más allá de la validación regulatoria, una auditoría proporciona a la arquitectura de seguridad una fotografía precisa del cumplimiento y la madurez operativa. Las desviaciones encontradas actúan como entradas para el _backlog_ de seguridad, permitiendo priorizar inversiones en infraestructura y mejorar los controles preventivos y detectivos antes de que ocurra una brecha.