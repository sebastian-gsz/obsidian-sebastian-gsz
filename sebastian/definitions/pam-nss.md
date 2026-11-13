---
def-type: atomic
version: 1.0
id: def-pam-nss
status: estandar
category: sistemas
date: 2026-09-06
tags:
  - linux
  - autenticacion
  - seguridad
  - nss
  - pam
  - administracion
aliases:
  - pam/nss
  - pluggable authentication modules
  - name service switch
---
**PAM** (_Pluggable Authentication Modules_) y **NSS** (_Name Service Switch_) forman el subsistema fundamental de gestión de identidades, resolución de nombres de usuario y autenticación en los sistemas operativos de tipo Unix y Linux.

### 1. Name Service Switch (NSS)

NSS es un marco de configuración (controlado mediante el archivo `/etc/nsswitch.conf`) que determina las fuentes de las cuales el sistema operativo obtiene información sobre bases de datos del sistema, tales como:

- **Usuarios y grupos**: Identificación de cuentas (`passwd`, `group`).
- **Resolución de redes y servicios**: Hosts, redes y protocolos.

Permite abstraer el origen de los datos, permitiendo que el sistema consulte archivos locales (`/etc/passwd`, `/etc/shadow`), servicios de directorio centralizados (como LDAP o Active Directory) o bases de datos externas de manera transparente para las aplicaciones.

### 2. Pluggable Authentication Modules (PAM)

PAM es una arquitectura modular que integra múltiples esquemas de autenticación bajo una API común. Permite a los administradores de sistemas configurar cómo se autentican los usuarios en los diferentes servicios (como SSH, sudo o pantallas de inicio de sesión) sin necesidad de modificar el código fuente de dichas aplicaciones.

-  **Pilas modulares**: Configurado a través de archivos en `/etc/pam.d/`, organiza los módulos en cuatro tipos de control: _auth_ (autenticación), _account_ (verificación de estado de cuenta), _password_ (actualización de credenciales) y _session_ (gestión del entorno de sesión).
-  **Flexibilidad**: Facilita la incorporación de métodos avanzados de inicio de sesión, como autenticación de dos factores (2FA), llaves SSH físicas o políticas estrictas de contraseñas.

### Funcionamiento conjunto

Durante un proceso de acceso (por ejemplo, mediante una conexión SSH):

1. **NSS** se encarga de verificar que el nombre de usuario introducido exista en el sistema y recupera su UID, GID y directorio base.
2. **PAM** valida que las credenciales (contraseña o clave criptográfica) proporcionadas por el usuario sean correctas y establece los límites y variables de la sesión subsiguiente.