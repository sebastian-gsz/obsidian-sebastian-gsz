---
def-type: atomic
version: 1.0
id: def-reinforcement-learning
status: estandar
category: aprendizaje-automático
contexto: ciencia-de-datos
date: 2026-06-26
tags:
  - ml
  - aprendizaje-dinamico
  - prueba-y-error
aliases:
  - reinforcement learning
  - RL
  - aprendizaje por refuerzo
---
El aprendizaje por refuerzo es un paradigma de aprendizaje automático basado en la interacción dinámica entre un agente y un entorno. A diferencia del aprendizaje supervisado, donde el sistema aprende de un conjunto de datos estático etiquetado, en el RL el agente aprende mediante la exploración activa (prueba y error), tomando decisiones (acciones) y recibiendo una señal de retorno (recompensa o castigo) en tiempo real.

![[reinforcement-learning.jpg]]

#### Mecanismo de aprendizaje

El objetivo del agente es aprender una **política** (una estrategia de acción) que maximice la suma de recompensas acumuladas a largo plazo. Este proceso se descompone en:

- **Agente:** La entidad que toma decisiones.
- **Entorno:** El sistema o escenario donde opera el agente.
- **Estado:** La representación actual del entorno.
- **Acción:** La decisión tomada por el agente.
- **Recompensa:** El feedback numérico que indica si la acción fue beneficiosa o perjudicial.

#### Aplicación en infraestructura y sistemas

Más allá de la robótica y el juego competitivo, el RL es transformador en la optimización autónoma de sistemas:

- **Redes y Cloud:** Permite que los sistemas de orquestación (como Kubernetes o balanceadores de carga) refinen sus políticas de escalado y enrutamiento adaptándose a fluctuaciones de tráfico no predecibles.
- **Auto-optimización:** El sistema "aprende" qué combinaciones de parámetros (ej. tamaño de buffer, tiempos de espera, réplicas) logran el rendimiento óptimo sin intervención humana constante, convirtiéndose en un mecanismo de control de bucle cerrado.
- **Gestión de recursos:** Eficiente en la asignación dinámica de cómputo y energía, reduciendo costos operativos al maximizar la eficiencia de los recursos disponibles bajo condiciones de carga variables.