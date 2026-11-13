---
def-type: atomic
version: 1.0
id: def-paquete-software
status: estandar
category: desarrollo-software
contexto: software
date: 2026-11-11
tags:
  - software
  - paquetes
  - desarrollo
aliases:
  - paquete de software
  - software package
  - paquete informático
---
Un **paquete** (de software) es **una pieza de software que se puede combinar con otros paquetes para formar una aplicación**: la unidad de distribución y composición del software moderno — nadie escribe todo desde cero; se ensamblan paquetes probados, propios y de terceros.

#### Qué Contiene un Paquete

-  El **código** (o binario) que implementa una funcionalidad concreta.
-  Sus **metadatos**: nombre, versión, dependencias de otros paquetes, licencia.
-  En los ecosistemas de desarrollo: se distribuyen por **registros** — npm (JavaScript), pip/PyPI (Python), Maven (Java), NuGet (.NET) — y `npm install` o `pip install` traen el paquete Y su árbol de dependencias completos.

#### La Cadena de Composición

-  Un paquete pequeño (`left-pad` en npm) puede sostener a media industria: las aplicaciones se construyen como pirámides de paquetes — el tuyo arriba, cientos de dependencias abajo.
-  **El precio de la composición**: cada dependencia es una superficie de confianza — el ataque de cadena de suministro (un paquete popular comprometido envenena a todos los que lo usan) nace exactamente aquí.

#### Diferencia Crítica: Paquete de Software vs. Paquete (de red)

-  En **software**, el paquete es una pieza de código distribuible y combinable — lo que instala `pip`.
-  En **redes**, "paquete" (_packet_) es la unidad de datos que viaja por la red — la PDU de la capa de red, la IP encapsulada en tramas.
-  Mismo idioma, dos mundos: uno se instala y compone código; el otro se transmite y enrutó. El contexto (instalar vs transmitir) dice cuál es cuál.

#### Diferencia Crítica: Paquete vs. Aplicación

-  La **aplicación** es lo que el usuario ejecuta; los **paquetes** son sus piezas intercambiables — una aplicación moderna suele ser decenas o cientos de paquetes ensamblados.
-  Consecuencia: actualizar una dependencia es actualizar una pieza sin reescribir la aplicación — la modularidad que hace el software mantenible.

### Propósito fundamental

El paquete es el ladrillo del software moderno: piezas con nombre, versión y dependencias que se combinan para formar aplicaciones — y su gestión (el package manager) es lo que separa el desarrollo disciplinado de la acumulación de código: composición explícita, versiones controladas y superficie de confianza declarada.
