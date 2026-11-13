---
def-type: atomic
version: 1.0
id: def-spf
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - routing
  - algoritmos
  - redes
aliases:
  - shortest path first
  - algoritmo spf
  - algoritmo de dijkstra
---
**SPF** (_Shortest Path First_) es el **algoritmo utilizado por protocolos de enrutamiento dinámico como OSPF e IS-IS para calcular la ruta más corta entre dos puntos de una red**: se basa en el **algoritmo de Dijkstra** — el método general para encontrar el camino más corto entre dos nodos de un grafo ponderado.

#### Funcionamiento

1.  **Creación del grafo**: el SPF modela la topología como un grafo — los **nodos** son los routers y las **aristas** son los enlaces entre ellos.
2.  **Asignación de pesos**: cada arista recibe un peso que representa el **coste del enlace** — distancia, ancho de banda, o cualquier métrica relevante.
3.  **Ejecución de Dijkstra**: calcula la ruta más corta desde el nodo origen **hacia TODOS los demás** — no una ruta, el árbol completo de caminos mínimos.
4.  **Cálculo de las rutas**: con ese árbol, cada router determina las rutas que usará para enviar paquetes a cada destino — y llena su tabla de enrutamiento.

#### Ventajas

-  **Eficiencia**: calcula el camino más corto de forma efectiva sobre la topología completa.
-  **Precisión**: siempre encuentra LA ruta más corta — no aproximaciones ni opiniones de vecinos.
-  **Flexibilidad**: admite **diferentes métricas** para el cálculo — coste por ancho de banda, retardo, lo que el protocolo defina.

#### Desventajas

-  **Complejidad**: es un algoritmo exigente de implementar correctamente.
-  **Consumo de recursos**: CPU y memoria considerables en redes grandes — el precio de calcular sobre el mapa completo.

#### Diferencia Crítica: SPF (Dijkstra) vs. Bellman-Ford

-  **SPF/Dijkstra** calcula sobre el MAPA COMPLETO (la LSDB): datos de primera mano, resultado óptimo, una ejecución — el corazón de OSPF e IS-IS.
-  **Bellman-Ford** itera con opiniones de vecinos: el algoritmo del vector distancia (RIP, EIGRP clásico) — más simple, más lento en converger, propenso a bucles en su forma básica.
-  La división de paradigmas del enrutamiento dinámico pasa por ahí: mapa completo + Dijkstra (estado de enlace) frente a vecinos + Bellman-Ford (vector distancia).

#### Diferencia Crítica: SPF vs. El Nombre "Shortest Path First"

-  El nombre es histórico: técnicamente OSPF e IS-IS ejecutan **Dijkstra** — "SPF" es el apodo del algoritmo dentro del mundo del enrutamiento.
-  Y ojo con la homonimia: **SPF también significa Sender Policy Framework** en correo electrónico — mismo acrónimo, mundos completamente distintos.

### Propósito fundamental

SPF es el matemático del enrutamiento de estado de enlace: convierte el mapa completo de la red en el árbol de rutas óptimas con la garantía de Dijkstra — la razón por la que OSPF e IS-IS convergen rápido y sin bucles: cada router calcula LA mejor ruta, no una opinión.
