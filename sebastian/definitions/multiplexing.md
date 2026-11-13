---
def-type: atomic
version: 1.0
id: def-multiplexacion
status: estandar
category: redes
contexto: transporte-de-datos
date: 2026-11-11
tags:
  - redes
  - transporte
  - tcp
aliases:
  - multiplexación
  - multiplexado
  - multiplexing
---
La **multiplexación** es la técnica por la que, **una vez segmentados los datos, los paquetes de diferentes conversaciones pueden intercalarse en la red y enviarse secuencialmente hacia su destino final, optimizando el uso del ancho de banda disponible**: muchas conversaciones comparten un mismo enlace — cada una con sus segmentos entrelazados con los de las demás.

#### Cómo Funciona en la Práctica

-  El transporte **segmenta** los datos de cada aplicación en paquetes pequeños.
-  De múltiples conversaciones simultáneas (navegador, correo, llamada), los segmentos se **intercalan** en el mismo enlace: un fragmento del chat, uno del vídeo, uno de la descarga — ninguno espera a que termine el otro.
-  En el destino, la **demultiplexación** reconstruye cada conversación: los números de **puerto** indican a qué aplicación pertenece cada segmento.

#### Por Qué Importa

-  **El enlace nunca descansa**: sin multiplexación, cada conversación necesitaría su propia línea o esperaría su turno completo — el ancho de banda se desperdiciaría en huecos.
-  **La red escala con usuarios**: un enlace sirve a miles de sesiones simultáneas — es la razón por la que tu WiFi o tu fibra sostienen toda la casa a la vez.
-  Las versiones modernas lo llevan al extremo: HTTP/2 multiplexa peticiones en una conexión, y HTTP/3 (QUIC) lo hace entre flujos independientes que no se bloquean entre sí.

#### Diferencia Crítica: Multiplexación vs. Demultiplexación

-  Son la misma operación en dos sentidos: en el **emisor**, la multiplexación entremezcla los segmentos de muchas sesiones hacia el enlace; en el **receptor**, la demultiplexación los separa y entrega cada uno a su aplicación correcta — guiándose por los puertos de origen y destino que lleva cada segmento.
-  El puerto es la clave de ambos: sin números de puerto, un paquete intercalado sería un fragmento sin destinatario posible.

### Propósito fundamental

La multiplexación es la razón por la que una sola conexión sostiene toda tu vida digital: convierte un enlace compartido en un servicio para muchas conversaciones simultáneas — intercalando fragmentos con precisión de puerto y reconstruyendo cada diálogo intacto al final — el arte de que muchos hablen por el mismo cable y nadie se confunda.
