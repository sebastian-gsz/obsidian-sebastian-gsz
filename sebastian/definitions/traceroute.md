---
def-type: atomic
version: 1.0
id: def-traceroute
status: estandar
category: redes
contexto: diagnostico-de-red
date: 2026-11-12
tags:
  - redes
  - diagnostico
  - icmp
aliases:
  - traceroute
  - trace route
  - tracert
---
**Traceroute** es una **herramienta de diagnóstico de red que rastrea la ruta que toman los paquetes de datos a través de la red** hasta su destino: el mapa salto por salto del camino real — quién pasa por dónde y cuánto tarda en cada tramo.

#### Cómo Funciona (el Truco del TTL)

-  Envía paquetes al destino con un valor **TTL (_Time to Live_) cada vez más bajo**: primero TTL=1, luego 2, luego 3...
-  Cada enrutador del camino **reduce el TTL en uno**; cuando llega a **cero**, el enrutador descarta el paquete y envía un **mensaje ICMP de respuesta** (_Time Exceeded_) al origen.
-  Cada mensaje ICMP revela la dirección del enrutador que descartó — y así, escalando el TTL, se van revelando los saltos en orden: TTL=1 revela el primer router, TTL=2 el segundo...
-  Un **salto** es un enrutador que los paquetes atravesaron; la cantidad de saltos es la distancia en routers entre origen y destino.

#### Qué se Lee en su Salida

-  La **ruta completa**: cada línea es un salto con su IP (y nombre si resuelve).
-  Los **tiempos por salto**: tres sondas por salto miden la latencia de cada tramo — el tramo donde los tiempos explotan es el cuello de botella.
-  Los **asteriscos**: saltos que no responden — firewalls que filtran ICMP o routers silenciosos (la ruta existe aunque no se presente).

#### Diferencia Crítica: Traceroute vs. Ping

-  El **ping** responde UNA pregunta: ¿el destino es alcanzable y con cuánta latencia? — el destino final.
-  El **traceroute** responde OTRA: ¿POR DÓNDE va el camino? — la ruta completa y dónde se degrada.
-  Se complementan en todo diagnóstico: el ping dice SI hay problema; el traceroute dice DÓNDE está el problema — el destino fallando con ping exige ver el camino para localizar el salto culpable.

#### La Nota de Seguridad

Para el atacante, el traceroute también es un mapa — de la red del objetivo (saltos, firewalls, geometría). Por eso muchos firewalls limitan el TTL-exceeded saliente: el diagnóstico legítimo y el reconocimiento usan el mismo instrumento.

### Propósito fundamental

Traceroute es el explorador de rutas de la red: mediante el truco del TTL ascendente, convierte cada enrutador del camino en una respuesta ICMP reveladora — el mapa salto a salto que todo diagnóstico necesita cuando el destino falla y hay que averiguar DÓNDE del camino se rompió todo.
