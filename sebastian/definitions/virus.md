---
def-type: atomic
version: 1.0
id: def-virus
status: estandar
category: amenazas
contexto: malware
date: 2026-11-12
tags:
  - virus
  - malware
  - amenazas
aliases:
  - virus
  - virus informático
---
Un **virus** es un programa que **puede replicarse y propagarse a otros archivos o sistemas, adjuntándose a archivos legítimos** — y cuando estos se abren, el virus se activa. A diferencia de los troyanos, **el virus SÍ se replica**: es el parásito clásico del malware — necesita anfitrión y necesita que alguien ejecute el anfitrión.

#### Cómo Funciona

-  **Adjuntarse**: el virus se inserta dentro de un archivo legítimo — un ejecutable, un documento con macros — como parásito que viaja en su anfitrión.
-  **Activarse**: al abrir el archivo infectado, el código del virus se ejecuta primero.
-  **Replicarse**: busca otros archivos para infectarlos y se extiende — **a través de correos electrónicos infectados, descargas de software comprometido o sitios web maliciosos** — y una dentro del sistema, puede moverse por redes locales o dispositivos conectados.
-  **El daño**: puede dañar archivos, ralentizar el sistema o robar información personal.

#### El Ciclo de Infección

1.  El anfitrión infectado llega (adjunto, descarga, USB).
2.  El usuario ejecuta/abre — el virus despierta.
3.  El virus infecta otros archivos del sistema y se esconde.
4.  Los archivos infectados viajan (compartidos, adjuntos, USB) — y el ciclo se repite en cada máquina que los ejecute.

#### Diferencia Crítica: Virus vs. Troyano

-  El **troyano NO se replica**: entra por engaño, se disfraza de software legítimo y espera ser instalado — un solo paquete, sin contagio.
-  El **virus SÍ se replica**: adjunta copias de sí mismo a otros archivos y se propaga con cada ejecución.
-  La distinción del legacy es exacta: el troyano es una puerta que se abre una vez; el virus es un contagio que se multiplica por cada archivo tocado.

#### Diferencia Crítica: Virus vs. Gusano

-  El **virus** necesita ANFITRIÓN y ACCIÓN del usuario: viaja dentro de archivos legítimos.
-  El **gusano** es autónomo: se propaga por la red explotando vulnerabilidades, sin anfitrión y sin usuario — mucho más rápido.
-  En rigor, "virus" es la especie más antigua y mediática del malware — pero hoy el gusano y el troyano superaron sus mecánicas: el virus sobrevive como concepto y como contaminación de archivos.

#### Defensa

Antivirus con detección de firmas y comportamiento; no abrir adjuntos ni ejecutar archivos de origen dudoso; y en entornos actuales — EDR que vigile la creación de archivos ejecutables inusuales, porque el virus moderno se disfraza de todo menos de virus.

### Propósito fundamental

El virus es el parásito original del mundo digital: se adjunta a archivos legítimos y se propaga con cada apertura — la especie que puso "virus" en el vocabulario de todos y que definió el modelo de contagio por anfitrión — hoy superada por gusanos y troyanos, pero eterna como concepto fundacional del malware replicante.
