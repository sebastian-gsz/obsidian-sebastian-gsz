---
def-type: atomic
version: 1.0
id: def-switch
status: estandar
category: dispositivos-de-red
contexto: arquitectura-de-redes
date: 2026-06-26
tags:
  - redes
  - hardware
  - lan
  - capa-2-osi
aliases:
  - switch
  - conmutador de red
  - conmutador
---
Un switch es un dispositivo de red que opera en la capa de enlace de datos (Capa 2 del modelo OSI). Su función principal es la gestión inteligente del tráfico de datos dentro de una red de área local (LAN), dirigiendo las tramas exclusivamente hacia el puerto donde se encuentra el dispositivo de destino.

#### Funcionamiento interno

El switch utiliza una tabla de direcciones MAC para mapear las identidades de los dispositivos conectados a sus puertos físicos. Este proceso de aprendizaje ocurre de la siguiente manera:

-  **Aprendizaje:** Cuando un paquete llega a un puerto, el switch examina la dirección MAC de origen y la registra en su tabla junto con el número de puerto asociado.
-  **Filtrado y reenvío:** Al recibir una trama dirigida a una dirección MAC específica, el switch consulta su tabla. Si la dirección es conocida, reenvía la trama solo a ese puerto; si es desconocida o es un broadcast, la envía a todos los puertos excepto al de origen.

#### Comparativa técnica

El switch supera las limitaciones de los antiguos concentradores (Hubs) mediante varias optimizaciones:

-  **Eliminación de colisiones:** A diferencia del Hub, que transmite todos los datos a todos los puertos (creando un dominio de colisión único), el switch segmenta la red creando dominios de colisión independientes para cada puerto.
-  **Comunicación full-duplex:** Permite que los dispositivos envíen y reciban datos simultáneamente en el mismo medio físico sin interferencias.
-  **Eficiencia de ancho de banda:** Al restringir el tráfico a los puertos de destino, el ancho de banda total de la red se aprovecha de forma mucho más eficaz.

#### Impacto en el rendimiento

La adopción de switches es el estándar para redes empresariales y complejas debido a su capacidad para escalar el rendimiento. Al reducir la saturación innecesaria en la red y permitir comunicaciones directas entre múltiples pares de dispositivos de forma simultánea, el switch garantiza la latencia mínima necesaria para aplicaciones críticas y servicios de red modernos.