---
def-type: atomic
version: 1.0
id: def-cri-o
status: estandar
category: contenedores
contexto: orquestacion-de-contenedores
date: 2026-07-04
tags:
  - cri-o
  - kubernetes
  - cri
  - oci
  - contenedor
aliases:
  - cri-o
  - container runtime interface - oci
---
CRI-O es un entorno de ejecución de contenedores ligero, diseñado específicamente para Kubernetes. Implementa la especificación de la interfaz de tiempo de ejecución de contenedores (CRI) y está construido para admitir cualquier tiempo de ejecución compatible con la Open Container Initiative (OCI), como runc o crun.

#### Características técnicas

-  **Especialización:** A diferencia de Docker, que incluye herramientas para desarrolladores (construcción de imágenes, registro), CRI-O está diseñado exclusivamente para ser un "servidor" de contenedores para Kubernetes, lo que lo hace más compacto y estable.
-  **Cumplimiento OCI:** Utiliza el estándar OCI para la gestión y ejecución de contenedores, garantizando compatibilidad total con imágenes de contenedor estándar.
-  **Ligereza:** Al reducir la superficie de ataque y el consumo de recursos al eliminar funcionalidades innecesarias, es una opción preferida en despliegues de Kubernetes de nivel empresarial.

#### Propósito arquitectónico

Actúa como el puente crítico entre el kubelet (el agente de Kubernetes en cada nodo) y el tiempo de ejecución de bajo nivel. Su función es gestionar el ciclo de vida de los pods y contenedores, delegando la ejecución real al runtime de bajo nivel (OCI runtime), lo cual permite una arquitectura modular y desacoplada dentro de la infraestructura de clústeres.