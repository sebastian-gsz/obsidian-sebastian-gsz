---
def-type: atomic
version: 1.0
id: def-shor-algorithm
status: estandar
category: computacion-cuantica
contexto: criptografia-post-cuantica
date: 2026-07-02
tags:
  - shor
  - computacion-cuantica
  - criptografia
  - rsa
  - factorizacion
aliases:
  - algoritmo de shor
  - shor
---
El algoritmo de Shor es un algoritmo cuántico para la factorización de enteros que, ejecutado en un ordenador cuántico con suficiente capacidad, puede factorizar números grandes en tiempo polinómico. Su importancia radica en que la seguridad de la mayor parte de la infraestructura de clave pública actual (como RSA y ECC) se basa en la dificultad de factorizar números enteros grandes o calcular logaritmos discretos, problemas que este algoritmo resuelve eficientemente.

#### Impacto en la arquitectura de seguridad

La existencia teórica de este algoritmo ha impulsado la carrera hacia la criptografía post-cuántica (PQC). A medida que el hardware cuántico progresa, los sistemas de cifrado actuales se vuelven vulnerables, obligando a las organizaciones a planificar la migración hacia algoritmos resistentes a ataques cuánticos (como los basados en celosías o _lattices_).

#### Propósito técnico

Permite romper el cifrado asimétrico que protege las comunicaciones TLS, firmas digitales y el intercambio de claves, lo que representa una amenaza existencial para la seguridad de la información tal como la conocemos.