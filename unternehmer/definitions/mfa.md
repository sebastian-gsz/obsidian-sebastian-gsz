---
def-type: atomic
version: 1.0
id: def-mfa
status: estandar
category: controles-de-seguridad
contexto: ciberseguridad
date: 2026-06-26
tags:
  - identidad
  - acceso
  - seguridad
  - mfa
aliases:
  - mfa
  - 2fa
  - autenticación de doble factor
  - multi-factor authentication
---
El MFA es una medida de seguridad de **defensa en profundidad** que requiere que un usuario verifique su identidad mediante la combinación de dos o más factores independientes de autenticación antes de permitir el acceso a un sistema, aplicación o recurso. Es uno de los controles más eficaces para mitigar el riesgo de suplantación de identidad.

#### Los tres pilares de la autenticación

Para que el MFA sea efectivo, los factores deben pertenecer a categorías distintas:

-  **Algo que sabes:** Conocimiento (ej. contraseñas, PINs, respuestas a preguntas de seguridad).
-  **Algo que tienes:** Posesión (ej. tokens físicos, códigos generados por apps, notificaciones push en dispositivos móviles, tarjetas inteligentes).
-  **Algo que eres:** Inherencia (ej. biometría como huella dactilar, reconocimiento facial o escaneo de retina).

#### Importancia operativa

El valor fundamental del MFA reside en la **resistencia al compromiso de credenciales**. Incluso si un atacante obtiene la contraseña (factor de conocimiento) mediante _phishing_ o ataques de fuerza bruta, no podrá completar el proceso de inicio de sesión sin el segundo factor (posesión o inherencia).

#### Consideraciones arquitectónicas

-  **Phishing-Resistant MFA:** Los arquitectos de seguridad modernos priorizan factores resistentes al phishing (como llaves físicas FIDO2/WebAuthn) sobre métodos basados en SMS o correo electrónico, los cuales pueden ser interceptados mediante ataques de _SIM swapping_ o _man-in-the-middle_.
-  **Contextual Awareness:** En entornos de _Zero Trust_, el MFA no solo se activa por contraseña, sino también por contexto (ubicación, dispositivo, hora), reduciendo la fricción para el usuario legítimo mientras se mantiene la seguridad estricta para intentos de acceso anómalos.