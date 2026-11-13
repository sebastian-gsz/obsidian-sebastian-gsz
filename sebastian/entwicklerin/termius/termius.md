---
status: completed
---
- **[[kanban-entwicklerin|Kanban Termius]]**
- **[Documentación Termius ](https://docs.termius.com/)**

![[barra.gif]]

-  **Aprende sobre las bóvedas**
 
	A diferencia de los clientes SSH tradicionales que tratan cada conexión como una cadena de sesión separada, Termius proporciona un modelo estructurado para gestionar el acceso a la infraestructura.
	
	Termius organiza el acceso a la infraestructura en torno a tres conceptos fundamentales: Bóvedas, Grupos y Anfitriones.
	
		Vaults
		└── Groups
			└── Hosts 
				├── SSH (port 22, key: prod-key)  
				├── SFTP  
				└── Telnet (port 23)
	
	En lugar de pensar en términos de cadenas de conexión en bruto, Termius te permite pensar en términos de máquinas y entornos.
	
	Las bóvedas en Termius son el **almacenamiento cifrado en la nube de extremo a** extremo para Hosts, Claves, Fragmentos, reglas de Reenvío de Puertos y Hosts Conocidos. Las bóvedas permiten **sincronizar** entre dispositivos y **compartir de forma segura** entre tu equipo.
	
	- Tu **bóveda personal** es para objetos que no están pensados para ser vistos por el equipo, como credenciales o servidores de prueba y en proceso de trabajo.
	- El **refugio del equipo** se crea automáticamente una vez que invitas a tu primer compañero. Esta bóveda se comparte con todos los miembros del equipo, permitiendo que tu equipo gestione la infraestructura juntos.
	- **Las bóvedas personalizadas de equipo** son bóvedas adicionales cuando tu empresa requiere **permisos detallados** y acceso controlado a la información entre los miembros del equipo. Úsalos para separar los datos por equipo, proyecto o entorno, y definir quién puede acceder a cada bóveda.
-  **Claves y certificados SSH**

	-  **New Keys**
	  
		Esta interfaz que visualizas es un **gestor de credenciales asimétricas (PKI - Public Key Infrastructure)**. Lo que tienes frente a ti es la estructura técnica necesaria para gestionar identidades digitales basadas en criptografía de clave pública.
		
		Como arquitecto IAM, esto es el "pan de cada día" para autenticación, firma digital y cifrado. Vamos a desglosar los campos y profundizar en el **Certificado**, que es la pieza clave de la confianza (Trust).
		
		**Desglose técnico de los campos**
		
		-  **Label (Etiqueta):** Metadatos de gestión. Es el nombre humano que le das a la credencial para identificarla en tu inventario.
		-  **Private Key (KPri):** Tu secreto. Es la llave que descifra o firma. **Regla de oro:** Nunca, bajo ninguna circunstancia, se debe compartir. Si esta llave se filtra, toda la identidad que representa queda comprometida.
		-  **Public Key (KPub):** La parte "pública". Es la que compartes con el resto del mundo (servidores, otros usuarios, servicios). Cualquiera puede tenerla para cifrar mensajes destinados a ti o para verificar que tú firmaste algo.
		-  **Certificado:** Aquí es donde reside la "validez" de la identidad.
		    
		**Profundizando en el Certificado (X.509)**
		
		Un certificado digital no es solo una clave pública; es un **pasaporte digital**. Si solo tuvieras una `Public Key`, tendrías el poder de cifrar y verificar, pero no tendrías forma de probarle a un tercero que esa clave es realmente _tuya_ y no de un impostor.
		
		-  **¿Qué es el certificado?**
		
			Técnicamente, es un archivo estructurado bajo el estándar **X.509** que vincula tu **Clave Pública** con tu **Identidad**.
			
			El certificado contiene:
			
			1. **Datos de Identidad:** Nombre del propietario, organización, correo, etc.
			2. **Clave Pública:** La tuya (la que corresponde a la `Private Key` que tienes guardada).
			3. **Firma Digital:** Aquí está la magia. Una **Autoridad de Certificación (CA)** —una entidad en la que todos confían, como Digicert, Let's Encrypt o tu propia CA interna— toma tu clave pública y tus datos de identidad, los firma con su propia `Private Key` de CA.
		-  **¿Por qué importa esto en IAM?**
		
			El certificado resuelve el problema de la **"Cadena de Confianza"**. Cuando un servidor recibe tu `Public Key` dentro de un certificado, hace lo siguiente:
			
			1. Revisa quién firmó el certificado (la CA).
			2. Si el servidor confía en esa CA, entonces confía automáticamente en que tu clave pública realmente te pertenece.
		-  **¿Cuándo usar certificado vs. usar solo claves?**
		
			-  **SSH (Claves simples):** En SSH tradicional, normalmente no usas un certificado. Simplemente subes tu `Public Key` a `authorized_keys`. El servidor confía en ella porque tú la pusiste ahí manualmente. Es una confianza "punto a punto".
			-  **TLS/HTTPS o SSH Certs (Certificados):** Usas certificados cuando necesitas escalar la confianza. Por ejemplo, en una arquitectura de microservicios o VPNs corporativas, no puedes ir servidor por servidor subiendo claves. Instalas el certificado de tu CA en todos los servidores, y así, automáticamente, confiarán en cualquier usuario o máquina que presente un certificado válido emitido por esa CA.
		
		**Resumen para tu arquitectura**
		
		-  Si estás gestionando un **entorno personal o servidores SSH**, probablemente solo necesites la `Private Key` y la `Public Key`.
		-  Si estás construyendo una **arquitectura IAM empresarial**, el campo de `Certificate` es obligatorio. Es lo que te permite implementar protocolos como **Mutual TLS (mTLS)**, donde tanto el cliente como el servidor se autentican mutuamente mediante certificados, eliminando por completo la necesidad de contraseñas.











