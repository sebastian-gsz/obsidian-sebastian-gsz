---
def-type: atomic
version: 1.0
id: def-threat-modeling
status: estandar
category: ciberseguridad
contexto: gestion-de-riesgos
date: 2026-11-11
tags:
  - amenazas
  - arquitectura
  - riesgos
  - ciberseguridad
aliases:
  - modelo de amenazas
  - threat modeling
  - modelado de amenazas
---
El **modelado de amenazas** (_threat modeling_) es el **proceso para identificar activos, vulnerabilidades y amenazas a fin de optimizar la defensa**: pensar como atacante ANTES de construir o revisar un sistema, para decidir dónde poner las defensas que de verdad importan en lugar de repartirlas al azar.

#### El Proceso en Cuatro Preguntas

-  **¿Qué estamos construyendo?** — diagramar el sistema: componentes, flujos de datos, límites de confianza.
-  **¿Qué puede salir mal?** — enumerar amenazas contra cada componente y flujo.
-  **¿Qué vamos a hacer al respecto?** — decidir mitigaciones para las amenazas reales.
-  **¿Lo hicimos bien?** — validar y repetir con cada cambio.

#### Metodologías Conocidas

-  **STRIDE**: clasifica amenazas en seis categorías — _Spoofing_ (suplantación), _Tampering_ (alteración), _Repudio_ (negación), _Information disclosure_ (filtración), _Denial of service_, _Elevation of privilege_ — una lente por cada tipo de fallo.
-  **Attack trees**: árboles donde la meta del atacante se descompone en caminos alternativos — sirve para comparar defensas por camino.
-  El resultado alimenta la línea de base de controles: cada amenaza real se convierte en un control implementado.

#### Diferencia Crítica: Threat Modeling vs. Análisis de Riesgos

-  El **análisis de riesgos** es organizacional y amplio: inventario de activos, amenazas y probabilidad — produce la lista de riesgos a gestionar.
-  El **threat modeling** es técnico y específico: se aplica a UN sistema, diseño o flujo concreto, desde la perspectiva de cómo lo atacaría alguien.
-  Se complementan: el análisis decide QUE protegemos y cuánto; el modelado decide CÓMO se rompe este diseño y dónde va cada defensa.

#### Diferencia Crítica: Threat Modeling vs. MITRE ATT&CK

-  El modelado es **proactivo**: se hace en el diseño, antes del ataque.
-  ATT&CK es el **catálogo del que ya pasa**: las tácticas y técnicas reales que los atacantes usan post-compromiso.
-  La práctica madura usa ambos: modelar el sistema consultando ATT&CK — defendiendo las técnicas que el enemigo de verdad emplea, no las imaginarias.

### Propósito fundamental

El modelado de amenazas convierte la seguridad de reacción en diseño: al preguntar sistemáticamente "¿cómo se rompe esto?" antes de desplegar, las defensas se colocan donde el atacante realmente iría — y cada hora de modelado ahorra incidentes que cuestan semanas.
