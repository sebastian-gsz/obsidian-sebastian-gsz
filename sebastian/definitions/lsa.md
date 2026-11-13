---
def-type: atomic
version: 1.0
id: def-lsa
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - ospf
  - protocolos
aliases:
  - lsa
  - anuncio de estado de enlace
  - link state advertisement
---
Un **LSA** (_Link State Advertisement_ — anuncio de estado de enlace) es el **paquete fundamental del protocolo de enrutamiento OSPF**: contiene la información sobre el estado y el costo de cada enlace conectado directamente a un router. Los routers OSPF **intercambian LSAs entre sí para construir una imagen completa de la topología de la red**.

#### Funciones del LSA

-  **Compartir información de enlace**: cada LSA describe el estado (activo o inactivo) y el costo de los enlaces de su router originador.
-  **Construir la LSDB**: los routers reúnen los LSAs recibidos en la _Link State Database_ — la base de datos con todos los enlaces y redes del área OSPF.
-  **Calcular la ruta más corta**: sobre la LSDB, cada router ejecuta el algoritmo **SPF** para calcular la mejor ruta a cada destino.

#### Tipos de LSA

-  **LSA de router**: anuncia la existencia del enrutador y sus interfaces.
-  **LSA de red**: anuncia la existencia de una red y su máscara de subred.
-  **LSA de resumen**: resume la información de **múltiples redes** en un solo anuncio.
-  **LSA externa**: anuncia destinos fuera del área OSPF (rutas importadas de otros protocolos).

#### El Proceso de Inundación (_Flooding_)

1.  **Adyacencias**: los routers OSPF descubren y establecen vecindad con sus vecinos directos.
2.  **Intercambio**: se envían LSAs a los vecinos adyacentes.
3.  **Inundación**: cada vecino reenvía los LSAs a sus propios vecinos — hasta que **todos los routers del área tengan TODOS los LSAs**.
4.  **Actualización de la LSDB**: cada router integra los LSAs recibidos en su base de datos y recalcula con SPF si cambió algo.

#### Diferencia Crítica: LSA vs. LSDB

-  El **LSA** es el anuncio individual: una pieza de información sobre los enlaces de un router.
-  La **LSDB** es el rompecabezas completo: la base de datos que ensambla todos los LSAs en el mapa de la red.
-  Son la materia prima y el producto: sin LSAs no hay LSDB, y sin LSDB no hay mapa sobre el cual calcular rutas con SPF.

### Propósito fundamental

El LSA es el mecanismo que convierte a OSPF en un protocolo de estado de enlace real: por él cada router termina conociendo el mapa completo de la red — y es la diferencia práctica entre decidir con datos de primera mano (convergencia rápida, sin bucles) y decidir con opiniones de vecinos, el método de los protocolos de vector distancia.
