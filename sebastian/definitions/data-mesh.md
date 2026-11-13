---
def-type: atomic
version: 1.0
id: def-data-mesh
status: estandar
category: ingenieria-de-datos
date: 2026-09-21
tags:
  - data-mesh
  - arquitectura
  - datos
  - gobernanza
  - data-engineering
aliases:
  - data mesh
  - malla de datos
---
El **Data Mesh** (malla de datos) es un enfoque arquitectónico y organizativo descentralizado para la gestión, el gobierno y el análisis de datos a escala empresarial, popularizado por Zhamak Dehghani. A diferencia de los modelos tradicionales centralizados (_Data Lakes_ o _Data Warehouses_), donde un único equipo de datos gestiona todas las fuentes y canalizaciones generando cuellos de botella operativos, Data Mesh traslada la responsabilidad y propiedad de los datos directamente a los equipos de dominio de negocio.

##### Los cuatro principios fundamentales

-  **Propiedad orientada a dominios (Domain Ownership)**: Cada dominio de negocio (por ejemplo, ventas, logística, facturación) asume la responsabilidad total sobre sus propios datos operativos y analíticos, gestionándolos desde su origen con pleno conocimiento del contexto.
-  **Datos como producto (Data as a Product)**: Los datos de cada dominio se tratan como un producto de alta calidad destinado a usuarios internos o externos. Deben ser fiables, accesibles, estar debidamente documentados, contar con contratos de datos claros y cumplir con métricas de calidad y SLAs definidos.
-  **Plataforma de datos de autoservicio (Self-Serve Data Platform)**: Se proporciona una plataforma tecnológica centralizada pero abstracta que dota a los equipos de dominio de las herramientas automatizadas necesarias para construir, desplegar, monitorizar y compartir sus productos de datos de forma autónoma, sin depender de un equipo de ingeniería de datos tradicional.
-  **Gobernanza federada (Federated Computational Governance)**: El cumplimiento normativo, la seguridad y los estándares de interoperabilidad se gestionan mediante un modelo federado, donde un comité representativo de los dominios establece las políticas globales que aseguran la coherencia sin sacrificar la autonomía local.

##### Beneficios clave

-  **Escalabilidad organizativa**: Permite que el ecosistema de datos crezca de manera sostenible a medida que se incorporan nuevos dominios y unidades de negocio.
-  **Eliminación de cuellos de botella**: Descentraliza la carga de trabajo que tradicionalmente recaía sobre un único equipo central de datos.
-  **Mayor calidad y valor analítico**: La información es custodiada y mantenida por quienes mejor comprenden su significado de negocio, facilitando su aprovechamiento para iniciativas de análisis e inteligencia artificial.