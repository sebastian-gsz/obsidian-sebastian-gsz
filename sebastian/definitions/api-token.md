---
def-type: atomic
version: 1.0
id: def-api-token
status: estandar
category: desarrollo-software
contexto: seguridad-de-aplicaciones
date: 2026-11-12
tags:
  - api
  - autenticacion
  - tokens
aliases:
  - token de api
  - api token
  - api key
---
Un **token de API** es un **token cifrado que contiene información del usuario para autenticarse con una API**: la credencial que una aplicación presenta a un servicio — en lugar de enviar usuario y contraseña en cada llamada, el cliente presenta el token, y el servicio verifica su validez y sus permisos.

#### Qué Contiene y Cómo Funciona

-  El token encapsula la **identidad y los permisos** — quién es el cliente y qué puede hacer — firmados o cifrados para que no se puedan falsificar.
-  El flujo: el cliente se autentica UNA vez (o recibe el token del administrador) → cada petición a la API lleva el token en la cabecera (`Authorization: Bearer ...`) → la API valida el token y concede o rechaza.
-  Formas comunes: **claves de API** (secretos simples por aplicación), **tokens OAuth** (delegación con alcance — access tokens), y **JWT** (JSON Web Tokens — tokens firmados que llevan los datos DENTRO, verificables sin base de datos).

#### Por Qué Preferirlos a las Contraseñas

-  **Alcance limitado**: el token vale para UNA API con permisos concretos — la contraseña abre todo.
-  **Revocables al instante**: comprometido un token, se anula ese token — la contraseña comprometida obliga a cambiarla en todas partes.
-  **No son reutilizados por el usuario**: cada integración tiene su token — la filtración de uno no contamina los demás.
-  **Expiración**: los tokens vivos caducan — la ventana de abuso se cierra sola.

#### Diferencia Crítica: Token de API vs. Contraseña

-  La **contraseña** es la credencial maestra del usuario: abre todo, no expira sola, y se filtra con cada mal hábito.
-  El **token** es una credencial de máquina: acotada a un servicio, revocable, expirable y de uso automático.
-  La regla de diseño: las personas usan contraseñas (con MFA); las máquinas e integraciones usan tokens — mezclar ambos mundos es crear credenciales eternas e ilimitadas en scripts y repositorios.

#### Diferencia Crítica: Token de API vs. Sesión (cookies)

-  El token de API autentica a una **aplicación o integración** frente a una API.
-  La **cookie de sesión** autentica a un **usuario en su navegador** — el robo de cada una es su propio vector (session hijacking).
-  Ambos son "credenciales temporales" — y comparten la misma regla de oro: protegerlas en tránsito (TLS) y en reposo, y expirarlas pronto.

### Propósito fundamental

El token de API es la credencial de las máquinas: acotada, revocable y expirable — la forma correcta de que aplicaciones e integraciones se autentiquen sin entregar contraseñas maestras — y su diseño (alcance mínimo, expiración corta, revocación inmediata) es la diferencia entre una filtración que se contiene y una que abre todo el sistema.
