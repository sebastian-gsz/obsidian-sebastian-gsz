---
def-type: atomic
version: 1.0
id: def-attack-surface
status: estandar
category: ciberseguridad
contexto: gestion-de-riesgos
date: 2026-11-11
tags:
  - ciberseguridad
  - riesgos
  - superficie-de-ataque
aliases:
  - superficie de ataque
  - attack surface
---
La **superficie de ataque** es el **conjunto de todos los puntos vulnerables por los que un atacante podría acceder a un sistema**: cada puerto abierto, cada servicio expuesto, cada usuario con credenciales, cada aplicación con un fallo — la suma de TODAS las puertas, ventanas y grietas por las que se puede entrar.

#### Qué Compone la Superficie

-  **Digital externa**: sitios web, APIs, servidores expuestos, puertos abiertos, registros de dominio, credenciales filtradas en filtraciones públicas.
-  **Digital interna**: servicios internos, archivos compartidos, cuentas activas, software sin parchear, configuraciones por defecto.
-  **Humana**: los empleados — phisheables, engañables, extorsionables — el factor que ninguna otra superficie tiene.
-  **Física**: dispositivos accesibles, puertos USB, salas con hardware desatendido.

#### Cómo se Gestiona

-  **Inventariar**: no se puede reducir la superficie que no se conoce — descubrimiento continuo de activos y exposición (externa e interna).
-  **Reducir**: cerrar puertos innecesarios, deshabilitar servicios sobrantes, retirar cuentas muertas, parchear — cada pieza eliminada es una puerta menos. Es la lógica del hardening y de la línea de base de controles.
-  **Monitorear la que queda**: lo que no se puede cerrar, se vigila — exposición frente a superficie son conceptos hermanos.

#### Diferencia Crítica: Superficie de Ataque vs. Exposición

-  La **superficie de ataque** es el CATÁLOGO completo de puntos de entrada posibles — la propiedad del sistema.
-  La **exposición** es el ESTADO de accesibilidad de un punto concreto frente a una amenaza — el hecho de que esa puerta dé a la calle.
-  La relación: cada punto de la superficie puede estar expuesto o no — la gestión de la exposición es la técnica; la superficie es el mapa completo que se quiere hacer pequeño.

### Propósito fundamental

La superficie de ataque es el mapa de todas tus puertas: cuanto más grande, más sitios donde perder la guerra — y su gestión es una disciplina de sustracción: inventariar, reducir, vigilar — porque el atacante solo necesita UNA puerta, y el defensor tiene que cerrarlas todas.
