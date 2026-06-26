---
def-type: atomic
version: 1.0
id: def-amenaza
status: estandar
category: conceptos-generales
contexto: ciberseguridad
date: 2026-06-26
tags:
  - ciberseguridad
  - amenazas
aliases:
  - amenaza
  - actor malicioso
  - malicious actor
---
En el ámbito de la ciberseguridad, una amenaza se define como cualquier evento, circunstancia o actor potencial que puede explotar una vulnerabilidad para causar daño a un activo de información. Es fundamental distinguir entre el **vector de ataque** (el método) y el **actor** (quien ejecuta la amenaza).

#### Clasificación de Actores de Amenazas

Para un diseño de arquitectura seguro, es necesario categorizar a los actores según su capacidad, motivación y acceso:

-  **Estados-nación (APT):** Grupos altamente sofisticados, financiados por gobiernos, con recursos ilimitados y objetivos de espionaje, sabotaje o guerra cibernética.
-  **Grupos de Crimen Organizado:** Actores motivados por el lucro económico (ransomware, robo de datos financieros, fraude). Operan con estructuras jerárquicas y herramientas avanzadas.
-  **Hacktivistas:** Grupos ideológicos que buscan visibilidad o daño reputacional mediante desfiguración de sitios (defacement), ataques DDoS o filtración de información.
-  **Insiders (Amenazas internas):** Individuos con acceso legítimo a la infraestructura (empleados, contratistas). Pueden actuar de forma maliciosa (descontento, espionaje) o accidental (negligencia, errores humanos).
-  **Script Kiddies:** Actores con habilidades técnicas limitadas que utilizan herramientas de explotación prefabricadas. Representan un riesgo por volumen y falta de discernimiento.
    

#### La Ecuación del Riesgo

La amenaza es una de las tres variables críticas para calcular el riesgo en una organización:

$$\text{Riesgo} = \text{Amenaza} \times \text{Vulnerabilidad} \times \text{Impacto}$$

Entender la naturaleza del actor permite a los arquitectos de seguridad priorizar controles (ej. si la amenaza es un actor con altos recursos, se debe priorizar la detección avanzada y el _threat hunting_ sobre medidas perimetrales básicas).