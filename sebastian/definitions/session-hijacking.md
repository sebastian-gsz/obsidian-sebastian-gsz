---
def-type: atomic
version: 1.0
id: def-session-hijacking
status: estandar
category: amenazas
contexto: ataques-web
date: 2026-11-11
tags:
  - sesiones
  - amenazas
  - web
aliases:
  - secuestro de sesión
  - session hijacking
  - secuestro de sesion
---
El **secuestro de sesión** (_session hijacking_) es la **toma del identificador de sesión de un usuario legítimo para suplantarlo**: el atacante no necesita usuario ni contraseña — roba la "credencial temporal" (el token o cookie de sesión) que el servidor ya entregó al usuario real, y se presenta con ella.

#### Por Qué el Token Vale Tanto

-  Cuando haces login, el servidor te entrega un **identificador de sesión** (cookie, token) que dice "esta persona YA autenticó". Cada petición siguiente lo presenta — no vuelve a pedirse la contraseña.
-  Si el atacante obtiene ese identificador, el servidor lo trata como al usuario legítimo: la sesión hijacked tiene **los mismos permisos, sin nuevo login** — robar el ticket es robar la sesión entera.

#### Cómo se Roba el Identificador

-  **Intercepción**: tráfico sin cifrar (HTTP plano) o posicionamiento on-path — la cookie viaja legible.
-  **XSS (_cross-site scripting_)**: el script inyectado lee `document.cookie` desde el navegador de la víctima — el robo sin tocar la red.
-  **Predicción de IDs de sesión**: servidores mal configurados que generan identificadores predecibles.
-  **Fixación de sesión** (_session fixation_): el atacante CONSIGUE que la víctima use un ID de sesión que él ya conoce — y luego solo espera a que haga login.

#### Diferencia Crítica: Secuestro de Sesión vs. Robo de Credenciales

-  Las **credenciales** son la llave permanente: usuario y contraseña — con ellas, el atacante entra cuando quiera.
-  La **sesión secuestrada** es la llave temporal: vale solo mientras la sesión viva (expiración, logout) — pero NO exige al atacante ninguna autenticación.
-  El secuestro es más fugaz pero más directo: ni MFA lo detiene — el atacante llega DESPUÉS del segundo factor, cuando ya no se pregunta nada.

#### Defensa

**TLS obligatorio** (la cookie nunca en claro); cookies con **HttpOnly** (inaccesibles para el JavaScript del XSS), **Secure** y **SameSite**; IDs de sesión largos y aleatorios regenerados tras el login; expiración corta e inactividad; y detección de sesión anómala (cambio brusco de IP/User-Agent en la misma sesión).

### Propósito fundamental

El secuestro de sesión explota el compromiso del diseño web: para no pedir contraseña en cada clic, el servidor confía en un token — y el atacante que roba ese token hereda la confianza sin heredar el trabajo de conseguirla — por eso la defensa es blindar el token (cifrado, inaccesible al script, efímero) y regenerarlo en cada salto de privilegio.
