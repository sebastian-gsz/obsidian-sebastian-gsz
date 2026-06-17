---
def-type: atomic
aliases:
  - Default Credential Chain
  - Application Default Credentials
  - Managed Identity Auth
  - Cadena de credenciales por defecto
  - ADC
tags:
  - nube
  - autenticación
  - seguridad
  - desarrollo
category: herramientas
contexto: identidad-y-acceso
version: 1
date: 2026-06-16
status: estandar
---
Estrategia de autenticación estándar en entornos de nube que permite a los SDKs y bibliotecas de cliente localizar automáticamente las credenciales de seguridad adecuadas según el entorno donde se ejecuta el código.

*  **Faceta de desarrollo**: Elimina la necesidad de incrustar manualmente claves de acceso o secretos en el código fuente, promoviendo el uso de configuraciones dinámicas.
*  **Faceta de estandarización técnica**: Aunque Google Cloud lo denomina específicamente **ADC (Application Default Credentials)**, el concepto es universal en la industria:

    * **AWS**: Lo implementa a través de la *Default Credential Provider Chain*.
    * **Azure**: Se gestiona mediante la clase *DefaultAzureCredential*.
*  **Funcionamiento operativo**: La aplicación busca credenciales siguiendo una jerarquía lógica predefinida, como variables de entorno, metadatos de la instancia (máquina virtual o contenedor), o configuraciones de herramientas de desarrollo (CLI).
*  **Faceta de seguridad**: Refuerza la seguridad al abstraer la gestión de secretos del código y delegarla al entorno de ejecución, permitiendo que la aplicación adopte la identidad (Managed Identity / Service Account) asignada a la infraestructura donde reside.
*  **Propósito**: Proporcionar un mecanismo de autenticación transparente, seguro y portátil que funcione de manera idéntica tanto en entornos de desarrollo local como en despliegues a gran escala en la nube.