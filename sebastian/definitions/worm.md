---
def-type: atomic
version: 1.0
id: def-gusano
status: estandar
category: amenazas
contexto: malware
date: 2026-11-11
tags:
  - malware
  - amenazas
  - propagacion
  - ciberseguridad
aliases:
  - gusano
  - gusano informático
  - computer worm
  - stuxnet
---
Un **gusano** (_worm_) es código malicioso que **se replica atacando de manera independiente las vulnerabilidades de las redes**: se autorreplica y se propaga de forma autónoma a través de las redes, sin necesidad de interactuar con usuarios ni de adherirse a otros archivos o programas.

#### Vías de Propagación

-  **Archivos adjuntos de correo electrónico** que parecen legítimos.
-  **Mensajes de texto y redes sociales** con enlaces maliciosos.
-  **Programas de intercambio de archivos** (redes P2P con archivos infectados).
-  **Recursos compartidos de red**, donde se copian y ejecutan automáticamente.
-  **Unidades extraíbles (USB)**: infectan cualquier sistema en el que se conecten.

#### Cómo Infectan

-  **Aprovechamiento de vulnerabilidades**: explotan fallos del sistema operativo o de aplicaciones; dentro, buscan otros dispositivos en la red para continuar propagándose.
-  **USB con ejecución automática**: se copian a la unidad; al conectarla a otro equipo, se ejecutan solos.
-  **Phishing e ingeniería social**: correos que engañan para activar el archivo malicioso.
-  **Software pirateado**: los instaladores crackeados son una vía de entrada clásica.

#### El Caso Stuxnet

-  **Objetivo**: sabotear el programa nuclear iraní — las centrífugas de enriquecimiento de uranio de Natanz.
-  **Métodos**: explotó múltiples **vulnerabilidades de día cero** en Windows para infiltrarse y obtener privilegios administrativos sin ser detectado.
-  **Funcionamiento**: manipuló los sistemas **SCADA** que controlaban las centrífugas, alterando sus parámetros y causando **daños físicos** reales.
-  **Propagación y evasión**: se movió por USB y red local, y su diseño modular le permitió adaptarse a entornos distintos y evitar el antivirus.
-  **Impacto**: infectó ~20.000 dispositivos en 14 instalaciones nucleares y dañó aproximadamente 1.000 centrífugas — el hito que demostró que un ataque informático puede destruir hardware: el nacimiento de la ciberguerra.

#### Diferencia Crítica: Gusano vs. Virus

-  El **virus** necesita infectar un archivo o programa anfitrión y, normalmente, una acción del usuario (ejecutarlo) para multiplicarse.
-  El **gusano** es independiente: es un programa completo que se propaga solo por la red, explotando vulnerabilidades sin anfitrión ni usuario — por eso se expande mucho más rápido.

#### Protección

Mantener el software y sistema operativo actualizados; desconfiar de correos, enlaces y adjuntos inesperados; evitar software pirata; y usar antivirus al día que detecte y neutralice gusanos antes del daño.

### Propósito fundamental

El gusano es el malware que no pide permiso: se mueve solo por las grietas de la red, y Stuxnet probó que esa autonomía puede traspasar lo digital y romper lo físico — por todo ello, parchear rápido y segmentar la red son la defensa que convierte la propagación en callejón sin salida.
