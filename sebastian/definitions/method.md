---
def-type: atomic
version: 1.0
id: def-metodo
status: estandar
category: desarrollo-software
contexto: programacion-orientada-a-objetos
date: 2026-11-11
tags:
  - poo
  - programacion
  - codigo
aliases:
  - método
  - method
  - método en poo
---
Un **método** es un **bloque de código que contiene una serie de instrucciones que realizan una tarea específica**, con un nombre propio, la posibilidad de recibir **parámetros** (datos de entrada) y de **devolver un valor** (dato de salida). Es una pieza fundamental de la **programación orientada a objetos**: permite **encapsular la lógica y reutilizar el código** en lugar de repetirlo.

#### Anatomía

-  **Nombre**: cómo se le invoca — debe comunicar qué hace (`calcularSaldo()`, `enviarAlerta()`).
-  **Parámetros**: los datos de entrada que recibe para trabajar.
-  **Cuerpo**: las instrucciones que ejecuta — la lógica encapsulada.
-  **Retorno**: el valor que entrega al terminar (o nada, si solo actúa).
-  En POO, el método vive **dentro de una clase** y opera sobre los datos del objeto que lo invoca: `cuenta.retirar(500)` — el método `retirar` trabaja sobre LA cuenta concreta.

#### Qué Aporta

-  **Encapsulación**: la lógica vive junto a los datos que maneja y oculta sus detalles — el que llama no necesita saber cómo hace su trabajo.
-  **Reutilización**: se escribe una vez y se invoca infinitas veces — el antídoto contra el código copiado y pegado.
-  **Abstracción**: los nombres de métodos son el vocabulario con el que se lee un programa — bien nombrados, el código se cuenta.

#### Diferencia Crítica: Método vs. Función

-  La distinción clásica de POO: una **función** existe por sí sola y opera sobre los datos que le pasan; un **método** pertenece a un objeto o clase y opera sobre SU estado interno.
-  Lenguajes como Python o JavaScript lo difuminan (todo es un objeto y las funciones pueden volverse métodos), pero el concepto importa: el método ata la lógica a los datos que gobierna.
-  No confundir con las funciones de hoja de cálculo (SUMA, PROMEDIO) — allí "función" designa comandos preestablecidos del software, no código propio del programador.

### Propósito fundamental

El método es la unidad de comportamiento en programación orientada a objetos: encierra una tarea en un bloque con nombre, entradas y salida — y al atar la lógica a los datos que le pertenecen, convierte el código de una lista de instrucciones en un conjunto de objetos que saben hacer su trabajo y lo hacen una sola vez, bien.
