---
def-type: atomic
version: 1
id: def-early-late-binding
status: estandar
category: ingenieria-de-software
date: 2026-07-15
tags:
  - compilacion
  - tiempo-de-ejecucion
  - polimorfismo
aliases:
  - enlace estático
  - enlace dinámico
  - static binding
  - dynamic binding
  - early binding
  - late binding
---
Estos términos definen el momento en el cual el compilador o el entorno de ejecución vincula una llamada a un método o propiedad con su implementación específica. La elección entre ambos impacta directamente en el rendimiento y la flexibilidad del código.

### Early binding (enlace estático)

Se produce durante la fase de compilación. El compilador conoce exactamente qué método o propiedad debe invocar basándose en el tipo declarado del objeto.

-  **Rendimiento**: Es superior, ya que no requiere búsquedas en tiempo de ejecución.
-  **Detección de errores**: Cualquier error en la llamada se detecta inmediatamente durante la compilación.
-  **Uso común**: Métodos no virtuales, sobrecarga de métodos (overloading) y tipos estáticos.
### Late binding (enlace dinámico)

Ocurre durante la ejecución (runtime). El sistema determina la implementación específica a invocar basándose en el tipo real del objeto en ese instante.

-  **Flexibilidad**: Es la base del polimorfismo, permitiendo que un mismo código se comporte de manera diferente según el tipo de objeto instanciado.
-  **Rendimiento**: Ligeramente inferior debido a la sobrecarga que implica la resolución de tipos en tiempo de ejecución.
-  **Uso común**: Métodos virtuales (virtual methods), interfaces y reflexión (reflection).
### Comparativa de implementación

|**Característica**|**Early binding**|**Late binding**|
|---|---|---|
|Tiempo de resolución|Compilación|Ejecución|
|Rendimiento|Optimizado|Menor (sobrecarga)|
|Flexibilidad|Limitada|Alta (polimorfismo)|
|Errores|Compile-time|Runtime|
_Nota técnica: En el ecosistema .NET (C#), el uso de la palabra clave `virtual` o la implementación de interfaces fuerza al sistema a utilizar una tabla de métodos virtuales (vtable), habilitando así el late binding._