---
def-type: atomic
version: 1.0
id: def-attack-vector
status: estandar
category: ciberseguridad
contexto: gestion-de-riesgos
date: 2026-11-12
tags:
  - amenazas
  - vectores
  - ciberseguridad
aliases:
  - vector de ataque
  - attack vector
  - vectores de ataque
---
Un **vector de ataque** es la **ruta o método utilizado por los atacantes para penetrar en las defensas**: el CAMINO concreto de entrada — no el daño ni la herramienta, sino la vía por la que se llega.

#### Los Vectores Clásicos

-  **Correo con phishing**: el adjunto o enlace malicioso — el vector de entrada número uno.
-  **Credenciales robadas**: contraseñas filtradas, tokens secuestrados, claves de API expuestas.
-  **Vulnerabilidades sin parchear**: exploits contra software desactualizado (EternalBlue y WannaCry como caso canónico).
-  **Ingeniería social**: llamadas (vishing), engaños físicos (tailgating), intercambios falsos (quid pro quo).
-  **Terceros y cadena de suministro**: el proveedor comprometido que entrega el paquete contaminado.
-  **Dispositivos móviles y USB**: los medios físicos que cruzan el perímetro.

#### Cómo se Usan los Vectores

-  **En el threat modeling**: cada vector identificado exige su control — el correo pide filtrado y capacitación; las credenciales, MFA y rotación; las vulnerabilidades, parcheo.
-  **En el análisis de incidentes**: después del ataque, la pregunta obligada es "¿por qué vector entraron?" — la respuesta define qué defensa faltó y qué cerrar.
-  **En los marcos**: MITRE ATT&CK es esencialmente el catálogo de vectores y técnicas reales — el mapa de los caminos que el enemigo usa de verdad.

#### Diferencia Crítica: Vector de Ataque vs. Superficie de Ataque

-  La **superficie de ataque** es el MAPA de todos los puntos vulnerables — la propiedad estática del sistema.
-  El **vector de ataque** es la RUTA CONCRETA elegida: el camino que el atacante recorre a través de ese mapa — la dinámica del ataque.
-  La relación: cada vector atraviesa algún punto de la superficie — reducir la superficie elimina vectores posibles; monitorear los vectores conocidos detecta los intentos reales.

### Propósito fundamental

El vector de ataque es el camino de entrada del enemigo: la ruta concreta por la que las defensas se cruzan — y nombrarlo con precisión (phishing, credenciales, exploit, tercero) es lo que convierte la seguridad de intuición en estrategia: cada vector conocido define el control que lo neutraliza.
