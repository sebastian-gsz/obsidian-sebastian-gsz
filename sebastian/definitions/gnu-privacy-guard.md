---
def-type: atomic
version: 1.0
id: def-gpg
status: estandar
category: criptografía
contexto: cifrado-y-firmas
date: 2026-07-02
tags:
  - gpg
  - gnupg
  - criptografia
  - cifrado
  - firma-digital
aliases:
  - gpg
  - gnupg
  - gnu privacy guard
---
GPG es una implementación de código abierto del estándar OpenPGP (RFC 4880), diseñada para proporcionar seguridad en la comunicación y el almacenamiento de datos. Permite cifrar archivos, firmar digitalmente mensajes o paquetes, y verificar la integridad de las firmas, asegurando la autenticidad y la confidencialidad.

#### Características técnicas

-   **Cifrado híbrido:** Combina criptografía de clave asimétrica (para distribuir claves públicas) y cifrado simétrico (para cifrar el cuerpo de los datos), lo cual es altamente eficiente para grandes volúmenes de información.
-   **Modelo de confianza:** Utiliza el modelo de _Web of Trust_ (WoT), donde los usuarios firman las claves de otros para validar su identidad, descentralizando la autoridad de certificación.
-   **Integridad:** Las firmas digitales garantizan que el contenido no ha sido alterado desde el momento en que fue firmado.

#### Propósito arquitectónico

Es la herramienta estándar para la protección de la cadena de suministro de software (firmado de paquetes, repositorios de código) y la comunicación segura entre administradores de sistemas y desarrolladores. Es esencial en flujos de trabajo que requieren identidad verificable y seguridad _end-to-end_.