---
def-type: atomic
version: 1.0
id: def-whaling
status: estandar
category: amenazas
contexto: ciberseguridad
date: 2026-06-26
tags:
  - phishing
  - ingeniería-social
  - ejecutivo
aliases:
  - whaling
  - spear phishing ejecutivo
  - ataque de caza de ballenas
---
El _whaling_ es una forma de ingeniería social altamente sofisticada y personalizada, dirigida exclusivamente a objetivos de alto nivel dentro de una organización, como directivos (_C-suite_: CEO, CFO, COO) o altos ejecutivos. A diferencia del phishing masivo, que depende del volumen, el _whaling_ depende de la precisión quirúrgica y la investigación profunda sobre la víctima.

#### Diferenciación y metodología

La efectividad del _whaling_ radica en la preparación técnica y psicológica:

-  **Investigación extensiva (OSINT):** Los atacantes recopilan datos de fuentes públicas (LinkedIn, informes anuales, noticias corporativas, redes sociales) para entender la estructura jerárquica, el estilo de comunicación y las preocupaciones actuales del ejecutivo.
-  **Personalización extrema:** Los mensajes no solo imitan la identidad de un contacto legítimo, sino que utilizan un lenguaje, tono y contexto (temas de actualidad, transacciones reales, proyectos confidenciales) que hacen casi imposible distinguir el fraude de una comunicación auténtica.
-  **Acceso privilegiado:** El atacante no busca credenciales comunes, sino el acceso que posee el ejecutivo para autorizar transferencias de fondos, aprobar cambios en procesos críticos o acceder a bases de datos con información privilegiada.

#### Vector de ataque y riesgos

-  **Business Email Compromise (BEC):** El escenario más común, donde el atacante suplanta al CEO o CFO para instruir a departamentos financieros a realizar transferencias urgentes bajo pretextos de adquisiciones confidenciales o auditorías de emergencia.
-  **Compromiso de credenciales:** Obtención de acceso a sistemas internos que no están protegidos por autenticación multifactor (MFA) robusta o mediante técnicas de _session hijacking_.
-  **Impacto financiero y reputacional:** A diferencia de un ataque a un usuario estándar, el _whaling_ suele resultar en pérdidas económicas masivas y daños irreparables a la reputación corporativa.

#### Estrategias de mitigación

Dada la naturaleza personalizada del ataque, las defensas técnicas tradicionales (como filtros antispam) son insuficientes por sí solas:

1. **Protocolos de verificación:** Implementar procedimientos obligatorios de doble validación (fuera de banda, ej: confirmación telefónica o presencial) para cualquier solicitud de transferencia de fondos o cambio de procesos críticos, independientemente de quién sea el remitente.
2. **Capacitación ejecutiva:** Entrenamiento específico para directivos sobre cómo identificar intentos de ingeniería social, enfatizando que ellos son el objetivo principal debido a su nivel de acceso.
3. **Seguridad técnica:** Uso estricto de autenticación multifactor (MFA) basada en hardware (FIDO2) para todos los niveles ejecutivos, lo que mitiga el riesgo de suplantación de identidad incluso si las credenciales son comprometidas.
4. **Análisis de comportamiento:** Despliegue de herramientas de seguridad que monitoricen el comportamiento inusual en las comunicaciones (anomalías en el dominio de remitente, cambios en el estilo de redacción) para detectar intentos de _spoofing_.