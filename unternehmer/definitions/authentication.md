---
def-type: atomic
version: 1.0
id: def-authentication
status: estandar
category: conceptos-generales
contexto: gestión-de-identidad
date: 2026-06-16
tags:
  - identidad
  - acceso
  - seguridad
aliases:
  - authentication
  - autenticación
---
Proceso técnico mediante el cual un sistema verifica la veracidad de la identidad declarada por una entidad (usuario, dispositivo o proceso).

-  **Factores de autenticación (Categorías):**
    
    -  **Conocimiento:** Algo que el usuario sabe (ej. contraseñas, PIN, respuestas a preguntas de seguridad).
    -  **Posesión:** Algo que el usuario tiene (ej. tokens físicos, tarjetas inteligentes, smartphones con aplicaciones de autenticación).
    -  **Inherencia:** Algo que el usuario es (ej. biometría: huella digital, reconocimiento facial, escaneo de iris)
-  **Autenticación de Múltiple Factor (MFA/2FA):** Estrategia de seguridad que requiere dos o más factores independientes para reducir el riesgo de acceso no autorizado en caso de compromiso de una credencial.
-  **Relación jerárquica:** Es el paso previo y obligatorio para el **Control de Acceso** (Autorización), donde se definen los permisos una vez que la identidad ha sido confirmada.