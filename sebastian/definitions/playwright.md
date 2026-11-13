---
def-type: atomic
version: 1.0
id: def-playwright
status: estandar
category: desarrollo-software
contexto: pruebas
date: 2026-11-11
tags:
  - testing
  - automatizacion
  - web
aliases:
  - playwright
  - playwright testing
---
**Playwright** es una **herramienta de automatización para pruebas de aplicaciones web** que **permite simular interacciones reales del usuario — hacer clic, escribir, navegar — en navegadores modernos como Chromium, Firefox y WebKit**: pruebas end-to-end que se comportan como un usuario de verdad, en los tres motores de navegador que existen.

#### Qué Hace

-  **Automatiza el navegador**: abre páginas, llena formularios, hace clic, espera, verifica resultados — el flujo completo de un usuario convertido en script.
-  **Multi-navegador con una API**: el mismo test corre en Chromium, Firefox y WebKit (Safari) — cobertura real de los motores sin reescribir nada.
-  **Espera automática (_auto-wait_)**: espera a que los elementos estén listos antes de actuar — el anti-flaky que diferencia a Playwright: no duerme milisegundos a ciegas, espera CONDICIONES.
-  Extras que lo hacen completo: capturas y vídeo de cada corrida, trazas de depuración, interceptación de red (mock de APIs), múltiples pestañas y orígenes, y ejecución paralela nativa.

#### Dónde Brilla

-  **Pruebas end-to-end**: el recorrido completo del usuario — login → operación → verificación — validado de punta a punta.
-  **Integración CI/CD**: corre en pipelines con contenedores oficiales — cada despliegue se valida antes de salir.
-  **Web scraping controlado** y generación de capturas — donde un navegador real es la única vía.

#### Diferencia Crítica: Playwright vs. Selenium

-  **Selenium** es el veterano universal — cada navegador con su driver, esperas manuales, flaky clásico.
-  **Playwright** nació moderno: una sola API para tres motores, auto-wait, trazas, paralelismo y velocidad nativa — mismo propósito, ergonomía de otra década.
-  La migración típica: equipos nuevos o que sufren pruebas inestables eligen Playwright; ecosistemas heredados enormes siguen en Selenium — ambos automatizan el navegador real.

### Propósito fundamental

Playwright automatiza al usuario real en los navegadores reales: clic, escritura y navegación simulados en Chromium, Firefox y WebKit para probar la aplicación de punta a punta — el estándar moderno de las pruebas web end-to-end, diseñado para ser rápido, estable y honesto sobre lo que un usuario de verdad haría.
