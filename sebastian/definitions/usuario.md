---
def-type: atomic
version: 1.0
id: def-usuario
status: estandar
category: general
contexto: computacion
date: 2026-11-12
tags:
  - vocabulario
  - computacion
  - identidades
aliases:
  - usuario
  - usuarios
  - user
---
Un **usuario** es la **persona que interactúa con una computadora** — el operador humano detrás de la pantalla: quien lanza los comandos, usa las aplicaciones, consume los servicios y genera los datos. Es también el término técnico para la cuenta con la que esa persona se autentica en un sistema.

#### Los Dos Sentidos del Término

-  **La persona**: el humano que usa la máquina — el usuario final de cualquier software.
-  **La cuenta**: la identidad técnica en el sistema — `usuario`, `svc-crm`, `admin` — con sus credenciales, permisos y sesiones. En seguridad, casi siempre nos referimos a esta: el usuario como IDENTIDAD gestionada.

#### En el Contexto de Seguridad

-  El usuario es el **sujeto de toda la seguridad de identidades**: la gestión de identidad y acceso (IAM) crea sus cuentas, el principio de menor privilegio limita sus permisos, la autenticación comprueba que quien reclama la identidad la merece.
-  El usuario es además el **objetivo predilecto del atacante**: el phishing lo engaña, el tailgating lo sigue, el secuestro de sesión lo suplanta — la primera línea de defensa (y de ataque) es siempre la persona.

#### Diferencia Crítica: Usuario vs. Cuenta de Servicio

-  El **usuario** es una persona: interactúa, decide, puede ser engañado.
-  La **cuenta de servicio** es una identidad para MÁQUINAS: sin persona detrás, sin phishing posible, con permisos acotados al servicio y expiración explícita.
-  La confusión clásica de seguridad: dar a cuentas de servicio los hábitos de usuarios (contraseñas "memorables", sin expiración) — cada identidad debe tratarse según lo que hay detrás: humano o máquina.

### Propósito fundamental

El usuario es el punto donde la computación se encuentra con la persona: quien interactúa con la máquina y la identidad con la que el sistema lo reconoce — y en seguridad, el doble papel del usuario (víctima frecuente y primera línea de defensa) define por qué las mejores arquitecturas protegen al usuario de los atacantes Y de sí mismo.
