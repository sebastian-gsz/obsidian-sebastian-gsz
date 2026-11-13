---
def-type: atomic
version: 1.0
id: def-forwarding
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - paquetes
aliases:
  - reenvío
  - reenvío de paquetes
  - packet forwarding
---
El **forwarding** (reenvío) es el proceso de tomar un paquete que acaba de llegar a un router y **decidir a qué interfaz (puerto) debe enviarse para continuar su camino hacia el destino final**. Es la ejecución local, salto a salto, del viaje del paquete: cada router repite esta decisión en milisegundos durante toda la ruta.

#### Cómo Ocurre la Decisión

-  El router lee la **dirección IP de destino** del paquete y busca en su **tabla de enrutamiento** la entrada con el prefijo más específico que la contenga (_longest prefix match_).
-  La entrada ganadora indica el **siguiente salto** (_next hop_) y la **interfaz de salida**; el router decrementa el TTL, recalcula el checksum y despacha el paquete.
-  Todo el proceso vive en el **plano de datos** (_data plane_): la vía rápida, de hardware en routers serios, que solo consulta decisiones ya tomadas.

#### Diferencia Crítica: Forwarding vs. Routing

-  **Routing** es el **plano de control**: el proceso de *construir* la tabla de enrutamiento — hablar OSPF/EIGRP/BGP con otros routers, calcular rutas, actualizar la tabla. Es lento, inteligente y se ejecuta en segundo plano.
-  **Forwarding** es el **plano de datos**: la *aplicación* mecánica de esa tabla a cada paquete concreto — decidir "¿a qué puerto va este?" y moverlo. Es rápido, simple y constante.
-  Analogía: el routing es quien diseña el mapa de carreteras; el forwarding es el semáforo que dirige cada coche en el cruce. Un router puede reenviar millones de paquetes con una tabla que solo cambia cada pocos minutos.

### Propósito fundamental

El forwarding es la función que hace real el enrutamiento: una red puede tener el algoritmo de rutas más elegante, pero si la decisión local de "¿por dónde saco este paquete?" no es rápida y correcta en cada salto, ningún paquete llega — es la diferencia entre saber el camino y andarlo.
