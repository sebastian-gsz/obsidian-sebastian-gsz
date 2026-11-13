---
def-type: atomic
version: 1.0
id: def-troyano
status: estandar
category: amenazas
contexto: malware
date: 2026-11-12
tags:
  - malware
  - troyano
  - amenazas
aliases:
  - troyano
  - trojan
  - caballo de troya
---
Un **troyano** es un **malware que se disfraza de software o archivo legítimo para engañar al usuario y entrar en su sistema** — y **no se replica por sí mismo**: no es un gusano que se propaga solo ni un virus que infecta archivos — necesita que la víctima lo instale creyendo que es otra cosa. El caballo de Troya moderno.

#### Cómo Funciona

-  **El engaño**: se oculta dentro de un archivo o software aparentemente inofensivo — un instalador gratuito, un juego crackeado, un "documento" que pide habilitar macros, una app falsa.
-  **La activación**: cuando el usuario descarga e instala pensando que es seguro, el troyano se activa y **permite que el atacante acceda remotamente al sistema**.
-  **Las consecuencias**: robo de datos sensibles, instalación de más malware, e incluso el uso del dispositivo de la víctima para atacar a otros sistemas — el troyano es la puerta, y detrás entran todos.

#### Familias Según su Función

-  **RAT** (_Remote Access Trojan_): control remoto completo del equipo — el clásico.
-  **Downloader/Dropper**: su única función es descargar e instalar el malware siguiente (el dropper.md de este glosario).
-  **Troyano bancario**: intercepta sesiones y credenciales financieras (el módulo móvil es el MitMo).
-  **Backdoor**: deja la puerta trasera permanente para futuras entradas.

#### Diferencia Crítica: Troyano vs. Virus vs. Gusano

-  **Virus**: se replica **adjuntándose a archivos** — necesita anfitrión y ejecución.
-  **Gusano**: se replica **autónomamente por la red** — sin anfitrión ni usuario.
-  **Troyano**: **NO se replica** — espera ser invitado mediante el engaño; su motor es la víctima que lo instala.
-  Las tres especies, tres motores distintos: contagio por archivo, autodifusión por red, y persuasión humana — el troyano apuesta siempre por el tercer motor, el más confiable de todos: el usuario.

#### Defensa

Descargar solo de fuentes oficiales; desconfiar de cracks y "versiones gratuitas" de software de pago; no habilitar macros de documentos inesperados; y un antivirus actualizado que detecte las firmas y el comportamiento de instalación encubierta.

### Propósito fundamental

El troyano es el malware del engaño: no fuerza la puerta — la VICTIMA la abre creyendo que instala algo útil — y por eso su defensa no es un parche sino el criterio del usuario: de dónde descargas, qué instalas y a qué das permisos, porque el caballo entra cuando alguien lo mete dentro.
