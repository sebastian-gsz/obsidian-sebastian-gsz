---
def-type: atomic
version: 1.0
id: def-spn
status: estandar
category: redes
contexto: autenticacion-de-red
date: 2026-11-11
tags:
  - kerberos
  - autenticacion
  - identidades
aliases:
  - spn
  - service principal name
  - nombre principal de servicio
---
Un **SPN** (_Service Principal Name_ — nombre principal de servicio) es un **identificador único para un servicio en una red que utiliza autenticación Kerberos**: el nombre por el que un cliente encuentra y autentica a UN servicio concreto dentro del dominio — la etiqueta con la que Kerberos sabe qué llave entregar para qué puerta.

#### Cómo se Compone

El SPN está formado por:

-  Una **clase de servicio**: qué protocolo es — `HTTP`, `MSSQLSvc`, `HOST`...
-  Un **nombre de host**: la máquina que lo ofrece.
-  Ocasionalmente, un **puerto** — nota: **los SPN de HTTP no requieren puerto** (el puerto estándar 80/443 es implícito).

Ejemplo: `HTTP/servidor-web.miempresa.com` — el servicio web de ese host, registrado para autenticarse vía Kerberos.

#### Cómo Funciona en Kerberos

-  El cliente que quiere hablar con el servicio pide al controlador de dominio un **ticket para ese SPN** — el KDC lo emite cifrado con la clave del servicio.
-  El servicio lo descifra con SU clave — la prueba de identidad mutua sin enviar contraseñas por la red: la esencia de Kerberos aplicada a cada servicio.
-  Por eso cada servicio que se autentica por Kerberos debe tener un SPN **único y correctamente registrado** — duplicados o faltantes son la causa clásica de fallos de autenticación en dominios Windows.

#### Diferencia Crítica: SPN vs. UPN

-  El **UPN** (_User Principal Name_) identifica a un USUARIO en el dominio (`usuario@miempresa.com`) — para que la persona se autentique.
-  El **SPN** identifica a un SERVICIO en un host (`HTTP/host.miempresa.com`) — para que el servicio se autentique ante los clientes.
-  Ambos son "nombres principales" de Kerberos — uno es la credencial de la persona; el otro, la etiqueta del servicio ante el que la persona se autentica.

### Propósito fundamental

El SPN es la dirección de Kerberos para los servicios: el identificador único por el que un cliente pide su ticket y un servicio prueba quién es — la pieza que hace posible la autenticación mutua sin contraseñas en la red, y cuya correcta y única existencia es la diferencia entre un SSO fluido y un dominio lleno de errores de autenticación.
