
-  **Enlaces**

	- **[ASN JavaScript Decoder ](https://lapo.it/asn1js/)**
	- **[Documentación certificado x.509 ](https://www.rfc-editor.org/info/rfc5280/)**

Un **certificado X.509** es un documento digital estándar que vincula una clave criptográfica pública con una identidad específica (como un sitio web, un servidor, una organización o una persona). Este vínculo está avalado digitalmente por una entidad de confianza conocida como **Autoridad de Certificación (CA)**.

Es el formato estándar utilizado en la **Infraestructura de Clave Pública (PKI)** y constituye la base de la seguridad en Internet moderna. 
![[barra.gif]]
##### **Descripciones generales**

Un certificado X.509 contiene información estructurada (basada en el estándar ASN.1), entre la que destaca:

-  **Versión y número de serie:** Indican la versión del estándar utilizada y un identificador único asignado por la CA.
-  **Algoritmo de firma:** El método criptográfico que usa la CA para firmar el certificado.
-  **Emisor (Issuer):** Los datos de la Autoridad de Certificación que emitió y firmó el certificado.
-  **Periodo de validez:** Las fechas de inicio y expiración (los certificados caducan por seguridad).
-  **Sujeto (Subject):** La identidad del propietario del certificado (por ejemplo, el dominio `ejemplo.com`).
-  **Clave pública del sujeto:** La clave pública que se utilizará para cifrar información o verificar firmas digitales.
-  **Firma digital de la CA:** Sello criptográfico que garantiza que el certificado es auténtico y no ha sido alterado.
    
**Usos principles**

Los certificados X.509 se emplean en una gran variedad de escenarios de seguridad:

-  **Seguridad Web (HTTPS / TLS):** Permiten cifrar las comunicaciones entre un navegador web y un servidor, asegurando que los datos viajen de forma confidencial y demostrando la legitimidad del sitio.
-  **Autenticación de red y VPNs:** Se usan para verificar la identidad de dispositivos o usuarios que intentan acceder a redes corporativas o sistemas seguros.
-  **Firma de código y software:** Los desarrolladores los utilizan para firmar aplicaciones, garantizando al usuario final que el programa no ha sido modificado maliciosamente desde su creación.
-  **Correo electrónico seguro (S/MIME):** Permiten cifrar y firmar digitalmente correos electrónicos para asegurar su privacidad e integridad.

**¿Cómo funciona la cadena de confianza?**

Para que un certificado sea considerado válido, no basta con que exista; debe formar parte de una **cadena de confianza**. Tu sistema operativo o navegador web incluye una lista preinstalada de **Autoridades de Certificación Raíz** (Root CAs) altamente confiables. Cuando visitas una web segura, el servidor presenta su certificado X.509, el cual es validado verificando que fue firmado por una CA intermedia legítima, cuya raíz sea reconocida por tu dispositivo.

**Diferencias entre un CA vs EE**


| Característica         | Autoridad de Certificación (CA)                         | Certificado de Entidad Final (EE / Leaf)                        |
| :--------------------- | :------------------------------------------------------ | :-------------------------------------------------------------- |
| **Rol principal**      | Emitir, firmar y revocar otros certificados.            | Identificar a un usuario, servidor o dispositivo (ej. DNIe).    |
| **Basic Constraints**  | `CA:TRUE` (Obligatorio)                                 | `CA:FALSE` o ausente                                            |
| **Capacidad de firma** | Sí, puede firmar a CAs intermedias o entidades finales. | No. Es el final de la cadena de confianza.                      |
| **Ejemplo práctico**   | FNMT (Raíz o Intermedia), Let's Encrypt.                | Tu certificado digital del DNIe, un certificado TLS de una web. |

-  **El tronco y la raíz**

	_Root CA_ (Autoridad de Certificación Raíz). Es la base de todo. El certificado raíz está en la cúspide (o en la base, según se mire el árbol) y es **autofirmado** (él mismo firma su propia clave pública).
	
	-  **Su papel:** Es la máxima autoridad en la que confían los sistemas operativos y navegadores.
	-  **Buenas prácticas:** Las organizaciones mantienen este certificado guardado bajo llave en servidores hiper-seguros y desconectados de internet (en frío) para evitar que sea comprometido. Si la raíz cae, cae todo el árbol.
-  **Las ramas**

	_Intermediate CAs_ (CAs Intermedias o Sub-CAs). Como la Raíz no debe usarse para emitir certificados del día a día por seguridad, esta "delegate" su poder creando **CAs Intermedias**.
	
	-  **Su papel:** Actúan como las ramas principales del árbol. Reciben el poder de la Raíz y pueden emitir otras ramas más pequeñas o directamente las hojas (certificados finales).
	-  **Por qué se usan (Compartimentación):** Permiten aislar riesgos. Por ejemplo, una gran empresa puede tener una CA intermedia exclusiva para cifrar webs (HTTPS), otra para emitir certificados de empleados (VPN/Autenticación) y otra para firmar código de software. Si una rama se ve comprometida, solo se revoca esa rama sin destruir todo el árbol.
-  **Las Hojas**

	_End-Entity (EE) Certificates_ (Certificados de Entidad Final). Son los frutos u **hojas** del árbol. Aquí es donde termina el camino: estos certificados **ya no pueden firmar a nadie más** (`CA:FALSE`).
	
	Dependiendo de para qué se utilicen, existen varios tipos de "hojas" finales:
	
	-  **Hojas de servidor (TLS/SSL):** Las que protegen los sitios web (`https://...`). Garantizan que te estás comunicando con el servidor real y cifran la conexión.
	-  **Hojas de usuario / cliente:** Los certificados personales de los que hablábamos (como tu DNI electrónico o los certificados de la FNMT) para identificarte en la administración o acceder a una red corporativa segura.
	-  **Hojas de firma de código (_Code Signing_):** Las que usan los desarrolladores para firmar aplicaciones y sistemas operativos (como Windows o macOS), garantizando que el software no ha sido alterado por un troyano.
	-  **Hojas de correo seguro (S/MIME):** Certificados instalados en tu cliente de correo (como Outlook o Thunderbird) para cifrar y firmar digitalmente los emails.
	-  **Hojas de dispositivo (IoT):** Certificados incrustados en routers, cámaras de seguridad, coches conectados o dispositivos médicos para que puedan comunicarse de forma segura entre ellos.

###### Procesos

-  **Generación de certificados x.509**

	-  **Paso 1**: Generar: **`openssl genpkey -algorithm ED25519 | openssl pkcs8 -topk8 -v2 aes256 -out name.pem`**
	-  **Paso 2**: Crear x.509: **`openssl req -new -x509 -key name.pem -out name_target.crt -days 365 -subj "/CN=name_target"`**
	-  **Paso 3**: Verificar la calidad del certificado: **`openssl x509 -in name_target.crt -text -noout`**
###### **Descripción técnica de las extensiones y campos clave de los certificados X.509**

-  **Subject Alternative Names (SAN):** Es el campo más importante hoy en día. Ignora el `Common Name` (CN) tradicional; los navegadores modernos y servicios cloud validan la identidad basándose exclusivamente en el SAN (DNS names, IP addresses).
-  **Certificate Chains:** La capacidad de que un certificado firme a otro. Es la base de tu "propia CA" que construiste. Estudiar esto te enseñará cómo delegar confianza.
-  **Basic Constraints:** El campo que defines con `CA:TRUE`. Si este campo no existe o es falso, el certificado **no puede** firmar a otros. Es la llave maestra de la jerarquía.
-  **Key Usage y Extended Key Usage (EKU):** Define para qué sirve el certificado. ¿Es para autenticación de cliente? ¿Para firma de código? ¿Para cifrado de servidor? Un certificado mal configurado aquí puede ser rechazado por el servidor, aunque sea "válido".
###### **El modelo de identidad soberana (PKI Framework)**

Este marco explica cómo tus archivos dejan de ser simples datos para convertirse en un sistema de **"Confianza Delegada"**. En este sistema, tú no dependes de una entidad externa (como Verisign o Google) para validar quién eres; tú eres el emisor, el validador y el custodio de tu propia identidad.

**Desglose anatómico del sistema**

Para entender cómo funciona este marco, imagina que cada archivo tiene una función específica en la arquitectura de seguridad:

| **Componente**              | **Función en el sistema**    | **Equivalencia**                        |
| --------------------------- | ---------------------------- | --------------------------------------- |
| **Clave privada (Ed25519)** | **El motor (Criptografía)**  | Tu huella digital única (irreplicable). |
| **Certificado (.crt)**      | **La identidad (Atributos)** | Tu pasaporte (quién eres).              |
| **CA raíz (Auto-firmado)**  | **La autoridad (Confianza)** | El estado que emite el pasaporte.       |

-  **La mecánica de la "confianza"**

	El concepto fundamental es la **Cadena de Confianza**.
	
	Para que cualquier sistema (un servidor, una VPN, un script) acepte tu identidad, debe ocurrir un proceso de validación:
	
	1. **La instalación (Trust Anchor):** Cuando instalas tu `name_target.crt` en un servidor (en su "Trust Store"), le estás diciendo a ese servidor: _"Cualquier cosa que traiga el sello de este certificado, considéralo absoluto"_.
	2. **El desafío (Authentication):** Cuando intentas acceder a ese servidor, el servidor te desafía a firmar un mensaje con tu **Clave Privada**.
	3. **La verificación:** El servidor usa la parte pública (el certificado) para comprobar que la firma matemática coincide con tu llave. Si coincide, la puerta se abre.
    
	**Esto es la esencia del mTLS (Mutual TLS):** No hay contraseñas que robar, solo pruebas matemáticas de posesión.
-  **Pilares del ciclo de vida**

	Como arquitecto, la seguridad no es un estado estático, sino un flujo de mantenimiento. Tu sistema requiere tres pilares de salud para ser sostenible:
	
	- **Custodia (El bunker):** Tu clave privada es el punto único de fallo. Si se compromete, todo tu sistema de confianza se derrumba. Moverla fuera de la carpeta `.ssh` (un lugar común de escaneo) a un almacén de claves (KeyStore) o cifrarla en reposo es el paso obligatorio hacia la madurez profesional.
	- **Segmentación (El principio de menor privilegio):** La gran ventaja de ser tu propia CA es la **modularidad**. No uses el mismo certificado para todo. Si un proyecto de pruebas es hackeado, no quieres que ese certificado tenga acceso a tu VPN de producción. Crea "sub-certificados" para cada entorno.
	- **Vigilancia temporal (Ciclo de vida):** La expiración no es un error, es un **mecanismo de defensa**. Al forzar una renovación (en 2027), te obligas a ti mismo a auditar si esos accesos siguen siendo necesarios.
-  **Implementación**

	Ahora que tienes los archivos generados y protegidos, el siguiente paso es **configurar el servicio** que utilizará estos certificados. Esto depende totalmente de qué quieres proteger.
	
	Como mencionaste que le pones un "candado a tu casa" (metafóricamente tu servidor o red), los pasos siguientes varían según el software que estés usando:
	
	-  **Si es un servidor web (Nginx o Apache):** Debes editar el archivo de configuración (`sites-available` o `httpd.conf`) y apuntar a las rutas de los archivos que creaste.
	-  **Si es para SSH o un túnel:** Debes configurar el archivo `sshd_config` para usar el certificado.
	-  **Si es para una aplicación específica:** Casi todas requieren que copies el archivo `.crt` en una carpeta de certificados de confianza y la clave `.pem` en una carpeta privada.
-  **Plan maestro de conectividad**

	Referencia de identidad, cifrado y túneles.
	
	-  **¿Opera a nivel de red o de aplicación?** Si es IPsec, va a red; si es OIDC, va a aplicación.
	-  **¿Resuelve autenticación o autorización?** **OAuth2** es para autorización (delegación de acceso), mientras que **OIDC** es la capa de autenticación encima de él.
	-  **¿Cuál es la "Trust Root"?** ¿Confías en una contraseña, en un certificado X.509 de una CA, o en una llave privada local?.




















































































