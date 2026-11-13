---
def-type: atomic
version: 1.0
id: def-agent-client-protocol
status: estandar
category: desarrollo-software
contexto: inteligencia-artificial
date: 2026-10-04
tags:
  - acp
  - agentes-ia
  - ide
  - protocolos
  - desarrollo
aliases:
  - agent client protocol
  - acp
---
El Agent Client Protocol (ACP) es un protocolo estandarizado de comunicación diseñado para conectar editores de código e IDEs (clientes) con agentes de programación basados en inteligencia artificial generativa. Su propósito principal es desacoplar las interfaces de usuario de los entornos de desarrollo de los motores de ejecución de los agentes, permitiendo que cualquier editor se comunique de manera uniforme con cualquier agente autónomo.

### Componentes de la arquitectura

-  **Cliente:** Aplicación de interfaz (como un editor de código o IDE) que gestiona el entorno de trabajo, maneja las interacciones con el usuario y controla el acceso a los recursos y terminales del sistema.
-  **Agente:** Programa basado en inteligencia artificial que se ejecuta normalmente como subproceso del cliente para analizar y modificar código fuente de forma autónoma.

### Modelo de comunicación

-  **Basado en JSON-RPC:** Utiliza el estándar JSON-RPC 2.0 para estructurar el intercambio de información, implementando solicitudes bidireccionales (métodos) y notificaciones unidireccionales de eventos en tiempo real.
-  **Ciclo de vida de sesión:** Define flujos estandarizados para la inicialización de capacidades, autenticación, creación o carga de sesiones de trabajo, envío de prompts y gestión de operaciones sobre ficheros o terminales.

### Propósito fundamental

Eliminar la fragmentación en el ecosistema de herramientas de desarrollo asistido por IA, permitiendo una interoperabilidad fluida y universal entre editores de código y diferentes arquitecturas de agentes autónomos sin requerir integraciones propietarias.

### El problema que resuelve ACP (El caos de las integraciones)

Imagina que existen 5 editores de código modernos (Zed, VS Code, Helix, Neovim, etc.) y 10 agentes de IA avanzados diferentes (Claude Code, AMP, Codex, etc.).

Si no existiera un estándar, los creadores de cada agente tendrían que escribir un código completamente distinto para conectar su IA con cada editor existente. Eso obligaría a mantener **50 integraciones diferentes** (5 por 10), lo cual es una pesadilla de mantenimiento para los desarrolladores.

Para solucionar esto, la industria creó el **ACP (_Agent Client Protocol_ o Protocolo de Cliente de Agente)**.

### ¿Qué es exactamente ACP y cómo funciona?

ACP es un **estándar abierto** (un "idioma común" o diccionario acordado) que define estrictamente cómo debe comunicarse un editor de código con un agente de inteligencia artificial.

Bajo este protocolo, el sistema se divide siempre en dos partes bien diferenciadas que se comunican mediante mensajes estructurados:

1. **El Cliente (El Editor, por ejemplo, Zed):**

    - Es la interfaz visual donde tú escribes.
    - Su trabajo es mostrar el chat, leer los archivos de tu proyecto local y enviar peticiones estandarizadas al agente utilizando el formato de ACP.
2. **El Servidor (El Agente de IA, por ejemplo, Amp):**

    - Es el motor que piensa, procesa el código y decide qué herramientas usar.
    - Recibe la petición en el idioma de ACP, la procesa y devuelve las respuestas de vuelta al editor (también en formato ACP), especificando cosas como: _"Voy a empezar a escribir texto"_, _"Estoy ejecutando esta herramienta"_ o _"Aquí tienes el uso de tokens de este turno"_.

### ¿Qué significa entonces que un agente sea "compatible con ACP"?

Significa que **ese agente habla nativamente el idioma de ACP**.

- Si un agente es compatible con ACP, puedes conectarlo **instantáneamente** a cualquier editor que soporte ACP (como Zed) sin que nadie tenga que inventar un plugin exclusivo para esa combinación.
- Simplemente le dices a Zed: _"Oye, aquí tienes un agente que cumple con el protocolo ACP"_ y el editor sabrá automáticamente cómo hablar con él, cómo mostrar su chat, cómo pasarle los archivos y cómo gestionar las respuestas en tiempo real (_streaming_).

### ¿Y por qué existía el adaptador `amp-acp` que vimos antes?

Aquí está la clave de todo lo que estábamos analizando: **AMP no hablaba ACP de forma nativa al principio.**

AMP tenía su propia forma de funcionar por la línea de comandos (CLI). Por eso se creó el adaptador `amp-acp`: para actuar como un **traductor universal**. El adaptador se sienta en el medio, escucha lo que Zed le dice en idioma ACP, se lo traduce a AMP, recoge la respuesta de AMP y se la devuelve a Zed traducida otra vez a ACP.

Gracias a ese pequeño traductor, AMP se vuelve "compatible con ACP" de forma artificial y puede funcionar dentro de Zed sin problemas.