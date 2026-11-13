---
def-type: atomic
version: 1.0
id: def-dll
status: estandar
category: componentes-del-sistema
contexto: ingeniería-de-sistemas
date: 2026-06-20
tags:
  - windows
  - arquitectura-software
  - modularidad
aliases:
  - biblioteca de enlace dinámico
  - dynamic link library
  - dll
---
Una biblioteca de enlace dinámico (DLL) es un archivo de biblioteca compartida en sistemas operativos Windows que contiene código, datos o recursos que pueden ser invocados por múltiples aplicaciones o procesos simultáneamente. A diferencia de las bibliotecas estáticas, las DLL no se integran directamente en el archivo ejecutable (`.exe`) durante el proceso de compilación, sino que se cargan en la memoria bajo demanda, estableciendo un "enlace dinámico" durante la ejecución (_runtime_).

-  **Arquitectura de carga:** Al separar las funciones y procedimientos compilados del ejecutable principal, el sistema operativo puede gestionar la memoria de forma más eficiente, cargando únicamente los módulos necesarios en el momento en que se requieren.
-  **Eficiencia de recursos:** Dado que múltiples procesos pueden mapear la misma instancia de una DLL en memoria, se reduce significativamente el consumo de RAM y el uso de espacio en disco en comparación con la duplicación de código en cada ejecutable.
-  **Mantenibilidad:** Facilita la actualización o corrección de módulos específicos (como controladores de periféricos o librerías de funciones) sin necesidad de recompilar o reinstalar la aplicación completa que las utiliza, permitiendo un despliegue de parches más ágil.
-  **Modularidad:** Permite a los desarrolladores dividir sistemas complejos en módulos funcionales independientes, favoreciendo la reutilización de código y la especialización de componentes.
-  **DLL Hell y gestión de versiones:** Aunque tradicionalmente las DLL residían principalmente en `C:\Windows\System32`, la gestión de versiones ha evolucionado. Para evitar conflictos (conocidos como "DLL Hell", donde una actualización sobrescribe una versión necesaria), las aplicaciones modernas suelen ubicar sus dependencias en directorios locales, promoviendo arquitecturas de despliegue aisladas.