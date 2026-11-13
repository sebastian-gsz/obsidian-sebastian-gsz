---
def-type: atomic
version: 1.0
id: def-fp8
status: estandar
category: inteligencia-artificial
date: 2026-08-23
tags:
  - inteligencia-artificial
  - hardware
  - machine-learning
  - formatos
aliases:
  - fp8
  - 8-bit floating point
  - punto flotante de 8 bits
---
El FP8 (por sus siglas en inglés, _8-bit Floating Point_) es un formato de representación numérica de precisión reducida que utiliza únicamente 8 bits, diseñado para optimizar el rendimiento y reducir drásticamente el consumo de memoria en cargas de trabajo de inteligencia artificial y aprendizaje profundo.
### Variantes principales

-  **E4M3**: Configuración compuesta por 1 bit de signo, 4 bits de exponente y 3 bits de mantisa. Proporciona mayor precisión numérica y se emplea habitualmente en tareas de inferencia.
-  **E5M2**: Configuración compuesta por 1 bit de signo, 5 bits de exponente y 2 bits de mantisa. Ofrece un rango dinámico más amplio y se utiliza frecuentemente durante el proceso de entrenamiento de redes neuronales.
### Ventajas en computación de alto rendimiento

-  **Eficiencia de memoria**: Reduce a la mitad el espacio de almacenamiento requerido para los pesos y activaciones en comparación con los formatos de 16 bits.
-  **Aceleración de hardware**: Permite a las unidades de procesamiento gráfico modernas ejecutar un mayor volumen de operaciones por segundo, incrementando la velocidad general de cómputo en centros de datos y entornos de IA.