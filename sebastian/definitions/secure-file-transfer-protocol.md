---
def-type: atomic
version: 1.0
id: def-sftp
status: estandar
category: protocolos-de-red
contexto: transferencia-de-archivos
date: 2026-06-27
tags:
  - sftp
  - transferencia-de-archivos
  - ssh
  - seguridad
  - protocolos
aliases:
  - sftp
  - ssh file transfer protocol
  - secure file transfer protocol
---
El SFTP es un protocolo de red diseñado para la transferencia segura de archivos que opera sobre el protocolo SSH (Secure Shell). A diferencia del FTP tradicional, que transmite datos y credenciales en texto plano, el SFTP cifra tanto los comandos como la carga útil (datos), proporcionando un canal de comunicación protegido frente a interceptaciones y ataques de tipo _man-in-the-middle_.

#### Características técnicas

-  **Integración con SSH:** Utiliza las capacidades de autenticación y cifrado del protocolo SSH. Esto permite aprovechar métodos robustos como la autenticación mediante claves públicas (RSA, Ed25519) en lugar de contraseñas.
-  **Puerto único:** A diferencia del FTP, que requiere puertos separados para comandos y datos, el SFTP opera completamente sobre la conexión establecida en el puerto 22, facilitando significativamente la configuración de firewalls y reglas de red.
-  **Integridad:** Garantiza que los archivos transferidos no sean alterados durante el tránsito mediante el uso de mecanismos de validación integrados en el túnel SSH.

#### Diferenciación con otros protocolos

-  **SFTP vs. FTP:** El Ftp es inseguro; el SFTP es seguro por diseño.
-  **SFTP vs. FTP:** Aunque ambos son seguros, el FTP es básicamente FTP envuelto en una capa de TLS/SSL, mientras que el SFTP es un protocolo independiente que integra la seguridad directamente en la capa de transporte SSH, siendo más consistente y fácil de administrar en entornos donde SSH ya está desplegado.

#### Propósito arquitectónico

El SFTP es el estándar _de facto_ para la transferencia automatizada y manual de archivos en entornos de producción, especialmente en arquitecturas _on-premises_ y nubes híbridas donde se requiere un control estricto sobre la soberanía de los datos y el acceso administrativo.

#### Comando de acceso cli

Para establecer una conexión interactiva con un servidor remoto, utiliza: **`sftp usuario@servidor.ejemplo.com`**

