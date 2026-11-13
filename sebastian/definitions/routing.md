---
def-type: atomic
version: 1.0
id: def-routing
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - fundamentos
aliases:
  - routing
  - enrutamiento
  - ruteo
---
El **routing** (enrutamiento) es el **proceso de determinar la ruta óptima que deben seguir los paquetes de datos para llegar de un origen a un destino a través de una red**: tomar decisiones sobre hacia dónde dirigirse según la topología de la red y las políticas de routing — el plano de control que decide el mapa del viaje completo.

#### Qué Decide el Routing

-  **La tabla de enrutamiento**: su producto — cada entrada dice "para llegar a la red X, entrega al siguiente salto Y por la interfaz Z".
-  **Topología**: las rutas se eligen según cómo está conectada la red HOY — y se actualizan cuando la topología cambia.
-  **Políticas**: no siempre gana el camino más corto — las políticas (prefijos preferidos, costos administrativos, filtros) deciden qué rutas se aceptan y cuáles se anuncian, sobre todo en BGP.

#### Cómo se Construyen las Rutas

-  **Rutas estáticas**: configuradas a mano — predecibles, sin adaptación; adecuadas para redes pequeñas y enlaces de salida fijos.
-  **Rutas dinámicas**: aprendidas por **protocolos de enrutamiento** — RIP (vector distancia), OSPF e IS-IS (estado de enlace), EIGRP (híbrido) dentro de una organización; **BGP** entre organizaciones (el protocolo que sostiene Internet).
-  El routing elige por **métrica**: saltos, coste, ancho de banda, retardo — cada protocolo con su métrica propia.

#### Diferencia Crítica: Routing vs. Forwarding

-  El **routing** es el plano de CONTROL: construir y actualizar la tabla — el proceso inteligente que conversa con otros routers y calcula rutas.
-  El **forwarding** es el plano de DATOS: aplicar esa tabla paquete a paquete — decidir a qué interfaz sale ESTE paquete, ahora.
-  La división del trabajo: el routing diseña el mapa (lento, pensado); el forwarding lo ejecuta (rápido, mecánico) — un router hace routing de vez en cuando y forwarding millones de veces por segundo.

#### Diferencia Crítica: Routing Estático vs. Dinámico

-  El **estático** es decisión humana fija: perfecto para rutas que nunca cambian (la salida a internet, un enlace dedicado) — y un dolor operativo cuando la topología vive.
-  El **dinámico** aprende y se adapta: sobrevive a caídas de enlaces eligiendo caminos alternos — el precio es complejidad de configuración y consumo.
-  La práctica madura combina ambos: estático para lo fijo y como respaldo explícito; dinámico para la red que respira.

### Propósito fundamental

El routing es la inteligencia que convierte una malla de redes desconectadas en rutas consistentes: decide, sobre la topología y las políticas, cómo llega cada paquete de su origen a su destino — y es la diferencia entre una red que funciona de casualidad y una que sobrevive a la caída de cualquier enlace recalculando el mapa.
