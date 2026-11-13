
-  **[Tareas ](kanban-systemtechnik)**
-  **Enlaces**

	-  **Internos**

		- **[[netzwerkprotokolle]]**
		- **[[trash-hardware-local]]**
		- **[trash-baseline-windows](vision.md)**
		- **[[command-line-interface]]**
	-  **Externos**
-  **[Procesos](process-systemtechnik.md)**

![[barra.gif]]

-  **Linux**

	-  **General**
	  
		-  **Shells, Grupos y Privilegios en Linux**
		
			El tipo de shell asignado a una identidad determina si el sistema operativo le permite o no interactuar mediante una línea de comandos interactiva:
			
			-  **Shells de sistema (`/usr/sbin/nologin`, `/bin/false`):** Se asignan a servicios y demonios (como `sshd`, `www-data`, `chrony`). Si un atacante logra explotar una vulnerabilidad (RCE) en un servicio web, **no podrá abrir una terminal interactiva** para moverse libremente por el sistema.
			-  **Shells orgánicas (`/bin/bash`, `/bin/zsh`):** Permiten la ejecución de comandos completos. En un escenario de pentesting, si una cuenta de usuario con `/bin/bash` es comprometida (por ejemplo, mediante fuerza bruta SSH), el atacante obtiene acceso directo a la consola para intentar escalar privilegios.
		    
			-  **Análisis de usuarios orgánicos y su nivel de acción**
			
				Los UIDs superiores a 1000 identifican a usuarios humanos (`uhm`, `unternehmer`). Sin embargo, su capacidad real de acción no viene dada solo por su número de identificación, sino por los **grupos** a los que pertenecen y las herramientas de elevación de privilegios autorizadas.
				
				A diferencia de **AWS IAM** (que utiliza políticas JSON granulares basadas en APIs y recursos específicos), el sistema tradicional de Linux combina:
				
				-  **Modelo POSIX:** Control de acceso compartido a archivos mediante permisos de grupo y propietario.
				-  **Membresía múltiple:** Un usuario acumula los permisos de todos los grupos a los que pertenece simultáneamente.
			-  **Elevación de privilegios: `su` vs. `sudo`**
			
				Para pasar de un usuario estándar a un entorno administrativo, Linux ofrece dos mecanismos principales con filosofías de seguridad muy distintas:
				
				  **A. `su` (Switch User)**
				
				-  **Activa todos los permisos administrativos:** Te conviertes plenamente en otro usuario (generalmente `root`), otorgándote control total y sin restricciones sobre el sistema.
				-  **Se usa para tareas globales:** Es común cuando se requiere realizar múltiples tareas de configuración profunda de manera continua.
				-  **Solicita la contraseña raíz:** Requiere introducir la clave del usuario `root` para autenticar la identidad.
				    
				**B. `sudo` (Super User Do)**
				
				- **Activa únicamente los permisos delegados:** No otorga un acceso total e indiscriminado por defecto, sino que limita la acción al comando o tarea exacta permitida en las políticas.
				- **Ideal para delegar tareas:** Permite que ingenieros o sysadmins ejecuten comandos administrativos precisos sin poseer la clave maestra de root.
				- **Solicita la contraseña del propio usuario:** En lugar de la clave de root, pide la credencial del usuario que ejecuta el comando, añadiendo una capa extra de trazabilidad.
			-  **¿Cómo se logra la verdadera granularidad?**
			
				El modelo clásico de Linux (un dueño, un grupo) suele quedarse corto cuando se necesitan reglas muy finas. Para solucionarlo, Linux cuenta con mecanismos avanzados:
				
				- **A. Listas de control de acceso (POSIX ACLs):**
				
				    Permiten añadir excepciones directas a un archivo o carpeta sin depender de un único grupo.
				    
				    **_Ejemplo:_** Hacer que un archivo en `/var/www/` sea propiedad de `root:root`, pero mediante una ACL (`setfacl`), otorgar permisos de lectura única al usuario `unternehmer`.
				- **B. Reglas de sudo (`/etc/sudoers`):**
				
				    Para el grupo `sudo`, la granularidad se define mediante reglas estrictas. No todos los `sudo` son iguales; puedes configurar que un usuario o grupo solo pueda ejecutar un comando específico como root y nada más (por ejemplo, permitir que un usuario ejecute únicamente `/usr/bin/systemctl restart nginx` sin darle acceso a la consola completa).
				- **C. Kernel capabilities (Capacidades del Kernel):**
				
				    Dividen los superpoderes de root en capacidades atómicas independientes del UID 0 (ej. permitir que un proceso escuche puertos de red bajos sin ser root o manipular relojes del sistema), asignándolas directamente a binarios o usuarios.
				- **D. Control de acceso mandatorio (MAC - SELinux / AppArmor):**
				
				    Actúan como un guardia de seguridad estricto que limita lo que cada programa puede hacer basándose en políticas de contexto (ej. un servidor web comprometido no podrá leer archivos de `/etc/shadow` aunque el proceso tenga permisos de sistema).
		    
			**💡 Consideraciones finales sobre seguridad y administración**
			
			-  **Seguridad y trazabilidad:** `sudo` se considera considerablemente más seguro que `su`. Gracias al archivo de configuración (`/sudoers`) y a los registros de auditoría del sistema, es posible saber exactamente **quién** ejecutó **qué comando** y **cuándo**.
			-  **Administración granular:** Combinar una correcta asignación de shells, control de grupos, políticas de `sudo` y herramientas MAC permite una gestión milimétrica de la seguridad en entornos multiusuario, sentando las bases idóneas para su automatización posterior con Ansible.
		-  **[[cybersicherheit/cybersicherheit#^uhm9|Directorios y rutas susceptibles a ataques en Linux]]**
		
			-  **`~`**
			  
				-  **`~/.ssh/`**
				  
					Las claves privadas y publicas de SSH se almacenan en `root` para acceder al directorio: `sudo su | cd ~/.ssh/` ^ReferenciaSSH
			-  **``/etc/``**
			  
				  El directorio `/etc` en Linux es el lugar donde se guardan la mayoría de los archivos de configuración del sistema. Es como el "panel de control" de tu sistema operativo.
				
				-  **``/etc/.pwd.lock``**
				
					El dato más importante a tener en cuenta es que **ningún usuario sin privilegios (`unternehmer` u otros usuarios estándar) puede modificar, eliminar o cambiar los permisos de `/etc/.pwd.lock`**.
					
					-  Al tener permisos `-rw-------` y pertenecer a `root:root`, un atacante externo o un usuario con permisos limitados que logre entrar al sistema **no puede** realizar un ataque de denegación de servicio (DoS) sobre este archivo a menos que **ya haya escalado privilegios a root** previamente o exista una vulnerabilidad de tipo LPE (Local Privilege Escalation) en el kernel o en un binario SUID.
					-  Por lo tanto, si el archivo `.pwd.lock` es manipulado maliciosamente, significa que el servidor ya ha sufrido una brecha de seguridad crítica en el nivel más alto de privilegios.
					
					1. **El mecanismo interno de bloqueo (`shadow-utils`)**
					
						A nivel de código fuente en las herramientas de administración de usuarios (como `passwd` o `useradd`), el sistema utiliza llamadas al sistema para gestionar este bloqueo exclusivo:
						
						-  El archivo actúa como un semáforo lógico. Cuando un proceso administrativo arranca, intenta abrir o crear el archivo y aplicar un bloqueo de archivo mediante llamadas como `fcntl()` o `lockf()`.
						-  Si el bloqueo falla porque otro proceso lo tiene ocupado, la herramienta genera un error estándar (por ejemplo, indicando que el archivo de bloqueo está activo) para evitar condiciones de carrera (_race conditions_) que corromperían las bases de datos de autenticación.
					
					### Verificación y Auditoría del Estado Actual
					
					Puedes comprobar rápidamente el estado del archivo de bloqueo y asegurarte de que no hay procesos anómalos interactuando con él mediante los siguientes pasos técnicos:
					
					**1.Verificar permisos y atributos exactos:**Comprobación estática.
					
					Ejecuta el siguiente comando para revisar los metadatos precisos del archivo: **`stat /etc/.pwd.lock`**. El tamaño debe ser `0` bytes (salvo que un proceso de cambio de contraseña esté corriendo justo en ese milisegundo), los permisos deben ser `0600` y el propietario `root:root`.
					
					**2.Inspeccionar procesos activos asociados al bloqueo:**Comprobación dinámica.
					
					Comprueba si hay algún proceso utilizando actualmente el archivo de bloqueo: **`sudo lsof /etc/.pwd.lock`**. Si el comando no devuelve ninguna salida, significa que el archivo está libre y ningún proceso lo está utilizando en este momento (lo cual es lo normal en un servidor en reposo).
				-  **`/etc/sysctl.d/`**
				
					-  En sistemas modernos con **systemd**, la configuración del kernel vía sysctl **se delega a múltiples archivos dentro de `/etc/sysctl.d/`**, `/usr/lib/sysctl.d/` y `/run/sysctl.d/`.
					  
						- **``/ run/sysctl.d/ (configuraciones temporales, volátiles, aplicadas en tiempo de ejecución)``**  
						- **``/usr/lib/sysctl.d/ (configuración de paquetes por defecto, no tocar directamente)``**  
						- **``/etc/sysctl.d/ (configuración local del administrador, personalizada)``**
					-  El archivo `/etc/sysctl.conf` era la configuración tradicional monolítica, pero hoy en día se recomienda organizar los parámetros en varios archivos para modularidad y facilidad de gestión.
					 
					**¿Dónde se definen entonces los parámetros sysctl?**
					
					- En tu caso, `/etc/sysctl.d/` contiene archivos de configuración separados.
					- Por ejemplo, ahí tienes un `README.sysctl` que explica que los archivos `.conf` dentro de esa carpeta **son aplicados automáticamente al iniciar**.
					- Puedes crear nuevos archivos `.conf` en `/etc/sysctl.d/` para añadir o modificar parámetros del kernel. Por ejemplo: **`/etc/sysctl.d/99-custom.conf`**
					  
					**¿Dónde poner tus ajustes?**
					
					-  Para personalizaciones permanentes, **coloca archivos `.conf` en `/etc/sysctl.d/`**.
					-  Puedes crear un archivo con nombre descriptivo y prefijo para prioridad, por ejemplo:
					
					    - **`/etc/sysctl.d/99-custom.conf`**
					    - **`/etc/sysctl.d/10-network-tuning.conf`**
					-  **Contenido de los archivos `.conf`:** 
					
							net.ipv4.ip_forward = 1
							vm.swappiness = 10
							kernel.pid_max = 65536
						
						-  **`net.ipv4.ip_forward = 1`**
					    
						    - Activa el **reenvío de paquetes IPv4** en el kernel.
						    - Esencial para que el sistema actúe como un **router** o un dispositivo que enruta tráfico entre interfaces de red.
						    - Si está en 0 (por defecto), el sistema no reenvía paquetes y solo atiende tráfico local.
						-  **`vm.swappiness = 10`**
						
						    - Controla la tendencia del kernel a usar la **memoria swap** (disco) en lugar de RAM.
						    - Valor bajo (como 10) significa que el sistema intentará mantener procesos en RAM y solo usará swap cuando sea realmente necesario.
						    - Valores altos (por ejemplo, 60 o 80) hacen que el kernel use swap más agresivamente, liberando RAM para caché y otros usos.
						    - Ajustar esto puede mejorar el rendimiento en servidores que requieren baja latencia.
						-  **`kernel.pid_max = 65536`**
						
						    - Define el **máximo número de procesos (PID)** que puede asignar el kernel.
						    - Valor por defecto suele ser 32768 o similar.
						    - Incrementarlo a 65536 permite manejar más procesos concurrentes.
						    - Útil en servidores con alta carga y muchas aplicaciones/hilos simultáneos.
						
						**Ejemplo de parámetros comunes en `sysctl.conf`:**
						
						-  **Red (Networking):**
						
						    - **`net.ipv4.ip_forward`**: Define si el sistema actúa como un **enrutador** para el tráfico IP (1 = habilitado, 0 = deshabilitado).
						    - **`net.ipv4.conf.all.rp_filter`**: Habilita el filtrado de rutas inversas, una medida de seguridad.
						    - **`net.ipv4.tcp_fin_timeout`**: Ajusta el tiempo de espera para conexiones **TCP FIN**.
						-  **Memoria y rendimiento:**
						
						    - **`vm.swappiness`**: Controla cuándo el kernel usará **swap** (memoria secundaria) en lugar de memoria RAM.
						    - **`vm.overcommit_memory`**: Controla la política de **asignación de memoria**.
						    - **`vm.dirty_background_ratio`**: Controla el porcentaje de memoria sucia (es decir, datos que están esperando ser escritos al disco).
						-  **Seguridad:**
						
						    - **`kernel.randomize_va_space`**: Configura el nivel de aleatorización de direcciones de espacio de usuario (ASLR) para prevenir ataques de desbordamiento de búfer.
						    - **`fs.protected_hardlinks`**: Protección contra enlaces duros en sistemas de archivos montados.
						-  **Sistema:**
						
						    - **`kernel.pid_max`**: Configura el valor máximo para los **números de PID** en el sistema.
						    - **`kernel.msgmni`**: Configura el número máximo de **colas de mensajes** del sistema.
						-  **File System:**
						
						    - **`fs.file-max`**: Establece el número máximo de archivos que el sistema puede manejar a la vez.
						    - **`fs.inotify.max_user_watches`**: Controla el número máximo de **monitores inotify**.
				-  **``/etc/apt/``**
				  
					-  **``/etc/apt/trusted.gpg.d/``**
					
						Este directorio (y el archivo obsoleto `/etc/apt/trusted.gpg`) es donde APT busca **directamente** las claves GPG para verificar las firmas de los paquetes y los metadatos de los repositorios.
						
						Si una clave está en `/etc/apt/trusted.gpg.d/` (o en un enlace que apunte a ella **``kali-archive-keyring.gpg -> /usr/share/keyrings/kali-archive-keyring.gpg``**), APT **confía automáticamente** en los paquetes y repositorios firmados con esa clave.
					-  **``/etc/apt/sources.list``**
					  
						- Este es el archivo principal y tradicional donde se listan los repositorios.
						  
						**Ejemplo**:
						
						`# See: https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/ deb http://http.kali.org/kali kali-last-snapshot main contrib non-free non-free-firmware ` 
						`# Additional line for source packages #deb-src http://http.kali.org/kali kali-last-snapshot main contrib non-free non-free-firmware`
						
						-  **`deb http://http.kali.org/kali kali-last-snapshot main contrib non-free non-free-firmware`**
					    
						    - Esta es la línea más importante, ya que define el **repositorio principal de Kali Linux** del que tu sistema descarga las actualizaciones y los paquetes.
						    - **`deb`**: Indica que este repositorio contiene **paquetes binarios** (programas ya compilados, listos para instalar).
						    - **`http://http.kali.org/kali`**: Es la **URL base** del repositorio de Kali Linux.
						    - **`kali-last-snapshot`**: Define la **distribución o rama** específica del repositorio que estás usando. En Kali Linux, `kali-rolling` o `kali-last-snapshot` son comunes para tener las últimas actualizaciones.
						    - **`main contrib non-free non-free-firmware`**: Son las **secciones o componentes** del repositorio. Indican qué tipo de software se incluye:
					        - **`main`**: Software que cumple con las directrices de software libre de Debian.
					        - **`contrib`**: Software libre que depende de software no libre.
					        - **`non-free`**: Software que no es libre (por ejemplo, tiene licencias restrictivas), pero que es útil o necesario.
					        - **`non-free-firmware`**: Firmware (microcódigo para hardware) que no es libre, pero necesario para el funcionamiento de algunos componentes de hardware.
						-  **`# Additional line for source packages`** y **`#deb-src http://http.kali.org/kali kali-last-snapshot main contrib non-free non-free-firmware`**
						
						    - Estas líneas también son **comentarios** (debido a la `#` inicial).
						    - La línea `deb-src` (si estuviera descomentada, es decir, sin la `#`) le diría a APT que también descargue los **paquetes de código fuente** de esos programas. Esto es útil para desarrolladores o para aquellos que quieren compilar software desde el código fuente con parches o modificaciones.
						    - En tu caso, al estar comentada, tu sistema solo descarga los paquetes binarios.
					-  **``/etc/apt/sources.list.d/``**
					
						Este es un **directorio** donde se pueden colocar archivos `.list` adicionales. Cada archivo en este directorio puede contener una o más líneas de repositorio. Es una forma modular de añadir repositorios, especialmente útil cuando instalas software de terceros que añade sus propias fuentes (como Elastic o Docker, por ejemplo).
					-  **``/etc/apt/keyrings``**
					
						Es el **directorio estándar moderno** recomendado en sistemas basados en Debian/Ubuntu para almacenar las claves GPG de repositorios externos de forma segura y aislada (reemplazando al antiguo método de guardarlas en `/etc/apt/trusted.gpg.d/`).
				-  **``/etc/passwd``**
				 
					El archivo `/etc/passwd` es un archivo fundamental en sistemas Unix y Unix-like, incluyendo Linux. **El archivo `/etc/passwd` contiene información básica de usuarios en el sistema. Históricamente, cada línea en este archivo representaba a un usuario y contenía varias informaciones clave separadas por dos puntos (`:`).** 
					
					Aunque en sistemas modernos esta función se ha dividido en otros archivos como `/etc/shadow` para contraseñas seguras y `/etc/group` para grupos de usuarios, el término "contraseñas" aún se utiliza por tradición para referirse a este tipo de archivos.
					
					**Estructura y contenido**
					
					Cada línea del archivo `/etc/passwd` está formada por siete campos separados por dos puntos (`:`):
					
					1. **``Nombre de usuario``**: Es el nombre de usuario utilizado para iniciar sesión en el sistema.
					2. **``Contraseña``**: En sistemas modernos, este campo generalmente contiene una `x` para indicar que la contraseña está almacenada en el archivo `/etc/shadow`.
					3. **``ID de usuario`` (UID)**: Es un número único que identifica de manera única al usuario en el sistema.
					4. **``ID de grupo`` (GID)**: Es el identificador de grupo principal del usuario.
					5. **``Descripción del usuario``**: Información adicional sobre el usuario (a veces se deja en blanco).
					6. **``Directorio de inicio``**: Es el directorio inicial o home directory del usuario.
					7. **``Shell de inicio``**: Es el programa de inicio de sesión del usuario, por ejemplo `/bin/bash` o `/bin/sh`.
					
					**Acceso y modificación**
					
					El archivo `/etc/passwd` generalmente solo es accesible para el superusuario (root) y algunos procesos específicos. Se puede modificar manualmente, pero generalmente se realiza a través de herramientas administrativas como `useradd`, `usermod` y `userdel` en sistemas Linux.
					
					**Uso en sistemas modernos**
					
					En sistemas modernos, el archivo `/etc/passwd` ha evolucionado para incluir referencias a otros sistemas de autenticación y configuraciones, y gran parte de la gestión de usuarios se realiza a través de sistemas más seguros y complejos, como PAM (Pluggable Authentication Modules) y LDAP (Lightweight Directory Access Protocol).l
				-  **``/etc/shadow``**
				
					El archivo `/etc/shadow` se utiliza para almacenar las contraseñas encriptadas de los usuarios del sistema operativo. Históricamente, este archivo reemplazó al campo de contraseñas que solía estar en el archivo `/etc/passwd`. La razón principal de esta separación fue mejorar la seguridad, ya que el archivo `/etc/passwd` era accesible por todos los usuarios del sistema, mientras que `/etc/shadow` solo es accesible por el superusuario (root).
					
					**Estructura y contenido**
					
					Cada línea del archivo `/etc/shadow` contiene información detallada de cada usuario, dividida en varios campos separados por dos puntos (`:`):
					
					1. **``Nombre de usuario``**: Es el nombre de usuario para el cual se guarda la información de la contraseña.
					2. **``Contraseña encriptada``**: Es la contraseña encriptada del usuario. Esta cadena encriptada está generada por algoritmos como MD5, SHA-256, o bcrypt, entre otros.
					3. **``Última fecha de cambio de contraseña``**: Es el número de días desde el 1 de enero de 1970 (epoch) cuando se cambió la contraseña por última vez.
					4. **``Días mínimos entre cambios de contraseña``**: Es el número mínimo de días que deben pasar antes de que el usuario pueda cambiar su contraseña.
					5. **``Días máximos entre cambios de contraseña``**: Es el número máximo de días que puede pasar antes de que el usuario deba cambiar su contraseña.
					6. **``Días de advertencia antes del vencimiento de la contraseña``**: Es el número de días antes de que la contraseña caduque que el usuario comenzará a recibir advertencias.
					7. **``Días de inactividad de la cuenta``**: Es el número de días después de que la contraseña ha caducado antes de que la cuenta se desactive.
					8. **``Fecha de desactivación de la cuenta``**: Es la fecha cuando la cuenta se desactivará, representada como el número de días desde el 1 de enero de 1970 (epoch).
					9. **``Campo reservado``**: Este campo es reservado para uso futuro y generalmente se deja en blanco.
					
					**Acceso y modificación**
					
					El archivo `/etc/shadow` solo puede ser leído y modificado por el superusuario (root). Esto asegura que las contraseñas estén protegidas contra el acceso no autorizado por parte de usuarios regulares. Las herramientas como `passwd`, `chage` y `usermod` son utilizadas para gestionar y modificar la información contenida en `/etc/shadow`.
				-  **``/etc/group``**
				
					El archivo `/etc/group` es un archivo de configuración en sistemas Unix y Unix-like, como Linux, que almacena información detallada sobre los grupos de usuarios del sistema.
					
					**Estructura del archivo**:
					
					-  El archivo `/etc/group` generalmente tiene un formato de línea por grupo, donde cada línea está estructurada con campos separados por dos puntos (`:`). Los campos típicos en cada línea son: `group_name:password:GID:user_list`
					
						- `group_name`: Nombre del grupo, que es único dentro del sistema.
						- `password`: Campo que tradicionalmente contenía la contraseña cifrada del grupo, pero en muchos sistemas modernos se deja en blanco o contiene un carácter especial para indicar que la contraseña está almacenada en otro lugar o no se utiliza.
						- `GID`: Identificador numérico de grupo (Group ID), un número único que identifica de manera única al grupo dentro del sistema.
						- `user_list`: Lista de usuarios que pertenecen a ese grupo, separados por comas u otro delimitador según el sistema.  
					
					-  **Acceso y permisos**:
					
						Normalmente, el archivo `/etc/group` tiene permisos de lectura para todos los usuarios del sistema, pero solo el administrador del sistema (`root`) puede modificarlo directamente utilizando herramientas como `vipw` o `groupmod`.
					-  **Propósito y utilidad**:
					
					    - **``Gestión de accesos``**: Permite gestionar y controlar los permisos y accesos de los usuarios a archivos y recursos compartidos en el sistema.
					    - **``Asignación de permisos``**: Los archivos y directorios en sistemas Unix tienen propietarios y grupos asociados. El archivo `/etc/group` define estos grupos y los usuarios que pertenecen a cada uno, facilitando la administración de permisos de acceso a archivos y recursos.
					
					**``Consultar información``**: Para consultar información detallada sobre un grupo específico, se puede utilizar el comando `grep` para buscar en el archivo `/etc/group`, o simplemente visualizar el archivo directamente con un editor de texto: `grep marketing /etc/group`
				-  **``/etc/sudoers``**
				
					El archivo `/etc/sudoers` es crucial en sistemas Unix y Linux, ya que determina qué usuarios y grupos tienen permiso para ejecutar comandos con privilegios elevados utilizando `sudo`.
					
					El archivo `/etc/sudoers` especifica las reglas y permisos para los comandos que pueden ser ejecutados con `sudo`, permitiendo a los usuarios asumir temporalmente privilegios de superusuario (root) en el sistema. Permite a los administradores de sistemas configurar quién puede hacer qué, y bajo qué condiciones, evitando así el uso indiscriminado de privilegios administrativos.
					
					**Estructura del archivo**
					
					El archivo `/etc/sudoers` está estructurado en varias secciones y líneas que definen las reglas de acceso. Aquí hay algunos aspectos clave:
					
					1. **``Usuarios y grupos``**: Especifica qué usuarios y grupos pueden utilizar `sudo`.
					
					    - Ejemplo para un usuario específico: `usuario1 ALL=(ALL) ALL`
					    - Ejemplo para un grupo específico: `%grupo1 ALL=(ALL) ALL`
					2. **``Permisos específicos``**: Define comandos específicos que los usuarios o grupos pueden ejecutar con `sudo`.
					
					    - Ejemplo: `usuario1 ALL=(ALL) /usr/bin/apt-get`
					3. **``Opciones avanzadas``**: Incluye configuraciones avanzadas como la restricción de acceso por host, la especificación de entornos, y la gestión de variables de entorno.
					
					    - Ejemplo de restricción por host: `usuario1 webserver = (root) NOPASSWD: /usr/bin/reboot`
					
					**Acceso y edición**
					
					Editar el archivo `/etc/sudoers` directamente no es recomendable debido a su sensibilidad y a los posibles errores que pueden provocar problemas de acceso al sistema. Para modificarlo de manera segura, se recomienda usar el comando `visudo`, que valida sintácticamente los cambios antes de aplicarlos.
					
					**Seguridad y consideraciones**
					
					- **``Error de sintaxis``**: Un error de sintaxis en `/etc/sudoers` puede dejar el sistema sin acceso a `sudo`, lo cual puede requerir la recuperación del sistema.
					- **``Backups y control de versiones``**: Mantener copias de seguridad del archivo `/etc/sudoers` es crucial para restaurar configuraciones previas en caso de problemas.
					- **``Seguridad de contraseñas``**: A menudo, se configura para requerir la contraseña del usuario antes de ejecutar comandos con `sudo`, pero se puede configurar para omitir la contraseña en ciertos casos, lo cual debe manejarse con precaución.
				-  **``/etc/profile``**
				
					Este archivo se ejecuta automáticamente al inicio de sesión de cualquier usuario en el sistema y configura variables de entorno y configuraciones globales que son válidas para todos los usuarios del sistema.
					
					1. **Propósito principal**:
					
					    El archivo `/etc/profile` se utiliza para establecer configuraciones de entorno que son aplicables de manera global para todos los usuarios del sistema. Esto incluye la configuración de variables de entorno como `PATH`, `PS1` (prompt de shell), y la carga de configuraciones adicionales desde archivos en `/etc/profile.d`.
					2. **Configuración de PATH**:
					
					    Una de las funciones clave del archivo `/etc/profile` es configurar la variable `PATH`, que define las ubicaciones donde el sistema buscará ejecutables de comandos. Dependiendo de la distribución y configuración específica, se pueden establecer diferentes rutas para usuarios normales y para el usuario root.
					3. **Configuración de PS1 (Prompt de Shell)**:
					
					    El archivo `/etc/profile` también puede configurar el prompt de shell (`PS1`). Dependiendo de si el usuario es root o no, puede establecerse un prompt diferente para cada caso.
					4. **Carga de Scripts en /etc/profile.d**:
					
					    En muchas distribuciones, `/etc/profile` incluye un bucle que carga scripts adicionales desde el directorio `/etc/profile.d`. Estos scripts tienen extensiones `.sh` y pueden contener configuraciones específicas de aplicaciones o servicios que necesitan ajustes en las variables de entorno o en otras configuraciones del sistema.
					5. **Compatibilidad con diferentes shells**:
					
					    El archivo `/etc/profile` es compatible con varios shells comunes en sistemas Unix y Linux, como Bourne Shell (sh), Bash (bash), Korn Shell (ksh), y otros compatibles. Esto asegura que las configuraciones definidas en `/etc/profile` se apliquen correctamente independientemente del shell utilizado por el usuario.
					6. **Seguridad y acceso**:
					
					    Dado que `/etc/profile` es un archivo de configuración crítico para el sistema, típicamente está protegido contra modificaciones no autorizadas. Los cambios en este archivo generalmente requieren privilegios de superusuario (`sudo`).
					
					-  **Configuración actual de ``profile``**
					
						-  **Configuración de PATH**:
						
						    - El bloque `IS_WSL=$( grep -i microsoft /proc/version )` verifica si el sistema está ejecutándose en Windows Subsystem for Linux (WSL) buscando la cadena "Microsoft" en el archivo `/proc/version`.
						    - Si no se detecta que el sistema esté en WSL (`"${IS_WSL}" = ""`), se configura la variable `PATH` dependiendo de si el usuario actual es root (`$( id -u ) -eq 0`) o no.
						    - Si el usuario es root, se establece `PATH` con rutas que incluyen directorios de ejecutables del sistema (`/usr/local/sbin`, `/usr/local/bin`, etc.).
						    - Si no es root, se establece `PATH` con rutas más comunes que incluyen directorios de ejecutables de usuario (`/usr/local/bin`, `/usr/bin`, etc.).
						    - Finalmente, la variable `PATH` se exporta para que esté disponible para los procesos hijos del shell.
						-  **Configuración de PS1 (Prompt de Shell)**:
						
						    - La sección verifica si la variable `PS1` está definida, lo que indica que el prompt de shell está activo y configurado.
						    - Si el shell es Bash (`${BASH-}` está definido y no es igual a `"/bin/sh"`), entonces carga la configuración de `PS1` desde `/etc/bash.bashrc`.
						    - Si no es Bash o si la variable `PS1` no está definida, establece un prompt predeterminado basado en si el usuario actual es root (`#` para root y `$` para otros usuarios).
						- **Carga de archivos en /etc/profile.d**:
						
						    - La sección verifica si existe el directorio `/etc/profile.d`.
						    - Itera sobre todos los archivos `.sh` dentro de este directorio (`/etc/profile.d/*.sh`).
						    - Carga cada archivo `.sh` que sea legible (`-r $i`) utilizando el comando `.` (punto), que ejecuta el script en el contexto del shell actual (`source`).
				-  **``/etc/host.conf``**
				
					El archivo `host.conf`, ubicado típicamente en `/etc/host.conf` en sistemas Unix y Linux, es un archivo de configuración fundamental que define la resolución de nombres de host en el sistema operativo. Aquí tienes información relevante sobre este archivo:
					
					1. **Propósito**:
					
					    El archivo `host.conf` configura cómo el sistema operativo debe resolver los nombres de host a direcciones IP y viceversa. Define el orden y la prioridad de los métodos de resolución de nombres que el sistema utilizará.
					2. **Contenido típico**:
					
					    - El contenido del archivo `host.conf` suele consistir en líneas que especifican las directivas `order`, `multi`, y `nospoof`.
					    - **``order``**: Define el orden de resolución de nombres. Puede contener valores como `hosts,bind` o `bind,hosts`. Por ejemplo, `hosts,bind` indica que primero se debe buscar en el archivo `/etc/hosts` y luego en el sistema de resolución de nombres de red (como DNS).
					    - **``multi``**: Controla cómo se manejan múltiples respuestas de resolución de nombres. El valor `on` permite que se utilicen múltiples direcciones IP para un solo nombre de host.
					    - **``nospoof``**: Ayuda a prevenir ataques de suplantación de identidad de DNS (spoofing) especificando si se permiten o no respuestas de DNS no autorizadas.
					3. **Configuración y edición**:
					
					    - Para editar el archivo `host.conf`, generalmente se requieren privilegios de superusuario (`sudo`) debido a su importancia para la resolución de nombres en el sistema.
					    - Las configuraciones en `host.conf` afectan cómo el sistema operativo interactúa con los archivos locales de nombres (`/etc/hosts`) y con los servidores DNS configurados en `/etc/resolv.conf`.
					4. **Importancia en la configuración de redes**:
					
					    - El archivo `host.conf` es crucial para asegurar que las resoluciones de nombres se realicen de manera eficiente y segura en el sistema. Una configuración incorrecta o desactualizada puede llevar a problemas de conectividad en la red.
					5. **Compatibilidad y variaciones**:
					
					    La estructura y las directivas en `host.conf` pueden variar ligeramente entre diferentes distribuciones de Linux. Sin embargo, el propósito básico de controlar la resolución de nombres sigue siendo consistente.
				-  **``/etc/hosts``**
				
					Es un archivo utilizado para mapear manualmente nombres de host (hostnames) a direcciones IP. Actúa como una mini base de datos de resolución de nombres en el sistema. Ejecuta: `cat /etc/hosts`
					
					**Detalles clave:**
					
					- Es consultado **antes** de realizar una consulta DNS para resolver un nombre de dominio.
					- Contiene entradas que especifican la dirección IP y los nombres asociados.
					- Es útil para pruebas, configuración de red local o redirección de dominios específicos.
					
					**Casos de uso comunes:**
					
					- Redirigir nombres de dominio a IP específicas, como servidores locales.
					- Probar aplicaciones web en desarrollo sin modificar DNS.
					- Evitar dependencias de servidores DNS en entornos aislados.
				-  **``/etc/fstab``**
				
					El archivo **`/etc/fstab`** (File System Table) es un archivo de configuración crucial en sistemas Unix y Linux, utilizado para definir cómo y qué sistemas de archivos deben ser montados en el sistema durante el inicio (arranque) o en otros momentos. Este archivo describe los dispositivos de almacenamiento y sus puntos de montaje, así como las opciones de montaje que deben aplicarse.
					
					**Propósito del archivo `/etc/fstab`:**
					
					- **``Automatización del montaje``**: El archivo permite que el sistema monte automáticamente los sistemas de archivos al arrancar el sistema sin intervención manual.
					- **``Gestión de dispositivos de almacenamiento``**: Define cómo deben montarse discos duros, particiones, volúmenes LVM, y otros sistemas de almacenamiento, como unidades de red (por ejemplo, **NFS** o **SMB**).
					- **``Configuración de opciones de montaje``**: Permite especificar detalles como permisos, tipo de sistema de archivos, opciones de seguridad, entre otros.
					
					**Estructura del archivo `/etc/fstab`:**
					
					Cada línea del archivo `/etc/fstab` corresponde a una entrada que describe un sistema de archivos. Las líneas generalmente tienen los siguientes campos:
					
					1. **Dispositivo o UUID**:
					
					    - Especifica el dispositivo o volumen que se va a montar. Esto puede ser una ruta de dispositivo como `/dev/sda1`, o un UUID (Identificador Universal Único) para una partición o volumen, que proporciona una forma más confiable de identificar un dispositivo, especialmente si los dispositivos cambian de nombre en diferentes arranques.
					    - **Ejemplo**: `/dev/sda1`, `UUID=xxxx-xxxx`, `/dev/nvme0n1p1`.
					2. **Punto de montaje**:
					
					    - Especifica el directorio donde se montará el sistema de archivos. Un sistema de archivos no tiene utilidad hasta que se monta en un punto de montaje dentro del sistema de archivos raíz (como `/mnt/data`, `/home`, `/`).
					    - **Ejemplo**: `/`, `/home`, `/mnt/data`.
					3. **Tipo de sistema de archivos**:
					
					    - Define el tipo de sistema de archivos (por ejemplo, **ext4**, **xfs**, **vfat**, **ntfs**).
					    - **Ejemplo**: `ext4`, `xfs`, `ntfs`.
					4. **Opciones de montaje**:
					
					    - Son las opciones que se aplican al montar el sistema de archivos. Estas opciones definen el comportamiento del montaje, como si el sistema de archivos es solo de lectura, si se debe realizar una verificación en el arranque, si se deben ignorar ciertos errores, entre otros.
					    - **Ejemplo**: `defaults`, `ro` (solo lectura), `rw` (lectura y escritura), `noatime` (no actualiza la marca de tiempo de acceso a archivos), `noexec` (no permite ejecutar binarios).
					5. **Orden de comprobación (fs_passno)**:
					
					    - Un número que determina el orden en que los sistemas de archivos deben ser verificados durante el arranque.
					      
					        - **`1`**: El sistema de archivos raíz (`/`) debe ser verificado primero.
					        - **`2`**: Otros sistemas de archivos que no son críticos, como las particiones de datos, deben ser verificados después.
					        - **`0`**: No se debe verificar este sistema de archivos.
					    - **Ejemplo**: `1`, `2`, `0`.
					6. **Orden de montaje (fs_freq)**:
					
					    - Este número también está relacionado con la verificación de los sistemas de archivos durante el arranque, aunque en sistemas modernos es generalmente **`0`** porque la mayoría de los sistemas modernos no verifican los discos al iniciar.
					    - **Ejemplo**: `1` o `2` (usado para la raíz y otros discos).
				-  **``/etc/ssh/``**
				
					-  <strong style ="color: ;">Problemas de conexión SSH</strong>
					
						El error "no matching host key type found" indica que el cliente SSH no puede aceptar ninguno de los tipos de clave de host ofrecidos por el servidor SSH al que estás intentando conectarte (`192.168.1.42`). Este problema puede surgir debido a restricciones de configuración en el cliente SSH o en el servidor SSH.
						
						-  **``Especificar el algoritmo de clave de host``**: Puedes intentar especificar explícitamente el algoritmo de clave de host que el servidor está ofreciendo. Por ejemplo, si el servidor ofrece `ssh-rsa`, puedes intentar conectarte usando este algoritmo:
						
						    `ssh -o HostKeyAlgorithms=ssh-rsa msfadmin@192.168.1.42`
						-  **``Actualizar la configuración del servidor SSH``**: Si tienes acceso al servidor SSH (`192.168.1.42`), considera actualizar la configuración del servidor para que ofrezca tipos de clave de host más modernos y seguros, como `ssh-ed25519` o `ecdsa-sha2-nistp256`. Esto generalmente se hace modificando el archivo de configuración del servidor SSH (`/etc/ssh/sshd_config`) y reiniciando el servicio SSH.
						-  **``Eliminar entradas de known_hosts``**: A veces, problemas persistentes pueden deberse a entradas corruptas en el archivo `known_hosts` del cliente. Intenta eliminar la entrada del host específico que está causando el problema usando `ssh-keygen`, como lo hiciste antes:
						
							`sudo ssh-keygen -f '/root/.ssh/known_hosts' -R '192.168.1.42'`
						
						Luego intenta conectarte nuevamente para que se genere una nueva entrada.
			-  **`/dev/`**
			  
				Es un **directorio especial del sistema de archivos que contiene archivos que representan los dispositivos de hardware conectados al sistema.**
				
				**Estos "archivos de dispositivo" no son archivos comunes como los documentos de texto o los ejecutables.** En realidad, son interfaces que el kernel de Linux utiliza para permitir que los programas de usuario interactúen con el hardware. Cuando un programa "lee" de `/dev/sda` (tu disco duro) o "escribe" en `/dev/lp0` (una impresora), en realidad está pidiendo al kernel que realice una operación de entrada/salida en ese dispositivo de hardware.
				
				**``Analogía``:** Piensa en `/dev/` como el **panel de control de una nave espacial**, donde cada "botón" o "palanca" (cada archivo de dispositivo) representa un componente del hardware. Al interactuar con ese "botón" (escribiendo o leyendo el archivo de dispositivo), estás enviando comandos o recibiendo datos del hardware subyacente. El kernel es el ingeniero que traduce esas interacciones en el lenguaje que el hardware entiende.
				
				-  **Dispositivos de almacenamiento (archivos de bloque `b`)**
				  
					Estos son los que ya hemos discutido y son cruciales para entender cómo se monta el almacenamiento.
					
					-  **`sda`, `sdb`, `sdc`, `sdd`**:
					
					    - Como vimos con `lsblk`, estos representan tus "discos" o dispositivos de almacenamiento. En un sistema físico, serían discos duros o SSDs. En WSL, son los archivos VHDX o particiones virtuales que el kernel de WSL presenta como si fueran discos físicos.
					    - `sdd` es tu disco principal de 1TB de la distribución WSL.
					    - `sdc` es tu dispositivo de swap de 4GB.
					    - `sda` y `sdb` son pequeños discos de solo lectura que probablemente contienen los componentes iniciales de arranque o de la capa de compatibilidad de WSL.
					-  **`loop0` a `loop7` (y `loop-control`)**:
					
					    - Representan **dispositivos de bucle (loop devices)**. Un dispositivo de bucle permite montar un archivo (como una imagen ISO o una imagen de disco) como si fuera un dispositivo de bloque. Es decir, puedes acceder al contenido de un archivo como si fuera una partición o un disco físico.
					    - `loop-control` es un dispositivo de control para la gestión de estos dispositivos.
					    - **Uso común:** Montar imágenes ISO, imágenes de disco para recuperación de datos, o para sistemas de archivos cifrados.
					-  **`ram0` a `ram15` (y `ram` implícito)**:
					
					    - Representan **discos RAM (ramdisk)**. Son bloques de memoria RAM que el sistema operativo puede tratar como un dispositivo de bloque. Los datos almacenados aquí son extremadamente rápidos de acceder, pero se pierden cuando el sistema se apaga.
					    - **Uso común:** Entornos de arranque rápido, sistemas embebidos, o para operaciones temporales que requieren mucha velocidad.
					-  **`mapper`**:
					
					    - Este es un directorio que contiene dispositivos creados por el **Device Mapper**. El Device Mapper es un marco del kernel de Linux que permite crear dispositivos virtuales mapeando bloques de datos de otros dispositivos.
					    - **Usos comunes:** LVM (Logical Volume Management), RAID de software, cifrado de disco (dm-crypt), y otros volúmenes lógicos.
					    - Si usaras LVM en tu WSL, verías subdirectorios o archivos aquí.
				-  **Dispositivos de carácter (archivos de carácter ``c``)**
				
					Estos son dispositivos que manejan datos como un flujo de bytes.
					
					-  **`null`**: El "agujero negro". Cualquier dato escrito en él desaparece; cualquier lectura de él devuelve un EOF (End Of File).
					  
						1. **``Salida estándar`` (stdout):** Esta es la salida "normal" de un programa, como los resultados de un comando, la información que quieres ver, o los datos que se procesan. Por defecto, `stdout` se envía a tu terminal (la pantalla).
						2. **``Error estándar`` (stderr):** Esta es la salida que un programa utiliza para mostrar mensajes de error o advertencias. Por defecto, `stderr` también se envía a tu terminal.
						
						El "agujero negro" `/dev/null` es un dispositivo especial de carácter que hemos mencionado. Cualquier cosa que le envíes a `/dev/null` simplemente **desaparece**.
						
						Ahora, analicemos el comando `command > /dev/null 2>&1`:
						
						- **`command`**: Es el comando que estás ejecutando (por ejemplo, `ls`, `grep`, un script, etc.).
						- **`>`**: Este es el operador de **redirección de salida estándar**. Le dice al shell que tome la salida de `stdout` del `command` y la envíe a un lugar diferente en lugar de la terminal.
						- **`/dev/null`**: Es el destino de la redirección. Le estamos diciendo que envíe la `stdout` al "agujero negro", es decir, que la **descarte por completo**.
						- **`2>&1`**: Esta es la parte crucial y un poco más avanzada.
						
						    - **`2`**: Representa el **descriptor de archivo para el error estándar (`stderr`)**. En Linux, los descriptores de archivo son números:
						        - `0`: Entrada estándar (`stdin`)
						        - `1`: Salida estándar (`stdout`)
						        - `2`: Error estándar (`stderr`)
						    - **`>`**: Nuevamente, el operador de redirección.
						    - **`&1`**: Significa "al mismo lugar que el descriptor de archivo 1". En otras palabras, le estás diciendo al shell que **redireccione `stderr` (descriptor 2) al mismo lugar donde ya has redirigido `stdout` (descriptor 1)**.
						
						**En resumen, el comando `command > /dev/null 2>&1` significa:**
						
						1. **Redirigir la salida estándar (`stdout`) del comando a `/dev/null` (descartarla).**
						2. **Redirigir la salida de error estándar (`stderr`) del comando al mismo lugar que la salida estándar (es decir, también a `/dev/null`, descartándola).**
					-  **`zero`**: Genera un flujo interminable de bytes nulos (ceros) cuando se lee.
					
					    - **Uso común:** Crear archivos grandes llenos de ceros (`dd if=/dev/zero of=archivo.bin bs=1M count=100`) o inicializar bloques de memoria.
					-  **`random` y `urandom`**:
					
					    - Fuentes de **números aleatorios criptográficamente seguros**.
					    - `random` es más "puro" pero puede bloquearse si no hay suficiente entropía (aleatoriedad real disponible).
					    - `urandom` es más "rápido" y no bloquea, pero puede ser ligeramente menos seguro en ciertas circunstancias extremas.
					    - **Uso común:** Generación de claves criptográficas, contraseñas, etc.
					-  **`tty`, `tty0` a `tty63`**:
					
					    - Representan **terminales de texto virtual (Teletypewriter)**. Son las consolas que usas para interactuar con el sistema cuando no estás en un entorno gráfico. `tty` es la terminal actual.
					    - **Uso común:** Acceder al sistema por línea de comandos, ejecutar scripts.
					-  **`pts` (pseudo-terminal slaves)**:
					
					    - Este es un directorio que contiene pseudo-terminales, utilizados por programas como emuladores de terminal (bash, zsh), SSH, `screen`, `tmux`, etc. Cada sesión de terminal que abres en un entorno gráfico o a través de SSH suele estar asociada a un archivo en `pts/` (ej. `pts/0`).
					    - **Uso común:** Todas las sesiones de terminal modernas.
					-  **`console`**:
					
					    - Representa la consola del sistema (la terminal principal).
					-  **`stdin`, `stdout`, `stderr`**:
					
					    - Son enlaces simbólicos a los descriptores de archivo estándar para la entrada estándar, la salida estándar y la salida de error estándar. Estos no son dispositivos de hardware en sí, sino interfaces para la comunicación de procesos.
					    - **Uso común:** Redireccionar la entrada/salida de comandos (ej. `ls > archivo.txt`).
					-  **`hvc0` a `hvc7` (Hyper-V Console)**:
					
					    - Estos son dispositivos de consola para **Hyper-V (Hypervisor Virtual Console)**. Esto es **muy característico de un entorno WSL2**, ya que WSL2 utiliza tecnología de virtualización ligera basada en Hyper-V para ejecutar el kernel de Linux. Estos dispositivos permiten que el host de Windows se comunique con el kernel de Linux en WSL.
					-  **`ptp0` y `ptp_hyperv`**:
					
					    - `ptp` significa "Precision Time Protocol". Estos dispositivos probablemente están relacionados con la **sincronización de la hora** entre el sistema invitado (WSL) y el sistema anfitrión (Windows Hyper-V), crucial para que las máquinas virtuales mantengan una hora precisa.
					-  **`kmsg`**:
					
					    - Es un archivo de dispositivo para acceder a los mensajes del kernel (el "kernel ring buffer"). Es el mismo buffer de donde `dmesg` obtiene su información.
					    - **Uso común:** Depuración y monitoreo de eventos del sistema de bajo nivel.
					-  **`mem`**:
					
					    - Representa la memoria física del sistema. Acceder a `/dev/mem` permite leer y escribir directamente en la RAM. Esto es extremadamente potente y peligroso, por lo que su acceso está muy restringido por seguridad.
					-  **`rtc` / `rtc0`**:
					
					    - Dispositivo de reloj en tiempo real (Real-Time Clock). Permite a los programas acceder a la hora del hardware del sistema.
					-  **`vcs` a `vcs6`, `vcsa` a `vcsa6`, `vcsu` a `vcsu6`**:
					
					    - Dispositivos de consola virtual que permiten a los programas capturar el contenido de las consolas de texto (VCS = Virtual Console Screen) o escribir en ellas (VCSA = Virtual Console Screen with Attributes). `vcsu` es para las pantallas sin atributos.
					-  **`vsock`**:
					
					    - Representa un zócalo (socket) de comunicaciones para la interacción entre una máquina virtual invitada y su host. Esto es **fundamental para la comunicación de WSL2 con Windows**, permitiendo que los procesos en Linux se comuniquen eficientemente con los servicios de Windows.
					-  **`dxg`**:
					
					    - Probablemente relacionado con **DirectX Graphics** o alguna integración gráfica específica de WSLg (la capa de gráficos de WSL). Permite que las aplicaciones gráficas de Linux se rendericen en el entorno de escritorio de Windows.
					-  **`full`**:
					
					    - Un dispositivo que, cuando se escribe en él, siempre devuelve un error "no hay espacio en el dispositivo" (`No space left on device`). Cuando se lee de él, devuelve bytes nulos.
					    - **Uso común:** Probar cómo un programa maneja errores de disco lleno.
					-  **`fuse`**:
					
					    - Interfaz para "Filesystem in Userspace" (Sistema de Archivos en Espacio de Usuario). Permite que los usuarios normales (no root) implementen sistemas de archivos.
					    - **Uso común:** SSHFS (montar sistemas de archivos remotos a través de SSH), o sistemas de archivos virtuales.
					-  **`mcelog`**:
					
					    - Relacionado con los registros de errores de verificación de máquina (Machine Check Errors) del procesador. Es para diagnosticar problemas de hardware.
					-  **`net`**:
					
					    - Este es un directorio o un dispositivo relacionado con la interfaz de red del sistema.
					-  **`virtio-ports`**:
					
					    - Directorio para los dispositivos `virtio`. VirtIO es una especificación de interfaz para controladores de dispositivos virtuales, común en entornos de virtualización (como KVM, pero también subyace en la tecnología de Hyper-V/WSL). Permite una comunicación más eficiente entre la máquina virtual y el hipervisor.
				![[Barra.gif]]
				-  **Verificar el tipo de sistema de archivos de una unidad de almacenamiento**
				
					- **`lsblk`**
					- **``sudo file -s /dev/xvdb``**
				-  
			-  **`/usr/`**
			  
				-  **`/usr/share/keyrings/`**
				  
					Este directorio es un almacén general y estándar del sistema para **``cualquier clave GPG``** que forme parte de paquetes de la distribución o de software que el sistema considere oficial o importante para la gestión de su propio software.
					
					🗒️**Nota**: **``APT no confía automáticamente``** en las claves solo por estar en `/usr/share/keyrings/`.
					
					-  **``Contenido``:** Contiene archivos `.gpg`, `.asc` de diversas claves GPG que pueden ser utilizadas por diferentes aplicaciones, incluyendo las de APT, pero también otras.
					-  **Gestión:**
				    
					    - Las claves aquí son, en su mayoría, instaladas y gestionadas por los **propios paquetes de Debian/Kali**. Por ejemplo, el paquete `debian-archive-keyring` instala las claves de los repositorios oficiales de Debian aquí.
					    - Raramente añadirías claves aquí manualmente a menos que estés construyendo o manteniendo un paquete.
					-  **``Cómo APT las utiliza``:** Para que una clave de `/usr/share/keyrings/` sea de confianza para APT, debe ser **referenciada explícitamente** desde el archivo `sources.list` o desde un archivo `.list` en `sources.list.d/`. Esto se hace usando la opción `signed-by=` en la entrada del repositorio.
				    
				    **Ejemplo (en `/etc/apt/sources.list.d/elastic.source`):** **`deb [signed-by=/usr/share/keyrings/kali-archive-keyring.gpg] http://kali.download/kali kali-rolling main contrib non-free`**
				    
				    En este caso, APT sabe que para verificar el repositorio `kali-rolling`, debe usar la clave ubicada específicamente en `/usr/share/keyrings/kali-archive-keyring.gpg`.
	-  <strong style ="color: ;">Atributos</strong>
	
		-  **Redes**
		  
			-  **``/etc/resolv.conf`` traducción de nombres de dominio**
			  
				(`lrwxrwxrwx 1 root root 20 May 24 22:12 resolv.conf -> /mnt/wsl/resolv.conf`) indica que el archivo `/etc/resolv.conf` en tu sistema **no es un archivo regular, sino un enlace simbólico (o "symlink")**.
				
				- **``Sincronización``:** WSL crea este enlace para que la configuración DNS que usa tu sistema Linux (que crees que está en `/etc/resolv.conf`) sea en realidad la misma configuración DNS que está manejando Windows. Esto asegura que la conectividad a internet funcione sin problemas tanto en Windows como en tu distribución de Linux dentro de WSL.
				- **``Automatización``:** WSL gestiona automáticamente este archivo. Si cambias tu configuración de red en Windows, WSL actualizará el archivo real (`/mnt/wsl/resolv.conf`), y como `/etc/resolv.conf` es un enlace simbólico, tu sistema Linux siempre usará la configuración más reciente.
				  
				**Configurar DNS records**: `sudo cat /etc/resolv.conf`
		-  **Storage**
		  
			-  **Verificar el tipo de sistema de archivos de una unidad de almacenamiento**
			
				- `lsblk`
				- ``sudo file -s /dev/sdd``
-  **Windows**

	-  **[Procesos ](process-microsoft.md)**
	![[barra.gif]]
	
	-  **Red**
	
		-  **[Protocolos de red](netzwerkprotokolle)**
	-  **Hardware**
	
		-  <strong style ="color: ;">Directorios</strong>
		
			-  **User**
			
				-  **~/.ssh**
				-  **~/AppData**
				
					-  **Directorio Roaming**
					
						Este directorio está diseñado para almacenar configuraciones, preferencias de usuario y datos de aplicaciones que deben sincronizarse con un servidor central cuando se utilizan perfiles de usuario móviles en redes corporativas con dominio.
						
						*  **Función principal:** Permite que la configuración de tus programas (como marcadores, historiales o preferencias de interfaz) te acompañe si inicias sesión en otra computadora conectada a la misma red de dominio.
						*  **Uso actual:** Aunque hoy en día el uso de perfiles de red es menos común en ordenadores personales, muchas aplicaciones siguen guardando aquí sus archivos de configuración general porque se considera una ubicación estándar para datos de usuario independientes del hardware.
					-  **Directorio Local**
					
						Contiene información y archivos específicos del equipo físico en el que te encuentras y que no pueden ni deben sincronizarse con otros equipos.
						
						*  **Función principal:** Almacena datos voluminosos, archivos temporales y cachés que dependen directamente del rendimiento o del almacenamiento local del dispositivo actual.
						*  **Uso habitual:** Aquí se guardan las cachés de los navegadores web, bases de datos locales de aplicaciones pesadas y archivos temporales que ocupan demasiado espacio como para replicarse a través de una red. Si cambiaras de ordenador, estos datos no se transferirían automáticamente.
					-  **Directorio LocalLow**
					
						Funciona de manera muy similar al directorio local, pero con una diferencia crítica orientada a la seguridad: opera bajo un nivel de integridad estricto (bajo).
						
						*  **Función principal:** Está destinado a aplicaciones que se ejecutan en entornos protegidos, aislados o en modo seguro (sandboxing) y que tienen restricciones severas de lectura y escritura.
						*  **Uso habitual:** Lo utilizan programas como visores de documentos, complementos de navegador o navegadores web cuando operan en zonas aisladas. Al tener privilegios limitados, estas aplicaciones solo pueden escribir datos en esta carpeta específica, lo que evita que un software comprometido o un script malicioso pueda modificar archivos críticos del resto del sistema operativo.
			-  **Windows**
			
				-  **Windows\System32**
				
					-  **Windows\System32**
					
						La carpeta `Windows\System32` es una de las **carpetas más críticas y fundamentales** del sistema operativo Windows. Su propósito principal es almacenar los **archivos esenciales** que Windows necesita para funcionar correctamente.
						
						Piensa en ella como el "cerebro operativo" de Windows. Contiene una gran cantidad de archivos vitales para el sistema, incluyendo:
						
						- **``Archivos del sistema operativo central``:** Incluye componentes principales y binarios del propio Windows.
						- **``Bibliotecas de enlace dinámico`` (.dll):** Una enorme cantidad de archivos `.dll` se almacenan aquí. Estas bibliotecas contienen código y datos que múltiples programas pueden usar simultáneamente, evitando que cada programa tenga que incluir todo el código necesario. Son cruciales para la funcionalidad de la mayoría de las aplicaciones y del propio sistema operativo.
						- **``Archivos ejecutables del sistema`` (.exe):** Contiene muchos de los programas y utilidades que componen el sistema operativo, como la línea de comandos (`cmd.exe`), el administrador de tareas (`Taskmgr.exe`), y una multitud de herramientas de administración y procesos del sistema.
						- **``Controladores de dispositivos``:** Algunos archivos relacionados con los controladores de hardware pueden encontrarse aquí o en subcarpetas.
						
						-  **Isass.exe**
						
							El **Servicio de subsistema de autoridad de seguridad local** es un proceso en los sistemas operativos, responsable que los usuarios inicien sesión en un equipo o servidor Windows, gestiona los cambios de [contraseñas ](https://es.wikipedia.org/wiki/Contrase%C3%B1a "Contraseña") y crea [tokens de acceso ](https://es.wikipedia.org/w/index.php?title=Token_de_acceso&action=edit&redlink=1 "Token de acceso (aún no redactado)"). También escribe en el [registro de seguridad de Windows ](https://es.wikipedia.org/w/index.php?title=Registro_de_seguridad_de_Windows&action=edit&redlink=1 "Registro de seguridad de Windows (aún no redactado)"). La terminación forzada de lsass.exe provoca un reinicio de la máquina.
							
							Debido a que lsass.exe es un archivo de sistema crucial, su nombre es a menudo falsificado por malware. El archivo lsass.exe utilizado por Windows se encuentra en el directorio ``Windows\System32``. Si se ejecuta desde cualquier otra ubicación, lo más probable es que lsass.exe se trate de un virus, spyware, troyano o gusano.
							
							Debido a la forma en que algunos sistemas muestran las fuentes, los desarrolladores malintencionados pueden nombrar el archivo como Isass.exe (mayúscula "I" en lugar de una "l" en minúsculas) para engañar a los usuarios para instalar o ejecutar un archivo malicioso en lugar del sistema de confianza archivo.
					-  **Windows\System32\OpenSSH**
			-  **Program Files**
		-  **Sistema operativo Windows**
		
			**``Microsoft Disk Operating System``** (MS-DOS), fue uno de los primeros sistemas operativos populares para PCs. Fue adquirido por Microsoft y desarrollado como MS-DOS, que proporcionaba una interfaz de línea de comandos para gestionar archivos y programas en discos.
			
			1. **``Interfaz de Línea de Comandos`` (CLI)**: MS-DOS utilizaba una interfaz de texto donde los comandos se ingresaban directamente para ejecutar diversas tareas.
			   
				- `dir`: Lista todos los archivos en el directorio actual.
				- `cd directory`: Cambia al directorio especificado.
				- `cd..`: Navega al directorio superior.
				- `cd \` : Navega al directorio raíz (usualmente C:).
				- `copy origen destino`: Copia archivos a otra ubicación.
				- `del nombre_archivo`: Borra archivos.
				- `find`: Busca texto en archivos.
				- `mkdir directorio`: Crea un nuevo directorio.
				- `ren nombre_antiguo nombre_nuevo`: Renombra un archivo.
				- `help`: Muestra todos los comandos disponibles.
				- `help comando`: Proporciona ayuda detallada sobre un comando específico.
			2. **``Arranque y carga``**: MS-DOS cargaba desde el disco durante el arranque del sistema, lo que permitía acceder directamente a los archivos y programas almacenados.
			
			-  <strong style ="color: ;">Vulnerabilidades en el sistema operativo</strong>
			
				-  **Protección contra virus o malware:**
				
				    - Windows Defender, integrado en Windows, ofrece protección contra malware por defecto.
				    - Es crucial mantener Windows Defender activado para protegerse contra ataques y malware.
				-  **Servicios desconocidos o no administrados:**
				
				    - Verificar y gestionar los servicios en segundo plano para garantizar que sean seguros y necesarios.
				    - Los servicios desconocidos pueden ser puntos de entrada para ataques.
				-  **Cifrado:**
				
				    - Encriptar datos es fundamental para proteger la información, especialmente en dispositivos móviles y en computadoras.
				    - El cifrado evita la exposición y explotación de datos sensibles.
				-  **Política de seguridad:**
				
				    - Configurar y hacer cumplir una política de seguridad adecuada es esencial.
				    - Las configuraciones de política pueden mitigar muchos tipos de ataques si se implementan correctamente.
				-  **Firewall:**
				
				    - Utilizar el Firewall de Windows para controlar la comunicación de red.
				    - Revisar periódicamente las reglas del firewall para asegurarse de que sigan siendo relevantes y eliminar las obsoletas.
				-  **Permisos de archivo y uso compartido:**
				
				    - Asignar permisos mínimos necesarios a usuarios y grupos para evitar accesos no autorizados.
				    - Evitar dar permisos totales al grupo "Todos", lo cual podría comprometer la seguridad de los archivos.
				-  **Contraseña débil o sin contraseña:**
				
				    - Utilizar contraseñas robustas para todas las cuentas, especialmente la cuenta de administrador.
				    - Las contraseñas débiles son vulnerables a los ataques de fuerza bruta.
				-  **Iniciar sesión como administrador:**
				
				    - Evitar iniciar sesión regularmente como administrador.
				    - Utilizar una cuenta de usuario estándar y cambiar a la cuenta de administrador solo para tareas que requieran privilegios elevados.
			-  **Hardware y comunicación en OS** 
			
				**Boot Process**: El proceso de arranque, también conocido como booteo, es el proceso que inicia una computadora cuando la enciendes. Es una serie de pasos que prepara el hardware y carga el sistema operativo en la memoria, para que finalmente puedas usar la computadora.
				
				1. **``Encendido y POST``:** Cuando enciendes la computadora, se realiza una autoprueba de encendido (POST por sus siglas en inglés Power-On Self-Test). El BIOS (Basic Input/Output System) o UEFI (Unified Extensible Firmware Interface) verifica que todos los componentes de hardware estén funcionando correctamente.
				2. **``Buscar dispositivo de arranque``:** El BIOS o UEFI busca el dispositivo de arranque, que suele ser el disco duro, pero también puede ser un CD, DVD, unidad USB o incluso la red.
				3. **``Cargar el gestor de arranque``:** Una vez encontrado el dispositivo de arranque, se carga un pequeño programa llamado gestor de arranque.
				4. **``Cargar el sistema operativo``:** El gestor de arranque localiza y carga el kernel del sistema operativo en la memoria RAM. El kernel es la parte central del sistema operativo.
				5. **``Inicializar el sistema operativo``:** El kernel del sistema operativo inicializa los dispositivos de hardware y carga los controladores necesarios para su funcionamiento.
				6. **``Ejecutar el resto del sistema operativo``:** El kernel lanza otros procesos del sistema operativo, como la interfaz gráfica de usuario (GUI), para que puedas interactuar con la computadora.
				
				-  **Sistemas de numeración: ``Decimal``**
				
					Los sistemas de numeración son una forma de representar cantidades o valores en diferentes bases. En el contexto de los sistemas operativos Linux, es esencial entender cómo se utilizan y convierten entre diferentes sistemas de numeración, siendo el sistema decimal uno de los más comunes.
					
					**Sistema decimal**
					
					- El sistema decimal es un sistema de numeración en base 10 que utiliza diez dígitos: 0, 1, 2, 3, 4, 5, 6, 7, 8 y 9. Cada posición de un número decimal tiene un valor que es una potencia de 10, dependiendo de su posición.
					
					**Representación de 72897 en decimal**
					
					Para entender cómo se representa el número **72897** en decimal, utilizamos potencias de 10:
					
					- **7** en la posición de 10^4 (10000)
					- **2** en la posición de 10^3 (1000)
					- **8** en la posición de 10^2 (100)
					- **9** en la posición de 10^1 (10)
					- **7** en la posición de 10^0 (1)
				-  **Sistemas de numeración: ``Binario``**
				
					El sistema binario es fundamental en computación y en sistemas Linux, ya que es el lenguaje que utilizan las máquinas para procesar información.
					
					Importancia del sistema binario en Linux
					
					1. **``Representación de datos``**: Todo en una computadora, desde números y texto hasta imágenes y sonidos, se representa en binario. Cada bit (dígito binario) representa un estado de "encendido" (1) o "apagado" (0).
					2. **``Operaciones lógicas y aritméticas``**: Las computadoras realizan operaciones utilizando operaciones lógicas que se basan en el sistema binario. Esto es fundamental en programación y administración de sistemas en Linux.
					3. **``Direcciones de memoria``**: En Linux, la dirección de memoria y otros aspectos técnicos de bajo nivel utilizan representaciones binarias para gestionar y acceder a datos en el hardware.
					4. **``Archivos y permisos``**: En sistemas Linux, los permisos de archivo se representan utilizando el sistema octal, que a su vez se deriva del binario. Por ejemplo, los permisos de lectura, escritura y ejecución se pueden expresar en binario y luego convertidos a octal.
				
				**Componentes esenciales de hardware**
				
				-  **``Placa Base``:** Actúa como el centro neurálgico del ordenador, proporcionando conexiones para todos los componentes esenciales.
				
					- **Funciona como la "placa base" del ordenador.**
					- Es la base sobre la que se **montan todos los demás componentes**, como la CPU, la memoria RAM, la tarjeta gráfica, etc.
					- Proporciona las **conexiones** entre estos componentes y les permite comunicarse entre sí.
					- También contiene el **chipset**, que es un chip que gestiona la comunicación entre la CPU y los demás componentes.
				-  **``CPU`` (Unidad Central de Procesamiento):** Conocida comúnmente como el cerebro del ordenador, procesa datos y ejecuta instrucciones. Las CPU modernas pueden ser multinúcleo para aumentar la capacidad de procesamiento.
				
					- Es el chip que se encarga de **procesar las instrucciones y realizar los cálculos** necesarios para que los programas funcionen.
					- La CPU consta de la unidad de control y la unidad aritmético-lógica. La primera recibe y decodifica instrucciones, mientras que la segunda realiza operaciones matemáticas y lógicas.
					- La CPU sigue un ciclo básico: obtener (fetch), decodificar (decode) y ejecutar (execute) instrucciones.
					- Su velocidad y potencia se miden en gigahercios (GHz).
				-   **``RAM`` (Memoria de Acceso Aleatorio):** Funciona como la memoria a corto plazo del ordenador, almacenando datos y programas que se están utilizando activamente. Cuanta más RAM, más rápido puede operar el ordenador.
				
					- **Memoria volátil:** Como la RAM, que retiene datos solo mientras el ordenador está encendido.
				-  **``Almacenamiento`` (HDD y SSD):** Proporciona la memoria a largo plazo del ordenador. Los HDD (Unidades de Disco Duro) son más económicos pero más lentos, mientras que los SSD (Unidades de Estado Sólido) son más rápidos y eficientes en energía.
				
					- **Memoria no volátil:** Como los discos duros, donde se almacenan los datos de manera permanente.
				-  **``Fuente de Alimentación``:** Suministra energía eléctrica a todos los componentes del ordenador, adaptándose a las necesidades de potencia del dispositivo.
			-  <strong style ="color:;">Arquitectura y operaciones de Windows</strong>
			
				En la arquitectura básica de Windows, se pueden identificar las siguientes capas desde las aplicaciones hasta el hardware:
				
				![[Pasted image 20240715185001.png]]
				
				1. **``Aplicaciones``:** Son los programas que los usuarios ejecutan en la computadora, como navegadores web, editores de texto, juegos, etc.
				2. **``API de Windows``:** Son conjuntos de funciones que las aplicaciones utilizan para solicitar servicios al sistema operativo, como la gestión de archivos, la interfaz gráfica, etc.
				3. **``Controladores del modo de usuario``:** Son programas que permiten a las aplicaciones interactuar con dispositivos o servicios específicos a nivel de usuario.
				4. **``Otros controladores del modo de kernel``:** Estos controladores operan en un nivel más bajo que los del modo de usuario y tienen acceso al hardware y a funciones críticas del sistema.
				5. **``Kernel del sistema operativo``:** Es el núcleo del sistema operativo que gestiona los recursos del sistema, las solicitudes de entrada/salida, la memoria y los periféricos conectados.
				6. **``Controladores del sistema de archivos``:** Son los componentes que permiten al sistema operativo interactuar con diferentes sistemas de archivos (como NTFS, FAT32, etc.) para gestionar el almacenamiento y la organización de datos.
				7. **``Capa de Abstracción de Hardware`` (HAL):** Es una capa de software que actúa como intermediario entre el kernel del sistema operativo y el hardware físico de la computadora. La HAL se encarga de traducir las solicitudes del kernel en instrucciones específicas para el hardware y viceversa.
				8. **``Hardware``:** Son los componentes físicos de la computadora, como procesadores, memoria RAM, discos duros, tarjetas gráficas, etc.
				
				**Funciones y responsabilidades de la HAL**
				
				- **``Intermediación de comunicación``:** La HAL facilita la comunicación entre el kernel del sistema operativo y los dispositivos de hardware. Esto incluye la gestión de dispositivos y la traducción de instrucciones del kernel en comandos entendibles por el hardware.
				- **``Compatibilidad de hardware``:** Permite que el sistema operativo funcione de manera uniforme en diferentes configuraciones de hardware. La HAL oculta las diferencias de hardware específicas y proporciona una interfaz común al sistema operativo.
				- **``Optimización del rendimiento``:** Al manejar eficientemente las solicitudes de hardware, la HAL contribuye a mejorar el rendimiento general del sistema operativo.
				
				**Relación entre la HAL y el Kernel**
				
				- Aunque la HAL maneja la mayoría de las comunicaciones de hardware, el kernel del sistema operativo puede comunicarse directamente con el hardware en algunos casos específicos donde se requiere un control más directo.
				- La HAL y el kernel trabajan en conjunto para gestionar eficazmente todos los recursos de la computadora y ofrecer un entorno operativo estable y seguro.
				
				-  <strong style ="color: ;">Diferencias entre el modo usuario y el modo kernel</strong>
				
					**Modo Usuario**:
					
					- **``Componentes``:** Incluye las aplicaciones instaladas, los controladores de modo de usuario y las API de Windows.
					- **Características:** Las aplicaciones se ejecutan en este modo, donde están aisladas del hardware subyacente y del sistema operativo en sí.
					- **``Acceso a recursos``:** Las aplicaciones no tienen acceso directo a la memoria ni al hardware. Todas las solicitudes de recursos deben pasar a través del sistema operativo para su gestión y acceso.
					- **``Aislamiento``:** Los errores en las aplicaciones de modo usuario generalmente no afectan al sistema operativo en su conjunto. El sistema operativo puede gestionar estos errores y permitir la recuperación sin comprometer la estabilidad general del sistema.
					- **``Limitaciones``:** El acceso limitado a los recursos del sistema garantiza la seguridad y estabilidad, pero también restringe las acciones que las aplicaciones pueden realizar directamente.
					
					**Modo Kernel**:
					
					- **``Componentes``:** Incluye los otros controladores de modo de kernel, el núcleo del sistema operativo, los controladores del sistema de archivos, la capa de abstracción de hardware (HAL) y el hardware físico.
					- **``Privilegios``:** El código (**binario**) que se ejecuta en el modo kernel tiene acceso completo al hardware y a todas las instrucciones de la CPU. Puede gestionar directamente la memoria y otros recursos sin restricciones.
					- **``Acceso ilimitado``:** Los controladores de modo kernel y el núcleo del sistema operativo pueden interactuar directamente con el hardware y gestionar operaciones críticas del sistema.
					- **``Riesgos``:** Debido a su acceso ilimitado, los errores en el código del modo kernel pueden llevar a fallos críticos del sistema operativo. Un error en un controlador de modo kernel puede provocar la interrupción de todo el sistema operativo, causando un mal funcionamiento generalizado.
					- **``Espacio de direcciones compartido``:** Todo el código en modo kernel comparte el mismo espacio de direcciones físicas, lo que significa que un error en un controlador puede afectar negativamente a otros componentes del sistema operativo que también operan en modo kernel.
		-  <strong style ="color: ;">Proceso de arranque de Windows</strong>
		
			![[Pasted image 20240715194609.png]]
			
			-  **Inicialización del BIOS o UEFI:**
				
				- **``BIOS``:** (Basic Input-Output System) Inicia con la POST (Power-On Self Test), que prueba y verifica los componentes de hardware esenciales como la memoria RAM, el teclado, y el disco duro.
				- **``UEFI``:** (Unified Extensible Firmware Interface) Inicia cargando los archivos de programa EFI almacenados en la partición de sistema EFI (ESP, EFI System Partition).
			-  **Carga del MBR o archivos EFI**
			
				- **``MBR``:** Localiza y carga el gestor de arranque del sistema operativo, como Bootmgr.exe.
				- **``Archivos EFI``:** Son archivos **``.efi``** almacenados en la partición EFI que inician el proceso de carga del sistema operativo.
			-  **Ejecución de Bootmgr.exe y lectura de BCD**
			
				**Bootmgr.exe:**
				
				- Cambia el sistema del modo real al modo protegido.
				- Lee la Base de Datos de Configuración de Arranque (BCD), que contiene la configuración necesaria para iniciar el sistema operativo, incluyendo si se está saliendo de una hibernación.
			-  **Inicio del núcleo de Windows y configuración final**
			
				-  **Ntoskrnl.exe:**
				
					- Inicia el núcleo de Windows y configura la HAL (Hardware Abstraction Layer).
				-  **SMSS (Session Manager Subsystem):**
				
					- Lee el registro para establecer el entorno de usuario.
					- Inicia el servicio de Winlogon y prepara el escritorio de cada usuario a medida que inician sesión.
			-  **Según el tipo de arranque: hibernación o arranque en frío**
			
				-  **Hibernación:**
				
					Si se está saliendo de hibernación, el proceso continúa con Winresume.exe, que lee el archivo Hiberfil.sys para restaurar el estado previo de la sesión.
				-  **Arranque en frío:**
				
					Si es un arranque en frío, se carga Winload.exe, que crea un registro de configuración de hardware y verifica la firma de los controladores con KMCS para garantizar su seguridad.
	-  **Seguridad**
	  
		-  **Firewall**
		
			-  <strong style ="color: ;">Implementación rápida sobre Firewall Windows Defender</strong>
			
				-  **Acceso y configuración básica**
				
					-  **Acceso al Firewall de Windows Defender**:
					
					    - Abre el **Panel de control**.
					    - Navega a **Sistema y seguridad**.
					    - Selecciona **Firewall de Windows Defender**.
					-  **Permitir aplicaciones o funciones**:
					
					    - En la sección del Firewall de Windows Defender, elige **Permitir una aplicación o una función a través del Firewall de Windows Defender**.
					    - Aquí puedes seleccionar aplicaciones específicas que deseas permitir el acceso a través del firewall, configurando reglas de tráfico entrante y saliente.
				-  **Configuración avanzada**
				
					-  **Configuración avanzada**:
					
					    - Dentro del Firewall de Windows Defender, selecciona **Configuración avanzada**.
					    - Aquí puedes:
					      
					        - Crear reglas específicas para el tráfico entrante y saliente.
					        - Definir condiciones detalladas basadas en diversos criterios como dirección IP, puerto, protocolo, etc.
					        - Importar y exportar políticas de firewall para mantener consistencia entre varias máquinas.
					-  **Reglas de tráfico entrante y saliente**:
					
					    - Puedes crear reglas personalizadas para permitir o bloquear tráfico según tus necesidades específicas.
					    - Estas reglas aseguran que solo el tráfico autorizado tenga acceso a tu sistema, mejorando así la seguridad.
				-  **Desactivación y consideraciones adicionales**
				
					-  **Desactivar el Firewall de Windows**:
					
					    - Si decides utilizar otro software de firewall, es posible desactivar el Firewall de Windows Defender desde el mismo panel.
					    - Sin embargo, desactivar el firewall debe hacerse con precaución y solo cuando se ha configurado otro firewall alternativo que gestione la seguridad adecuadamente.
		-  **Políticas**
		  
			-  <strong style ="color: ;">Política de seguridad local</strong>
			
				La directiva de seguridad local es accesible a través de un applet en Windows y permite configurar políticas de seguridad específicas para una computadora individual. Aquí están algunos aspectos importantes de su funcionamiento:
				
				-  **Acceso al applet**
				
					**Buscar "directiva de seguridad local"**: Utiliza la función de búsqueda de Windows para encontrar y abrir el applet.
				-  **Políticas de seguridad clave: Política de contraseñas**
				
					- **Ubicación**: Se encuentra dentro de **Políticas de cuenta** en la Directiva de seguridad local.
					- **Función**: Define los criterios para las contraseñas de los usuarios locales.
					- **Objetivo**: Asegurar que todas las contraseñas cumplan con ciertos estándares de seguridad para proteger contra el robo de datos y acciones malintencionadas.
				-  **Bloqueo de cuenta**
				
					- **Ubicación**: También en **Políticas de cuenta**.
					- **Función**: Configura las reglas para bloquear una cuenta después de varios intentos fallidos de inicio de sesión.
					- **Ejemplo**: Puede configurarse para bloquear una cuenta después de cinco intentos fallidos y liberar el bloqueo automáticamente después de un período definido (por ejemplo, 30 minutos).
				-  **Protección de la pantalla**
				
					- **Ubicación**: En diversas configuraciones dentro de la Directiva de seguridad local.
					- **Función**: Establece reglas para proteger la computadora cuando está inactiva.
					- **Implementación**: Configura el protector de pantalla para que se active después de un período de inactividad, lo cual garantiza que la computadora se bloquee y se asegure automáticamente.
				-  **Exportación e importación de políticas**
				
					- **Función**: Permite exportar la configuración de la Directiva de seguridad local a un archivo, como **workstation.inf**, para luego importarlo en otras computadoras.
					- **Uso**: Útil para mantener consistencia en la configuración de múltiples computadoras independientes sin necesidad de configurar manualmente cada una.
				-  **Otras configuraciones**
				
					- **Derechos de usuario**: Define los permisos específicos que tienen los usuarios locales.
					- **Reglas de firewall**: Configura las reglas de seguridad del firewall de Windows.
					- **AppLocker**: Limita los archivos ejecutables que pueden ser utilizados por usuarios o grupos.
				-  **Uso práctico**
				
					- Utiliza la Directiva de seguridad local para establecer políticas robustas que protejan la computadora contra accesos no autorizados, asegurando contraseñas seguras, bloqueando cuentas y protegiendo la pantalla cuando no está en uso.
					- Exporta e importa configuraciones para mantener la coherencia de seguridad en varias computadoras independientes.
			-  <strong style ="color: ;">Claves de registro Windows</strong>
			
				Windows involucra la configuración y ejecución de varios servicios y aplicaciones que se gestionan a través del registro del sistema. 
				
				En el registro de Windows, específicamente en las claves **``HKEY_LOCAL_MACHINE``** y **``HKEY_CURRENT_USER``**, se definen las configuraciones para iniciar automáticamente aplicaciones y servicios. Estas entradas se pueden configurar manualmente en el registro, pero se recomienda utilizar herramientas como **``Msconfig.exe``** para gestionarlas de manera más segura y conveniente.
				
				-  **HKEY_LOCAL_MACHINE** **(HKLM)**: Esta clave del registro contiene información sobre el hardware, los sistemas operativos y los programas instalados en la computadora para todos los usuarios. Las entradas de esta clave solo pueden ser modificadas por el administrador.
				   
					-  **Información del hardware** :
					
					    - Contiene detalles sobre la configuración del hardware del sistema, como los controladores de dispositivos, los puertos de comunicaciones, las configuraciones de red y más.
					    - **Ejemplos**: Configuraciones de tarjetas de red, discos duros, tarjetas gráficas, etc.
					-  **Información del sistema operativo** :
					
					    - Almacena información sobre el sistema operativo instalado, incluyendo versiones, parches y otros detalles del sistema.
					    - **Ejemplos**: Versiones del sistema operativo, directorios de instalación, servicios en ejecución, etc.
					-  **Información de programas instalados** :
					
					    - Guarda datos sobre los programas y aplicaciones instaladas en la computadora.
					    - **Ejemplos**: Registros de instalación, configuraciones, rutas de acceso, etc.
					-  **Acceso y modificación** :
					
					    - Las entradas de esta clave del registro generalmente están protegidas y no pueden ser modificadas fácilmente por cualquier usuario.
					    - Solo el administrador del sistema tiene permisos para modificar estas entradas, lo cual es importante para mantener la integridad y seguridad del sistema.
				-  **HKEY_CURRENT_USER** **(HKCU)**: Esta clave del registro contiene información sobre el usuario actual que está logueado en el sistema. Incluye configuraciones de software y preferencias de usuario.
				
					-  **Configuraciones de software** :
					
					    - Esta sección del registro guarda información sobre cómo están configurados los programas y aplicaciones para el usuario actual. Por ejemplo, puede incluir la configuración de opciones en una aplicación, como el idioma preferido, la disposición del teclado, las preferencias de color, etc.
					-  **Preferencias de usuario** :
					
					    - Aquí se almacenan las preferencias personales del usuario, como la configuración de la barra de tareas, el fondo de escritorio, los atajos de teclado, los ajustes de sonido, entre otros.
					    - También puede incluir configuraciones de seguridad, como contraseñas guardadas, credenciales, permisos, etc.
					-  **Otras configuraciones** :
					
					    - Datos de entorno, como variables de entorno específicas del usuario.
					    - Configuraciones de red, como conexiones de red guardadas.
					    - Preferencias de exploradores web, como marcadores, historial, configuraciones de privacidad.
						
						**Ejemplos prácticos**
						
						- **Aplicaciones** : Si cambias la configuración de un programa específico (como cambiar el idioma o la disposición del teclado), esta información se almacena en `HKEY_CURRENT_USER`.
						- **Escritorio** : La disposición de los iconos en el escritorio, así como el fondo de pantalla, se almacenan aquí.
						- **Accesibilidad** : Configuraciones de accesibilidad, como el tiempo de espera para las pulsaciones de teclas, también se guardan aquí.
				-  **HKEY_USERS** **(HKU)**: Contiene la información de perfil de todos los usuarios que tienen cuentas de usuario en el sistema. Esta clave es especialmente útil para acceder a la configuración y preferencias de cada usuario individualmente.
				
					-  **Contenido** :
					
					    - **``DEFAULT``** : Este subclave contiene la configuración predeterminada que se aplica a nuevos usuarios cuando crean sus perfiles.
					    - **``S-1-5-18``** : Esta subclave es un identificador único de seguridad (SID) que corresponde al perfil del sistema (generalmente el perfil del sistema local).
					    - **``S-1-5-21-...-1000``** : Estos SIDs corresponden a los perfiles de los usuarios individuales en el sistema. El número al final (por ejemplo, 1000) es un identificador de seguridad (SID) único para cada usuario.
					-  **Usos** :
					
					    - Se utiliza para ver y modificar la configuración del perfil de usuario.
					    - Ayuda a administradores y desarrolladores de software a entender y gestionar las preferencias y configuraciones de los usuarios.
				-  **HKEY_CLASSES_ROOT (HKCR**): Combina información de la clave `HKEY_LOCAL_MACHINE\Software\Classes` y `HKEY_CURRENT_USER\Software\Classes`. Esta clave es responsable de asociar extensiones de archivo y tipos de datos con programas y de definir las acciones que se pueden realizar con esos tipos de datos.
				
					-  **Contenido** :
				    
					    - **``Extensiones de archivo``** : Define qué programa se abre cuando se hace doble clic en un archivo con una extensión específica (por ejemplo, `.docx` se asocia con Word).
					    - **``Tipos de datos``** : Define los tipos de datos que se pueden manipular y cómo se pueden manipular.
					    - **``Menús contextuales``** : Define las opciones que aparecen en el menú contextual (botón derecho del mouse) para diferentes tipos de archivos.
					-  **Usos** :
				    
					    - Se utiliza para personalizar cómo se abren y se manejan los archivos.
					    - Permite a los desarrolladores de software registrar sus aplicaciones y sus tipos de datos en el sistema.
				-  **HKEY_CURRENT_CONFIG (HKCC)**: Contiene información sobre la configuración del hardware y del sistema actual, similar a `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Hardware Profiles\Current`.
				
					-  **Contenido** :
				    
					    - **``Hardware profiles``** : Contiene información sobre los perfiles de hardware del sistema, que definen cómo se configura el hardware en diferentes escenarios (por ejemplo, cuando se inicia el sistema en modo seguro).
					    - **``Configuraciones del sistema``** : Incluye configuraciones del sistema como resoluciones de pantalla, controladores de dispositivo, y otros parámetros de hardware.
					-  **Usos** :
				    
					    - Se utiliza principalmente para la configuración del hardware en tiempo de ejecución.
					    - Ayuda a los administradores de sistemas y desarrolladores a entender y modificar la configuración del hardware del sistema.
				
				**Tipos de registros**
				
				-  **Tipos de entradas en el registro**
				
					Las configuraciones de inicio se definen a través de varios tipos de entradas en el registro, que incluyen:
					
					- **``Run``:** Establece programas que se ejecutan cada vez que se inicia Windows.
					- **``RunOnce``:** Configura programas que se ejecutan solo una vez durante el próximo inicio.
					- **``RunServices``:** Define servicios que se ejecutan cada vez que se inicia Windows.
					- **``RunServicesOnce``:** Especifica servicios que se ejecutan solo una vez durante el próximo inicio.
					- **``Userinit``:** Define aplicaciones específicas del usuario que se ejecutan cuando inicia sesión.
					
					Estas entradas se pueden configurar manualmente en el registro, pero se recomienda utilizar herramientas como **``Msconfig.exe``** para gestionarlas de manera más segura y conveniente.
				-  **Tipos de datos en el registro**
				
					El registro almacena diferentes tipos de datos en sus valores, incluyendo:
					
					- **``REG_BINARY``**: Números o datos binarios.
					- **``REG_DWORD``**: Números de 32 bits o más grandes, incluyendo datos sin procesar.
					- **``REG_SZ``**: Valores de cadena de texto.
					
					**Ejemplo**
					
					1. Ejecuta`Win +R` se abrirá un apartado, en el selecciona `Regedit` el cual es un editor de registros.
					2. Selecciona la clave de registro `HKEY_CURRENT_USER` - `Software` - `Sysinternals` y selecciona `Process Explorer`.
					3. Ubica la clave de registro `EulaAccepted`, la cual debe estar en `1`.
					4. Esta clave de registro nos indica que se aceptaron los términos y condiciones. 
			-  **Listado de privilegios de seguridad de Windows**
			
				-  **``secpol.msc``: Configuración de seguridad → Directivas locales → Asignación de derechos de usuario**
				-  **``gpedit.msc``: Configuración del equipo → Configuración de Windows → Configuración de seguridad → Directivas locales → Asignación de derechos de usuario**
				-  **``SeAssignPrimaryTokenPrivilege`` (Reemplazar un símbolo (token) de nivel de proceso):**
				
					Este permiso permite reemplazar el token de seguridad primario de un proceso. Esto significa que un usuario con este permiso podría tomar el control de otro proceso, incluso si ese proceso se está ejecutando con una cuenta de usuario diferente. Este es un permiso muy poderoso y debe usarse con extrema precaución. **Estado: Habilitado**
					
					Si la máquina ejecuta servicios IIS o SQL, estos privilegios estarán habilitados de forma predeterminada.
				-  **``SeTcbPrivilege`` (Actuar como parte del sistema operativo):**
				
					Este permiso permite a un usuario actuar como si fuera el sistema operativo. Esto significa que el usuario podría realizar acciones que normalmente solo pueden realizar el sistema operativo, como cambiar la configuración del sistema o instalar controladores de dispositivo. Este es un permiso extremadamente poderoso y solo debe otorgarse a usuarios confiables. **Estado: Habilitado**
				-  **``SeAuditPrivilege`` (Generar auditorías de seguridad):**
				
					Este permiso permite a un usuario generar entradas de auditoría de seguridad. Las entradas de auditoría registran eventos que ocurren en el sistema, como inicios de sesión, cambios en la configuración del sistema y acceso a archivos. Este permiso puede ser útil para rastrear la actividad en un sistema y detectar posibles violaciones de seguridad. **Estado: Habilitado**
				-  **``SeChangeNotifyPrivilege`` (Omitir comprobación de recorrido):**
				
					Este permiso permite a un usuario omitir la comprobación de recorrido al acceder a objetos en el sistema de archivos. La comprobación de recorrido es una medida de seguridad que evita que los usuarios accedan a objetos a los que no tienen permiso. Este permiso puede ser útil para los administradores del sistema que necesitan acceder a archivos que normalmente no estarían disponibles para ellos. **Estado: Habilitado**
				-  **``SeImpersonatePrivilege`` (Suplantar a un cliente tras la autenticación):**
				
					Este permiso permite a un usuario hacerse pasar por otro usuario después de que el usuario original se haya autenticado. Esto significa que el usuario con este permiso podría realizar acciones en nombre del usuario original, incluso si el usuario original no ha dado su consentimiento. Este es un permiso muy poderoso y debe usarse con extrema precaución. **Estado: Habilitado**
					
					Si la máquina ejecuta servicios IIS o SQL, estos privilegios estarán habilitados de forma predeterminada.
		-  **Monitorización**
		
			-  <strong style ="color: ;">Visor de eventos</strong>
			
				El visor de eventos de Windows registra eventos importantes del sistema, aplicaciones y seguridad del sistema operativo. Estos eventos son útiles para resolver problemas y monitorear el estado del sistema.
				
				-  **Categorías de registros**
				
					- **``Registros de Windows``**: Contiene eventos relacionados con el sistema operativo mismo.
					- **``Registros de aplicaciones y servicios``**: Incluye eventos de aplicaciones instaladas y otros servicios.
				-  **Información de los eventos**
				
					Cada evento registrado incluye:
					
					- **``Nivel``**: Indica la gravedad del evento (información, advertencia, error, crítico).
					- **``Fecha y hora``**: Momento en que ocurrió el evento.
					- **``Origen``**: Identifica la fuente del evento (aplicación, servicio, sistema).
					- **``ID del evento``**: Número que identifica el tipo específico de evento.
				-  **Creación de vistas personalizadas**
				
					Es posible crear vistas personalizadas para filtrar y buscar eventos específicos:
					
					- **``Criterios de búsqueda``**: Puedes buscar por tipo de evento, período de tiempo, nivel de gravedad, entre otros.
					- **``Vista eventos administrativos``**: Incluye eventos críticos, de error y de advertencia de todos los registros administrativos, útil para diagnosticar problemas generales.
				-  **Registros de sucesos de seguridad**
				
					Están ubicados en los Registros de Windows y utilizan ID de evento para clasificar los eventos relacionados con la seguridad del sistema.
					
					**Uso práctico**
					
					- **``Buscar el visor de eventos``**: Utiliza la barra de búsqueda de Windows y escribe "Visor de eventos".
					- **``Seleccionar el icono del programa``**: Haz clic para abrir la aplicación.
					
					**Ejemplo de consulta**
					
					Supongamos que deseas encontrar eventos críticos recientes en el sistema:
					
					- Abre el Visor de eventos.
					- Navega hasta la vista Eventos administrativos.
					- Filtra por eventos críticos.
					- Observa los detalles del evento para diagnosticar problemas.
					
					El Visor de eventos es fundamental para los administradores de sistemas y usuarios avanzados que necesitan mantener la estabilidad y seguridad de sus sistemas Windows mediante el monitoreo y análisis de eventos.
			-  <strong style ="color: ;">Uso de Msconfig.exe</strong>
			
				**Msconfig.exe** es una herramienta de Windows que permite visualizar y modificar las opciones de inicio del sistema. Para abrir esta herramienta:
				
				1. **Buscar Msconfig:** Utiliza **``Win + R``** de Windows para encontrar y abrir Msconfig.exe
				2. **Configuración del Sistema:**
				
				    -  Al abrir Msconfig.exe, se muestra la ventana de Configuración del sistema, que contiene varias pestañas:
				      
				        - **General:** Permite configurar el tipo de inicio y otras configuraciones generales.
				        - **Arranque:** Muestra los programas y servicios que se inician durante el inicio de Windows.
				        - **Servicios:** Lista todos los servicios disponibles y permite administrar su inicio automático.
				        - **Inicio:** Muestra programas que se inician automáticamente con cada inicio de sesión del usuario.
				        - **Herramientas:** Proporciona acceso a varias herramientas de diagnóstico y utilidades del sistema.
				
				En Msconfig.exe, puedes elegir entre tres tipos de inicio diferentes:
				
				- **``Normal``:** Carga todos los controladores y servicios según la configuración estándar.
				- **``Con diagnóstico``:** Inicia solo los servicios y controladores básicos necesarios para el funcionamiento del sistema.
				- **``Selectivo``:** Permite al usuario seleccionar qué elementos iniciar durante el arranque, proporcionando mayor control sobre el proceso de inicio.
			-  <strong style ="color: ;">Instrumentación de Administración Windows (WMI)</strong>
			
				La Instrumentación de Administración Windows (WMI) es una herramienta poderosa para administrar y monitorear computadoras remotas en entornos Windows. Aquí tienes una guía detallada sobre su funcionamiento y configuración:
				
				-  **Funcionalidades de WMI**
				
					WMI permite realizar las siguientes tareas:
					
					- **``Recuperación de información``**: Puedes obtener datos detallados sobre componentes de hardware y software de computadoras remotas.
					- **``Estadísticas de hardware y software``**: Proporciona estadísticas precisas sobre el estado y uso de recursos de sistemas remotos.
					- **``Monitoreo del estado``**: Permite monitorear activamente el estado de computadoras remotas para detectar problemas o tendencias.
				-  **Acceso al Control WMI**
				
					Para acceder y configurar WMI desde el Panel de control:
					
					-  **``Abrir administración de equipos``**: Haz doble clic en "Herramientas administrativas" y selecciona "Administración de equipos".
					-  **``Acceder a WMI``**: En la ventana de Administración de equipos, expande "Servicios y aplicaciones" y haz clic derecho en "Control WMI". Selecciona "Propiedades" para abrir la ventana de configuración.
				-  **Configuración de propiedades en WMI**
				
					La ventana de "Propiedades de Control WMI" está organizada en varias fichas importantes:
					
					-  **``General``**: Proporciona un resumen de la información sobre la computadora local y la configuración de WMI.
					-  **``Copia de seguridad y/o restauración``**: Permite realizar copias de seguridad manuales de las estadísticas recopiladas por WMI para garantizar la disponibilidad de datos.
					-  **``Seguridad``**: Permite configurar quién tiene acceso y permisos para consultar y modificar las estadísticas de WMI, asegurando que solo usuarios autorizados puedan interactuar con la información sensible.
					-  **``Opciones avanzadas``**: Permite configurar ajustes avanzados como el espacio de nombres predeterminado para WMI, facilitando una gestión más específica y optimizada.
				
				**Consideraciones de seguridad**
				
				Es crucial implementar medidas estrictas de seguridad al utilizar WMI, ya que su capacidad para realizar tareas administrativas remotas también lo hace susceptible a usos maliciosos:
				
				- **``Ataques potenciales``**: Algunos ataques aprovechan WMI para conectarse a sistemas remotos, modificar registros y ejecutar comandos sin dejar rastro fácilmente detectable en el host remoto.
				- **``Limitación de acceso``**: Se recomienda restringir el acceso a WMI solo a usuarios y sistemas confiables y autorizados. Esto ayuda a mitigar el riesgo de explotación y compromiso del sistema.
	-  **Identidades**
	  
		-  <strong style ="color: ;">Usuarios y dominios locales</strong>
		
			Cuando se configura una nueva computadora o se instala Windows, se crea una cuenta de usuario local que contiene ajustes personalizados, permisos de acceso y ubicaciones de archivos específicas para ese usuario. Además de la cuenta de usuario local estándar, existen dos cuentas adicionales: la cuenta de invitado y la cuenta de administrador, aunque ambas vienen deshabilitadas por defecto por razones de seguridad.
			
			-  **Seguridad y mejores prácticas**
			
				Es crucial seguir las mejores prácticas de seguridad al administrar cuentas de usuario en Windows:
				
				- **``Cuenta de administrador``**: No se recomienda habilitar esta cuenta para el uso diario debido a sus amplios privilegios. Es preferible usar una cuenta estándar y, cuando sea necesario realizar acciones administrativas, ingresar la contraseña de administrador.
				- **``Cuenta de invitado``**: Esta cuenta no requiere contraseña y está diseñada para un uso ocasional o temporario. Sin embargo, por motivos de seguridad, también se recomienda mantenerla deshabilitada a menos que sea estrictamente necesaria.
			-  **Grupos de usuarios y administración**
			
				Windows utiliza grupos para facilitar la administración de permisos. Cada grupo tiene un nombre y un conjunto específico de permisos asociados. Al colocar usuarios en grupos, se les otorgan automáticamente los permisos definidos para ese grupo. Esto simplifica la gestión de permisos y reduce la complejidad de la administración de usuarios individuales.
				
				**``Gestión de grupos``**: Los grupos de usuarios locales se administran mediante la herramienta **``lusrmgr.msc``**, accesible desde el panel de control de Windows. Esta herramienta permite crear, modificar y eliminar grupos, así como gestionar los usuarios que pertenecen a ellos.
			-  **Dominios y controladores de dominio (DC)**
			
				Además de los usuarios locales y grupos, Windows también puede operar dentro de un entorno de dominio. Un dominio es un servicio de red donde todos los usuarios, grupos, computadoras y ajustes de seguridad se almacenan en una base de datos centralizada. Esta base de datos es administrada por controladores de dominio (DC), que regulan la autenticación y los permisos de acceso dentro del dominio.
				
				**``Autenticación en dominio``**: Cada usuario y computadora dentro de un dominio debe autenticarse con el controlador de dominio para iniciar sesión y acceder a los recursos de red. Los ajustes de seguridad definidos por el controlador de dominio se aplican de manera predeterminada a las cuentas de usuario y computadora locales.
	-  **Almacenamiento**
	
		-  <strong style ="color: ;">Flujos de datos alternativos</strong>
		
			Flujos de Datos Alternativos ([[ADS (Alternate Data Stream)]]) en NTFS se exploró cómo NTFS almacena información adicional en archivos mediante los flujos de datos alternativos.
			
			-  **``Definición``:** En NTFS, los archivos se componen de atributos, como el nombre del archivo y marcas de tiempo. El atributo **``$DATA``** almacena los datos principales del archivo. Los flujos de datos alternativos (ADS) permiten conectar información adicional a un archivo existente.
			  
				- **Metadatos de aplicaciones:** Algunas aplicaciones (históricamente más que hoy en día) podían usar ADS para almacenar información adicional relacionada con el archivo que no querían que fuera visible para el usuario o que interfiriera con el contenido principal.
				- **Información de seguridad (Zone.Identifier):** Este es uno de los usos más conocidos y extendidos actualmente. Cuando descargas un archivo de Internet usando un navegador, Windows a menudo añade un ADS llamado `Zone.Identifier` al archivo. Este ADS almacena información sobre la "zona" de seguridad de donde proviene el archivo (por ejemplo, Internet). Windows utiliza esta información para mostrar advertencias de seguridad al abrir el archivo.
				- **Datos ocultos (uso potencial malicioso):** Los atacantes pueden usar ADS para ocultar código malicioso, scripts, o datos dentro de archivos legítimos (como imágenes o archivos de texto) sin que sean detectados fácilmente por el usuario o incluso por algunos programas antivirus antiguos o poco sofisticados, ya que el ADS no afecta el tamaño del archivo principal visible.
				- **Funcionalidades de Windows o de terceros:** Algunas características del sistema operativo o programas instalados pueden usar ADS para almacenar pequeñas cantidades de datos asociados a un archivo para su propio funcionamiento interno.
			-  **``Uso``:** Algunas aplicaciones utilizan ADS para almacenar datos extra, lo cual puede ser útil pero también puede ser aprovechado por el malware para ocultar código malicioso.
		-  <strong style ="color: ;">Sistemas de archivos de OS</strong>
		
			-  **exFAT**
			
				- **``Descripción``:** Sistema de archivos simple compatible con varios sistemas operativos.
				- **``Uso común``:** Adecuado para dispositivos extraíbles como memorias USB y tarjetas SD.
				- **``Limitaciones de FAT``:** FAT16 y FAT32, aunque disponibles, tienen restricciones en particiones y tamaños de archivos.
			-  **Sistema de archivos jerárquico** (HFS+)
			
				- **``Descripción``:** Utilizado en macOS X, permite nombres de archivo largos y tamaños de archivo extensos.
				- **``Compatibilidad``:** Windows puede leer datos de particiones HFS+ pero requiere software especializado para escribir en ellas.
			-  **Sistema de archivos extendido** (EXT)
			
				- **``Descripción``:** Utilizado en sistemas Linux.
				- **``Compatibilidad``:** No nativamente compatible con Windows, pero se pueden leer datos de particiones EXT con software especializado.
			-  **Sistema de archivos de nueva tecnología** (NTFS)
			
				- **``Descripción``:** Sistema de archivos más comúnmente usado en Windows.
				- **``Características``:**
				
					- Soporta archivos y particiones muy grandes.
					- Alta compatibilidad con otros sistemas operativos.
					- Alta fiabilidad y funciones avanzadas de recuperación.
					- Control de acceso mediante descriptores de seguridad.
					- Marca de tiempo (MACE) para registrar actividades de archivos.
					- Soporte para cifrado de archivos para protección de datos.
			
			**Particionamiento y formateo**
			
			-  **``Particionamiento``:** División del disco en áreas lógicas ([[#^RefUnidadLogica|Unidad Lógica]]) antes de aplicar un sistema de archivos.
			-  **``Formateo``:** Proceso de preparar una partición con un sistema de archivos específico.
			-  **``Estructuras importantes en NTFS``:**
			
				- **``Sector de partición de arranque``:** Ubicación de la MFT y copia de seguridad.
				- **``Tabla maestra de archivos`` (MFT):** Registra la localización de todos los archivos y directorios.
				- **``Archivos del sistema``:** Almacenan información sobre volúmenes y atributos de archivos.
				- **``Área de archivos``:** Espacio principal de la partición para almacenar datos.
		-  **ADS (Alternate Data Stream)**
		  
			Un ADS (Alternate Data Stream) es una característica específica del sistema de archivos NTFS (New Technology File System) utilizado en sistemas operativos Windows. Un ADS permite asociar datos adicionales a un archivo existente, los cuales no son visibles ni accesibles directamente a través de las herramientas convencionales del sistema operativo. 
			
			**Características de los ADS:**
			
			-  **Asociación con archivos:** 
			
				Un ADS se asocia con un archivo existente en NTFS. Esto significa que puedes adjuntar datos adicionales a un archivo sin cambiar su tamaño ni afectar su contenido principal.
			-  **Visibilidad limitada:**
			
				Los datos almacenados en un ADS no son visibles mediante comandos estándar como `dir` en la línea de comandos de Windows o a través del Explorador de Archivos. Solo herramientas específicas que conocen y pueden manejar los ADS permiten acceder a estos datos.
			-  **Uso potencial:**
			
				Los ADS pueden ser utilizados legítimamente por algunas aplicaciones para almacenar información adicional sobre un archivo, como metadatos o configuraciones específicas de la aplicación.
			-  **Potencial de mal uso:**
			
				Debido a su naturaleza oculta, los ADS también pueden ser explotados por software malicioso para ocultar datos o código malicioso dentro de archivos legítimos. Esto puede hacer que la detección y eliminación de malware sea más difícil.
			
			**Ejemplo de uso de ADS**:
			
			**Creación de un ADS:** Por ejemplo, usando comandos en la línea de comandos de Windows como `echo`, se puede crear un ADS asociado a un archivo existente:
			
				C:\ADS> echo "Alternate Data Here" > Testfile.txt:ADS
				C:\ADS> dir
				
				 Volume in drive C is Windows
				 Volume Serial Number is A606-CB1B
				 Directory of C:\ADS
				2020-04-28  04:01 PM    ``<DIR>``          .
				2020-04-28  04:01 PM    ``<DIR> ``         ..
				2020-04-28  04:01 PM                 0 Testfile.txt
				               1 File(s)              0 bytes
				               2 Dir(s)  43,509,571,584 bytes free
				               
				C:\ADS> more < Testfile.txt:ADS
				
				"Alternate Data Here"
				
				C:\ADS> dir /r
				
				 Volume in drive C is Windows
				 Volume Serial Number is A606-CB1B
				 Directory of C:\ADS
				2020-04-28  04:01 PM    ``<DIR>``          .
				2020-04-28  04:01 PM    ``<DIR>``          ..
				2020-04-28  04:01 PM                 0 Testfile.txt
				                                    24 Testfile.txt:ADS:$DATA
				               1 File(s)              0 bytes
				               2 Dir(s)  43,509,624,832 bytes free
				C:\ADS>
			
			**Creación de un ADS**
			
			-  **``Verificación de la creación``:  Ejecutando `echo "Alternate Data Here" > Testfile.txt:ADS`, se crea un ADS llamado "ADS" en el archivo "Testfile.txt" con el contenido "Alternate Data Here".**
			
			    - `dir` muestra que el archivo "Testfile.txt" existe, pero el ADS no es visible inicialmente.
			    - `more < Testfile.txt:ADS` muestra el contenido del ADS.
			    - `dir /r` muestra todos los flujos de datos alternativos con el switch `/r` en el comando `dir`.
			-  **``Visibilidad limitada``:** Después de crear un ADS de esta manera, al usar el comando `dir` en la carpeta que contiene `archivo.txt`, no se mostrará el ADS creado. Para listar todos los ADS de un archivo, se puede usar el comando `dir /r`.
			
			**Consideraciones de seguridad**:
			
			**Monitoreo y gestión:** Es importante monitorear y gestionar los ADS en sistemas NTFS para evitar su mal uso y asegurar que no se estén utilizando de manera no autorizada para ocultar información sensible o código malicioso.
	-  **Windows Subsystem Linux**
	
		-  **Diferencias entre registros de logs en WSL y Linux**
		
			WSL utiliza principalmente systemd para el registro, y los registros de systemd se almacenan de manera diferente a las distribuciones tradicionales de Linux. Esto es lo que puedes comprobar en su lugar:
			
			**``Registros registrados``:** WSL utiliza el registro registrado de systemd. Puede acceder a estos registros mediante el comando `journalctl `. Puede contener información similar a la que encontraría en `/var/log/auth.log` en sistemas Linux tradicionales.
			
			Aquí hay un comando de ejemplo para ver registros de autenticación recientes: `journalctl | grep -i auth`. Esto mostrará entradas que contienen la palabra "auth" (no distingue entre mayúsculas y minúsculas) que pueden ser relevantes para los intentos de autenticación.








































