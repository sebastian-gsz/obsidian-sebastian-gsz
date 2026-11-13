---
def-type: atomic
version: 1.0
id: def-default-credential-chain
status: estandar
category: herramientas
contexto: identidad-y-acceso
date: 2026-06-16
tags:
  - nube
  - autenticacion
  - seguridad
  - desarrollo
aliases:
  - default credential chain
  - application default credentials
  - managed identity auth
  - cadena de credenciales por defecto
  - adc
  - defaultazurecredential
  - default credential provider chain
---
La cadena de credenciales por defecto es una estrategia de autenticación estándar en entornos de nube que permite a los SDKs y bibliotecas de cliente localizar automáticamente las credenciales de seguridad adecuadas según el entorno donde se ejecuta el código. Este mecanismo proporciona una autenticación transparente, segura y portátil que funciona de manera idéntica tanto en entornos de desarrollo local como en despliegues a gran escala en la nube.

-  **Faceta de desarrollo:** Elimina la necesidad de incrustar manualmente claves de acceso o secretos en el código fuente, promoviendo el uso de configuraciones dinámicas.
-  **Estandarización técnica:** El concepto es universal en la industria: Google Cloud utiliza ADC (Application Default Credentials), AWS emplea la _Default Credential Provider Chain_ y Azure utiliza la clase _DefaultAzureCredential_.
-  **Funcionamiento operativo:** La aplicación busca credenciales siguiendo una jerarquía lógica predefinida, como variables de entorno, metadatos de la instancia (máquina virtual o contenedor) o configuraciones de herramientas de desarrollo (CLI).
-  **Faceta de seguridad:** Refuerza la seguridad al abstraer la gestión de secretos del código y delegarla al entorno de ejecución, permitiendo que la aplicación adopte la identidad (Managed Identity o Service Account) asignada a la infraestructura donde reside.