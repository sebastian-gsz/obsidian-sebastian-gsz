---
def-type: atomic
version: 1.0
id: def-rootkit
status: estandar
category: amenazas
contexto: malware
date: 2026-11-11
tags:
  - rootkit
  - malware
  - amenazas
  - kernel
aliases:
  - rootkit
  - rootkits
  - rootkit ligero
---
Un **rootkit** es **malware diseñado para modificar el sistema operativo a fin de crear una puerta trasera** — y sobre todo, para **ocultarse**: sus herramientas alteran el comportamiento del SO para esconder procesos, archivos, conexiones y usuarios. Su nombre lo dice: kit para obtener y mantener acceso **root**.

#### Cómo se Clasifica

-  **User-mode**: intercepta las llamadas del sistema en espacio de usuario — más simple, más detectable.
-  **Kernel-mode**: opera DENTRO del kernel — control total sobre las defensas, invisible para las herramientas que dependen del propio SO. Los **rootkits ligeros (LKM)** de Linux son módulos de kernel cargados a mano — el caso del legacy.
-  **Bootkit**: infecta el arranque (MBR/UEFI) — activa antes que el propio sistema operativo y sobrevive a reinstalaciones.

#### El Caso Reptile (rootkit ligero LKM)

-  **Oculta puertos, procesos o archivos específicos**: lo que el rootkit marca, la lista de procesos y el escáner de puertos no lo ven.
-  **Se ejecuta en modo kernel**, brindando control total sobre las defensas — el antivirus pregunta al SO; el rootkit YA ES parte de la respuesta del SO.
-  Aunque su uso ético está limitado, en entornos controlados puede ser útil para **estudiar técnicas de evasión** — el doble uso de siempre: entender al ocultador para construir al detector.

#### Por Qué es el Malware Más Difícil de Detectar

-  **Corrompe la fuente de verdad**: los detectores preguntan al sistema "¿qué procesos hay?" — y el rootkit controla LA respuesta. Detectarlo exige mirar desde FUERA: análisis offline del disco, memoria volcada, comparación con la vista del kernel.
-  **Persistencia extrema**: mientras el kernel lo cargue, sobrevive a reinicios y a la limpieza superficial.

#### Diferencia Crítica: Rootkit vs. Troyano

-  El **troyano** engaña para ENTRAR: se disfraza de software útil y abre la puerta.
-  El **rootkit** trabaja DESPUÉS de entrar: su función no es entrar sino OCULTAR y mantener el acceso — rara vez es la puerta; es el mecanismo que hace invisible a quien ya cruzó.
-  En un ataque real se combinan: el troyano abre, el rootkit encubre — el primero conquista, el segundo reina.

#### Defensa

Mantener el kernel y firmware actualizados; deshabilitar carga de módulos donde no se necesita; arrancar con Secure Boot; y ante la sospecha — confiar en el análisis desde fuera (live CD, imanes forenses), nunca en las herramientas del sistema comprometido.

### Propósito fundamental

El rootkit es el malware que rompe la confianza básica del análisis: si lo que pregunta el sistema ya está mentido, ninguna herramienta interna sirve — y por eso define la regla de oro de la detección profunda: ante la sospecha de rootkit, mirar el sistema desde fuera, porque dentro de su mentira no se puede confiar en nada.
