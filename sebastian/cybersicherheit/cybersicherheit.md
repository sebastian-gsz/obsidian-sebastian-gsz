
-  **[Task ](kanban-cybersicherheit.md)**
-  **Enlaces**

	-  **Internos**
	
		- **[[certification-x.509]]**
		- **[[developer-security-operations]]**
		- 
	-  **Externos**

		- **Tools**

			-  **Defensa**
			
				-  **Defensa gestión de vulnerabilidades**
				
					- **[[GFI LanGuard]]**
			-  **Pentesting**

				-  **Penetración All**
				  
					-  **[Hacktricks Tools ](https://tools.hacktricks.wiki/)**
				-  **Penetración Web**
				
					- **[[Acunetix]]**
				-  **Penetración PowerShell**
				
					- **[[Nishang]]**
				-  **Penetración Networking**
				
					- **[[TCPDump - Interceptar tráfico de red (Sniffing)|TCPDump - Interceptar tráfico de red (Sniffing)]]**
					- **[[Protocolo nslookup - Interceptar en bucle]]**
		-  **Learning**
		
			-  **[[trash-learning#uhm-learn-1|Ruta SOC-1]]**
			-  **[Hacktricks ](https://hacktricks.wiki/en/index.html)**
			
				-  **[Hacktricks Cloud ](https://cloud.hacktricks.wiki/es/index.html)**
		-  **[Hunter for Google ](https://bughunters.google.com/)**


> [!NOTE]
> Si conoces al enemigo y te conoces a ti mismo,
> no temas el resultado de cien batallas;
> si te conoces a ti mismo, pero no conoces al enemigo,
> por cada batalla ganada perderás otra.
> 
> — El arte de la guerra, Sun Tzu

![[barra.gif]]
-  **Tareas**

	-  **Learning**
	
		- [ ] **``Explorar``: [CheatSheet Hacking ](https://github.com/beafn28/Cheatsheet-Hacking?tab=readme-ov-file)**
		- [ ] **``Explorar``: [IOC ](https://threatfox.abuse.ch/browse/) y su implementación en un ``WAF``**.
		- [ ] **[Sistemas Windows: ](https://blog.talosintelligence.com/exploring-malicious-windows-drivers-part-1-introduction-to-the-kernel-and-drivers/)explotación de controladores**
		
			Procesos, subprocesos, el registro y archivos comunes del sistema, junto con experiencia o familiaridad con desensambladores y programación en C o C++. En el futuro, puede ser ventajoso adquirir experiencia con el lenguaje de programación Rust, ya que Microsoft ha comenzado lentamente a migrar partes del kernel de Windows 11 a Rust.
		- [ ] **Implementar interfaz X11 a través de WSL: `apt-get install x11-xkb-utils`**
		- [ ] **Como auditar archivos en ``VirusTotal``**
	-  **Learning ML**
	
		- [ ] **[Uso de LLM como compañero de ingeniería inversa ](https://blog.talosintelligence.com/using-llm-as-a-reverse-engineering-sidekick/)**
	-  **Learning Software**
	
		- [ ] **`Acunetix`**
		
			**Acunetix es un escáner de seguridad para aplicaciones web que automatiza la detección y corrección de vulnerabilidades en sitios web, APIs y servicios web.**
		- [ ] **[Decodificador ](https://github.com/s0md3v/Decodify)**
		- [ ] **``Cisco Talos``**
		- [ ] **Aprender ==Fase de reconocimiento==**
		
			- [ ] **Escaneo de puertos**
			
				- [ ] **Nmap**
				- [ ] **Masscan**
				- [ ] **Zmap**
				- [ ] **Netcat**
				- [ ] **Naabu**
				- [ ] **Rutscan**
				- [ ] **Masscan**
			- [ ] **Enumeración de subdominios**
			
				- [ ] **Subfinder**
				- [ ] **Altdns**
				- [ ] **DNSRecon**
				- [ ] **Amass**
			- [ ] **Enumeración de direcciones**
			
				- [ ] **Sublist3r**
				- [ ] **Gobuster**
				- [ ] **Dirb**
				- [ ] **Dirsearch**
				- [ ] **DirBuster**
			- [ ] **Perfil tecnológicos**
			
				- [ ] **BuiltWith**
				- [ ] **Wappalyzer**
				- [ ] **Ffut**
				- [ ] **Netcraft**
				- [ ] **What CMS**
			- [ ] **Detección de vulnerabilidades**
			
				- [ ] **Nmap**
				- [ ] **Burp Suite**
				- [ ] **Nessus**
				- [ ] **Metasploit**
				- [ ] **OpenVAS**
				- [ ] **Nexpose**
				- [ ] **SQLmap**
				- [ ] **Frontline**
				- [ ] **Nikto**
		- [ ] **Aprender ==Fase de explotación==**
		
			- [ ] **Bypass**
			
				- [ ] **Set (Social-Enginner Toolkit)**
				- [ ] **Bettercap**
				- [ ] **Veil**
				- [ ] **Evilginx2**
				- [ ] **Bypass-firewalls-by-DNS-history**
			- [ ] **Ataque web y post-autenticación**
			
				- [ ] **Cookie Cadger**
				- [ ] **Wifite**
				- [ ] **Responder**
				- [ ] **CrackMapExec**
				- [ ] **CSRFTester**
			- [ ] **Elevación y persistencia**
			
				- [ ] **Mimikatz**
				- [ ] **BeEF**
				- [ ] **Shellter**
				- [ ] **Empire**
				- [ ] **PowerSploit**
				- [ ] **RINKU**
			- [ ] **Ataques de inyección y fuerza bruta**
			
				- [ ] **SQLmap**
				- [ ] **Hydra**
				- [ ] **OWASP ZAP**
				- [ ] **Burp Suite**
				- [ ] **John the Ripper**
			- [ ] **Explotación de vulnerabilidades**
			
				- [ ] **Metasploit**
				- [ ] **OpenVAS**
				- [ ] **Searchsploit**
				- [ ] **Nikto**
				- [ ] **Nessus**
		- [ ] **Aprender ==Fase de Post-Explotación==**
		
			- [ ] **Borrado de huellas**
			
				- [ ] **Syslog-ng**
				- [ ] **Sysmon**
				- [ ] **Log2timeline**
				- [ ] **Windows Event Log Clear**
			- [ ] **Exfiltración de datos**
			
				- [ ] **LaZagne**
				- [ ] **SCP/SFTP**
				- [ ] **Nishang**
				- [ ] **DnsExfiltrator**
				- [ ] **Magic Unicorn**
			- [ ] **Escalada de privilegios**
			
				- [ ] **BloodHound**
				- [ ] **PsExec**
				- [ ] **Linux-enum**
				- [ ] **Windows-Exploit-Suggester**
				- [ ] **Pass-the-Hash Toolkit**
				- [ ] **Linux Priv Check**
			- [ ] **Monitorización de procesos y tareas**
			
				- [ ] **Tasklist**
				- [ ] **At**
				- [ ] **ProcMon**
				- [ ] **Pspy**
				- [ ] **Crontab**
			- [ ] **Consolidación de acceso**
			
				- [ ] **Mimikatz**
				- [ ] **Veil-Evasion**
				- [ ] **Pupy**
				- [ ] **QuasarRAT**
				- [ ] **PowerShell Empire**
				- [ ] **Meterpreter**
		- [ ] **Aprender ==OSINT==**
		
			- [ ] **Maltego (herramienta)**
			- [ ] **Shodan (motor de búsqueda)**
			- [ ] **TheHarvester (herramienta de descubrimiento de correo electrónico)**
			- [ ] **Reconocimiento (herramienta)**
			- [ ] **Censys (motor de búsqueda)**
			- [ ] **Google Dorks (técnica)**
			- [ ] **OSINT Framework (plataforma en línea)**
			- [ ] **Infoga (herramienta de recopilación de información)**
			- [ ] **PhoneInfoga (herramienta de recopilación de información de números de teléfono)**
		- [ ] **Aprender ==Monitoreo de red==**
		
			- [ ] **Splunk**
			- [ ] **Snort**
			- [ ] **Yara**
			- [ ] **Suricata**
			- [ ] **Monitoreo de seguridad**
			
				- [ ] **Kibana**
				- [ ] **Logstash**
				- [ ] **Phising**
				- [ ] **Catcher**
			- [ ] **Sysmon-Search**
		- [ ] **Aprender ==Descifradores de contraseñas==**
		
			- [ ] **Instalar y documentar ``Ophcrack``**
			- [ ] **Instalar y documentar ``L0phtCrack``**
			- [ ] **Instalar y documentar ``THC Hydra``**
			- [ ] **Instalar y documentar ``RainbowCrack``**
			- [ ] **Instalar y documentar ``Medusa``**
		- [ ] **Aprender ==Hacking inalámbrico==**
		
			- [ ] **Instalar y documentar ``Aircrack-ng``**
			- [ ] **Instalar y documentar ``Kismet``**
			- [ ] **Instalar y documentar ``InSSIDer``**
			- [ ] **Instalar y documentar ``KisMAC``**
			- [ ] **Instalar y documentar ``Firesheep``**
			- [ ] **Instalar y documentar ``NetStumbler``**
		- [ ] **Aprender ==Escaneo y piratería de red==**
		
			- [ ] **Instalar y documentar ``nmap``**
			
				- [ ] **Aprender [nmap ](https://nmap.org/) y explotación con vulns**
			- [ ] **Instalar y documentar ``SuperScan``**
			- [ ] **Instalar y documentar `Angry IP Scanner`**
			- [ ] **Instalar y documentar `NetScanTools`**
		- [ ] **Aprender ==Elaboración de paquetes==**
		
			- [ ] **Instalar y documentar ``Hping``**
			- [ ] **Instalar y documentar ``Scapy``**
			- [ ] **Instalar y documentar ``Socat``**
			- [ ] **Instalar y documentar ``Netcat``**
			- [ ] **Instalar y documentar ``Nping``**
			- [ ] **Instalar y documentar ``Nemesis``**
		- [ ] **Aprender ==Rastreadores de paquetes==**
		
			- [ ] **Instalar y documentar ``Wireshark``**
			- [ ] **Instalar y documentar ``Tcpdump``**
			- [ ] **Instalar y documentar ``Ettercap``**
			- [ ] **Instalar y documentar ``Dsniff``**
			- [ ] **Instalar y documentar ``EtherApe``**
			- [ ] **Instalar y documentar ``Paros``**
			- [ ] **Instalar y documentar ``Fiddler``**
			- [ ] **Instalar y documentar ``Ratproxy``**
			- [ ] **Instalar y documentar ``SSLstrip``**
		- [ ] **Aprender ==Detectores de rootkits==**
		
			- [ ] **Instalar y documentar ``AIDE``**
			- [ ] **Instalar y documentar ``Netfilter``**
			- [ ] **Instalar y documentar ``PF: OpenBSD Packet Filter``**
		- [ ] **Aprender ==Fuzzers para buscar vulnerabilidades==**
		
			- [ ] **Instalar y documentar ``Skipfish``**
			- [ ] **Instalar y documentar ``Wapiti``**
			- [ ] **Instalar y documentar ``W3af``**
		- [ ] **Aprender ==Herramientas forenses==**
		
			- [ ] **Instalar y documentar ``Sleuth``**
			- [ ] **Instalar y documentar ``Kit``**
			- [ ] **Instalar y documentar ``Helix``**
			- [ ] **Instalar y documentar ``Mallego``**
			- [ ] **Instalar y documentar ``Encase``**
		- [ ] **Aprender ==Depuradores==**
		
			- [ ] **Instalar y documentar ``GDB``**
			- [ ] **Instalar y documentar ``WinDbg``**
			- [ ] **Instalar y documentar ``IDA Pro``**
			- [ ] **Instalar y documentar ``Immunity Debugger``**
		- [ ] **Aprender ==Encriptación==**
		
			- [ ] **Instalar y documentar ``VeraCrypt``**
			- [ ] **Instalar y documentar ``CipherShed``**
			- [ ] **Instalar y documentar ``Open SSH``**
			- [ ] **Instalar y documentar ``OpenSSL``**
			- [ ] **Instalar y documentar ``OpenVPN``**
			- [ ] **Instalar y documentar ``Stunnel``**
		- [ ] **Aprender ==Explotación de vulnerabilidades==**
		
			- [ ] **Instalar y documentar ``Metasploit``**
			- [ ] **Instalar y documentar ``Core Impact``**
			- [ ] **Instalar y documentar ``Sqlmap``**
			- [ ] **Instalar y documentar ``Social Engineer Toolkit``**
			- [ ] **Instalar y documentar ``Netsparker``**
		- [ ] **Aprender ==Escáneres de vulnerabilidades==**
		
			- [ ] **Instalar y documentar ``Nipper``**
			- [ ] **Instalar y documentar ``Securia PSI``**
			- [ ] **Instalar y documentar ``Core Impact``**
			- [ ] **Instalar y documentar ``Nessus``**
			- [ ] **Instalar y documentar ``SAINT``**
			- [ ] **Instalar y documentar ``Open VAS**
-  **Adiestramiento**

	- **[[Wargames]]**
	- **[[PortSwigger]]**
	- **[[Linux system]]**
	- **[[TheBridge Cybersicherheit]]**
	- 
![[Barra.gif]]
-  **General**

	-  **[[developer-security-operations|DevSecOps]]**
	-  **Ocho dominios de seguridad**
	
		-  **``Seguridad y gestión de riesgos``**: Este dominio se centra en definir metas de seguridad, mitigación de riesgos, cumplimiento, continuidad del negocio y la ley. Por ejemplo, actualizar políticas ante cambios en regulaciones como **HIPAA**.
		
			- **``Definición de metas y objetivos de seguridad``**: Las organizaciones deben identificar sus activos y datos críticos y establecer metas y objetivos de seguridad para protegerlos.
			- **``Mitigación de riesgos``**: Las organizaciones deben implementar controles de seguridad para mitigar los riesgos a los que están expuestos sus activos y datos críticos como PII.
			- **``Cumplimiento``**: Las organizaciones deben cumplir con las leyes y regulaciones aplicables para proteger sus activos y datos.
			- **``Continuidad del negocio``**: Las organizaciones deben tener planes de recuperación ante desastres para garantizar que puedan continuar operando en caso de un incidente de seguridad.
			- **``Ética``**: Las organizaciones deben seguir las reglas y expectativas de comportamiento ético para minimizar la negligencia, el abuso o el fraude
		-  **``Seguridad de activos``**: Se enfoca en proteger activos físicos y digitales, incluyendo el almacenamiento, retención y destrucción de datos. Una tarea común es asegurar que el equipo viejo, se destruyan adecuadamente.
		  
			-  **``Controles de acceso``**: Estos controles limitan quién puede acceder a los activos.
			-  **``Encriptación``**: Esta tecnología protege los datos al convertirlos en texto ilegible. Las organizaciones también necesitan tener políticas y procedimientos que aseguren que los datos se almacenen, mantengan, retengan y destruyan adecuadamente.
			-  **``Seguridad física``**: Estas medidas protegen los activos físicos de daños o robo.
			-  **``Educación y formación``**: Estas actividades ayudan a los empleados a comprender los riesgos de seguridad y cómo protegerse.
			
				También está relacionado con el almacenamiento, mantenimiento, retención y destrucción de datos. Esto significa que activos como PII o SPII deben manejarse y administrarse de forma segura protegiendo ya sea almacenado en una computadora, transferido a través de una red como Internet, o incluso recopilados físicamente.
		-  **``Arquitectura e ingeniería de seguridad``**: Se centra en optimizar la seguridad de los datos mediante sistemas y procesos. Esto incluye tareas como configurar correctamente un **firewall** para monitorear y filtrar el tráfico de red.
		
			-  **``Seguridad de la red``**: Esta tecnología protege las redes de ataques.
			-  **``Seguridad del sistema operativo``**: Esta tecnología protege los sistemas operativos de ataques.
			-  **``Seguridad de las aplicaciones``**: Esta tecnología protege las aplicaciones de ataques.
			-  **``Seguridad de la base de datos``**: Esta tecnología protege las bases de datos de ataques.
			-  **``Seguridad de la nube``**: Esta tecnología protege los datos almacenados en la nube de ataques.
			
				Este dominio incluye la planificación, el diseño, la implementación y la evaluación de sistemas y procesos de seguridad. Uno de los conceptos centrales de la arquitectura de diseño seguro es la responsabilidad compartida. Esto significa que todos los individuos dentro de una organización deben asumir un papel activo en la reducción del riesgo y el mantenimiento de la seguridad.
		-  **``Seguridad de redes y comunicaciones``**: Protege las redes físicas e inalámbricas. Un analista podría identificar usuarios conectándose a puntos de acceso no seguros y crear políticas para mitigar esa exposición.
		
			-  **``Seguridad de la red``**: Esta tecnología protege las redes de ataques.
			-  **``Seguridad inalámbrica``**: Esta tecnología protege las redes inalámbricas de ataques.
			-  **``Seguridad de los dispositivos móviles``**: Esta tecnología protege los dispositivos móviles de ataques.
			-  **``Seguridad de la nube``**: Esta tecnología protege los datos almacenados en la nube de ataques.
			
				A continuación, se presentan algunos consejos adicionales para mejorar la seguridad de las redes y las comunicaciones:
				
				- Utilice contraseñas seguras y únicas para cada dispositivo y cuenta.
				- Actualice el software y el firmware con regularidad.
				- Instale un software antivirus y antimalware de buena reputación.
				- Habilite la autenticación multifactor (MFA) siempre que sea posible.
				- Use un firewall para proteger su red de ataques.
				- Escanee su red regularmente en busca de vulnerabilidades.
				- Educar a los empleados sobre los riesgos de seguridad y cómo protegerse.
		-  **``Gestión de identidades y accesos`` (IAM)**: Gestiona usuarios y sus niveles de acceso a recursos. Un ejemplo práctico es la configuración de sistemas de acceso físico mediante tarjetas para los empleados.
		  
			- La identificación es cuando un usuario verifica quién es proporcionando un nombre de usuario, una tarjeta de acceso o datos biométricos como una huella digital.
			- La autenticación es el proceso de verificación para demostrar la identidad de una persona. Esto puede hacerse mediante una contraseña, un PIN, una huella digital o una combinación de estos factores.
			- La autorización se produce después de que se haya confirmado la identidad del usuario y se relaciona con su nivel de acceso. Esto depende del rol del usuario en la organización.
			- La rendición de cuentas se refiere al seguimiento y registro de las acciones de los usuarios. Esto ayuda a garantizar que los sistemas y los datos se utilizan correctamente.
		-  **``Evaluación y pruebas de seguridad``**: Se centra en realizar auditorías y pruebas de control para monitorear vulnerabilidades. Por ejemplo, auditar periódicamente los permisos de acceso para evitar que personal no autorizado.
		  
			Esto implica examinar las metas y objetivos de la organización, y evaluar si los controles que se utilizan realmente logran esos objetivos. Recopilar y analizar datos de seguridad periódicamente también ayuda a prevenir amenazas y riesgos para la organización.  
			
			- Utilice contraseñas seguras y únicas para cada cuenta.
			- Habilite la autenticación multifactor (MFA) siempre que sea posible.
			- Implemente un proceso de aprobación de acceso para los usuarios nuevos o modificados.
			- Revise regularmente los privilegios de los usuarios para asegurarse de que solo tienen acceso a los datos y sistemas que necesitan.
			- Realice auditorías de seguridad para identificar y corregir las vulnerabilidades.
		-  **``Operaciones de seguridad``**: Enfocado en investigaciones y medidas preventivas. Ante la alerta de un dispositivo desconocido conectado a la red interna, se deben seguir procedimientos para detener la amenaza rápidamente.
		  
			Si hay un ataque activo, mitigar el ataque e impedir que se agrave aún más es esencial para garantizar que la información privada esté protegida de los actores amenazantes.
			
			- La investigación de incidentes comienza una vez que se ha identificado un incidente de seguridad. El objetivo de la investigación es determinar la causa del incidente, el alcance de los daños y las acciones que se deben tomar para mitigar el riesgo.
			- La respuesta a incidentes es el proceso de tomar medidas para detener un incidente de seguridad en curso y minimizar el daño. Las acciones de respuesta a incidentes pueden incluir la implementación de controles de seguridad, la restauración de datos y la notificación a las autoridades.
			- Las medidas preventivas son las acciones que se toman para evitar que se produzcan incidentes de seguridad. Las medidas preventivas pueden incluir la implementación de controles de seguridad, la formación de empleados y la concienciación sobre la seguridad.
		-  **``Seguridad en el desarrollo de software``**: Promueve prácticas de codificación segura en el ciclo de vida del software. Un analista puede asesorar a equipos de desarrollo sobre políticas de contraseñas y gestión segura de datos.
		
			- La seguridad del diseño se centra en la identificación y eliminación de vulnerabilidades de seguridad en el diseño de un producto de software. Esto puede hacerse mediante la revisión de los requisitos y el diseño del producto por parte de expertos en seguridad.
			- La seguridad del código se centra en la identificación y corrección de vulnerabilidades de seguridad en el código fuente de un producto de software. Esto puede hacerse mediante la realización de revisiones de código por parte de expertos en seguridad o mediante el uso de herramientas de análisis de código.
			- La seguridad de la implementación se centra en la configuración y el despliegue seguros de un producto de software. Esto puede hacerse mediante la implementación de controles de seguridad y la capacitación de los usuarios sobre cómo utilizar el producto de software de forma segura.
	-  **Marcos y controles de seguridad**
	
		Como analista, utilizas marcos y controles para evitar que las alertas se conviertan en incidentes graves. Su propósito es proteger la **PII** (Información de Identificación Personal), asegurar datos financieros, gestionar riesgos y alinear la ciberseguridad con los objetivos comerciales.
		
		-  **Componentes del marco de seguridad**
		
			Los marcos permiten gestionar riesgos mediante cuatro pilares:
			
			-  **Identificar y documentar objetivos**: Definir metas como la alineación con leyes de privacidad.
			-  **Establecer directrices**: Crear las reglas y políticas para alcanzar dichos objetivos.
			-  **Implementar procesos fuertes**: Diseñar procedimientos técnicos y operativos (ej. gestión de solicitudes de datos).
			-  **Seguimiento y comunicación**: Monitorear resultados e informar sobre el estado de cumplimiento.
			-  **``Controles``:** Los controles se utilizan junto con marcos para reducir la posibilidad y el impacto de una amenaza, riesgo o vulnerabilidad de seguridad. Pueden ser físicos, técnicos y administrativos, y normalmente se utilizan para prevenir, detectar o corregir problemas de seguridad.
			
			    - **Ejemplos de controles físicos:** Portones, vallas, cerraduras, guardias de seguridad, circuito cerrado de televisión (CCTV), cámaras de vigilancia, detectores de movimiento y tarjetas de acceso o credenciales para ingresar a espacios de oficina.
			    - **Ejemplos de controles técnicos:** Cortafuegos (Firewalls), MFA (Autenticación Multifactor) y software antivirus.
			    - **Ejemplos de controles administrativos:** Separación de tareas, procesos de autorización y clasificación de activos.
		-  **Controles de seguridad**
		
			Son salvaguardias diseñadas para reducir riesgos específicos. Pueden ser técnicos (firewalls), administrativos (capacitación a empleados) o físicos (cerraduras). El uso de software para rastrear el cumplimiento de estos controles garantiza que la organización mantenga un perfil de riesgo bajo.
		-  **Frameworks y estándares globales**
		
			-  **``NIST CSF``**: Es un conjunto de directrices y mejores prácticas que se utiliza para gestionar y mejorar la ciberseguridad de una organización. El NIST CSF (**Marco de ciberseguridad del instituto nacional de estándares y tecnología**) promueve un enfoque basado en la gestión de riesgos, evaluando y priorizando los riesgos cibernéticos en función de su impacto y probabilidad para asignar recursos de manera efectiva. Fue creado en respuesta a la creciente necesidad de las organizaciones de proteger sus activos de información. Sus funciones principales son:
			
				- **Identificar**: Comprender y gestionar los riesgos cibernéticos, incluyendo la identificación de activos, evaluación de vulnerabilidades y gestión de amenazas.
				- **Proteger**: Implementar medidas de seguridad para proteger los activos de información y garantizar la privacidad.
				- **Detectar**: Establecer sistemas y procesos para la detección temprana de amenazas cibernéticas.
				- **Responder**: Desarrollar planes de respuesta efectivos en caso de incidentes de seguridad cibernética.
				- **Recuperarse**: Establecer procesos de recuperación para garantizar la continuidad de las operaciones después de un incidente.
			- **``ISO*`` (General)**: Establece estándares internacionales para mejorar procesos de fabricación, tecnología y gestión.
			
				- **``ISO 27001``**: Un marco utilizado y reconocido internacionalmente es ISO/IEC 27001 (**Organización Internacional de Normalización/Comisión Electrotécnica Internacional**). La familia de normas ISO 27000 permite a organizaciones de todos los sectores y tamaños gestionar la seguridad de activos, como información financiera, propiedad intelectual, datos de empleados e información confiada a terceros. Este marco describe los requisitos para un sistema de gestión de seguridad de la información, las mejores prácticas y los controles que respaldan la capacidad de una organización para gestionar los riesgos. Aunque el marco ISO/IEC 27001 no requiere el uso de controles específicos, sí proporciona una colección de controles que las organizaciones pueden utilizar para mejorar su postura de seguridad.
			- **``CIS®`` (Center for Internet Security)**: Proporciona controles críticos procesables para defender sistemas y responder a incidentes.
			-  **``Open Web Application Security Project`` (OWASP)**
			
				- **Minimizar la superficie de ataque**: Reducir el número de vulnerabilidades potenciales que un atacante podría explotar desactivando funciones de software innecesarias o restringiendo el acceso a ciertos activos. **Ejem**: Una organización podría desactivar funciones de software que no se utilizan o restringir el acceso a ciertos archivos.
				- **Privilegio mínimo**: Otorgar a los usuarios solo los permisos que necesitan para realizar sus tareas cotidianas para reducir el daño de una brecha. **Ejem**: Una organización podría implementar políticas que requieran contraseñas largas y complejas.
				- **Defensa en profundidad**: Implementar múltiples controles de seguridad que aborden los riesgos de diferentes maneras para dificultar una violación. **Ejem**: Una combinación de firewalls, autenticación multifactor y análisis de tráfico.
				- **Separación de funciones**: Dividir las responsabilidades de manera que una sola persona no pueda realizar actividades fraudulentas o ilegales. **Ejem**: Dividir la responsabilidad de la aprobación de pagos entre dos personas.
				- **Mantener la seguridad simple**: Evitar soluciones innecesariamente complicadas que sean difíciles de administrar o dificulten la colaboración. **Ejem**: Utilizar controles de seguridad que sean fáciles de entender y administrar.
				- **Resolver los problemas de seguridad correctamente**: Identificar la causa raíz de un incidente y corregir cualquier vulnerabilidad identificada. **Ejem**: Investigar un incidente de seguridad para identificar la causa raíz y aplicar la corrección definitiva.
		-  **Frameworks de cumplimiento y regulaciones específicas**
		
			- **GDPR (RGPD)**: Protege la privacidad de residentes de la UE. Exige notificar brechas de datos en un máximo de **72 horas**.
			- **PCI DSS**: Estándar internacional para organizaciones que manejan tarjetas de crédito; su fin es reducir el fraude bancario.
			- **HIPAA**: Ley de EE. UU. para proteger datos de salud (PHI). Se apoya en el marco **HITRUST®** para su implementación.
			- **FedRAMP®**: Estandariza la seguridad para servicios en la nube utilizados por el gobierno federal de EE. UU.
			- **SOC 1 y SOC 2**: Informes sobre controles internos (financieros y de seguridad/privacidad) en distintos niveles organizacionales.
			- **FERC-NERC**: Regulaciones críticas para la infraestructura eléctrica y red eléctrica en Norteamérica (estándares CIP).
		
		**Consejo profesional:** La normativa evoluciona constantemente. Para mantener esta documentación actualizada, te sugiero investigar e integrar próximamente la **Ley Gramm-Leach-Bliley (GLBA)** para instituciones financieras y la **Ley Sarbanes-Oxley (SOX)** para transparencia corporativa.
	-  **Auditorías de seguridad interna**
	
		-  **Establecer el alcance y los objetivos**
		
			El alcance de una auditoría de seguridad interna se refiere a los criterios específicos de la misma. Requiere que las organizaciones identifiquen personas, activos, políticas, procedimientos y tecnologías que podrían impactar la postura de seguridad. Los objetivos son un esquema de lo que la organización desea lograr para mejorar dicha postura.
			
			- **Alcance de la auditoría:** Implica evaluar los permisos de los usuarios, identificar controles, políticas y procedimientos, y contabilizar la tecnología actualmente utilizada por la organización.
			- **Objetivos descritos:** Incluyen implementar funciones básicas de marcos de trabajo, establecer políticas y procedimientos para garantizar el cumplimiento y fortalecer los controles del sistema.
		-  **Realizar una evaluación de riesgos**
		
			Se centra en identificar amenazas, riesgos y vulnerabilidades potenciales para considerar qué medidas de seguridad deben implementarse y monitorearse.
			
			**Hallazgos comunes:** La evaluación puede destacar controles inadecuados o falta de procesos para proteger activos. En casos específicos, puede revelar falta de gestión de activos físicos y digitales (incluyendo equipos de empleados) y acceso a información privada en la red interna que requiere controles más sólidos.
			
			**Evaluación de controles**
			
			Consiste en revisar los controles existentes para garantizar su efectividad, clasificándolos en tres categorías:
			
			- **Controles administrativos:** Relacionados con el componente humano. Incluyen políticas y procedimientos de gestión de datos, como la implementación de políticas de contraseñas.
			- **Controles técnicos:** Soluciones de hardware y software como sistemas de detección de intrusos (IDS) y cifrado.
			- **Controles físicos:** Medidas para prevenir el acceso físico a activos, como cámaras de vigilancia y cerraduras.
			
			**Evaluación de cumplimiento**
			
			Implica determinar si la organización cumple con las normas necesarias (leyes, regulaciones o requisitos específicos) para garantizar que los datos privados permanezcan seguros.
			
			**Comunicación de resultados**
			
			Una vez completada la auditoría, los resultados y recomendaciones deben comunicarse a las partes interesadas. El informe suele incluir:
			
			1. Resumen del alcance y objetivos.
			2. Lista de riesgos existentes.
			3. Análisis de cumplimiento.
			4. Recomendaciones para mejorar la postura de seguridad.
		-  **Caso de estudio: Botium Toys**
		
			**Informe de alcance, objetivos y evaluación de riesgos**
			
			Botium Toys es una pequeña empresa estadounidense de juguetes con sede física única, pero con una presencia en línea creciente que atrae clientes internacionales. Su departamento de TI busca realizar una auditoría interna para asegurar la infraestructura y mitigar riesgos mientras la empresa crece, asegurando el cumplimiento en pagos en línea y negocios en la Unión Europea (UE).
			
			**Contexto de la auditoría:** La gerente de TI aplica el Marco de Ciberseguridad (CSF) del NIST para establecer la base de la auditoría y utilizar los resultados como prueba para solicitar la expansión de su departamento.
			
			**Correo electrónico de la Gerente de TI:**
			
			-  **Objetivos principales:**
			
			    - Mejorar la postura de seguridad actual alineándola con mejores prácticas (NIST CSF, permisos mínimos).
			    - Proporcionar recomendaciones de mitigación basadas en riesgos actuales.
			    - Identificar normativas de cumplimiento según la ubicación del negocio y el método de aceptación de pagos.
			-  **Riesgos identificados:**
			
			    - Gestión inadecuada de los activos.
			    - Inexistencia de controles adecuados.
			    - Posible incumplimiento de normativas estadounidenses e internacionales.
			    - **Puntuación de riesgo actual:** 8/10 (alta).
			
			**Preguntas críticas para el análisis:**
			
			1. ¿Cuáles son los mayores riesgos para la organización?
			2. ¿Qué controles son más esenciales implementar de inmediato?
			3. ¿Qué normativas de cumplimiento debe cumplir Botium Toys (ej. GDPR, PCI DSS)?
			
			![[informe-alcance-objetivos-evaluación-de-riesgos.docx]]
		-  **Haz sonar la alarma**
		
			-  **Introducción al ciclo de vida de la respuesta a incidentes**
			
				Detección, respuesta y recuperación. Como analista de seguridad, serás el responsable de detectar y responder a incidentes, implementando las acciones necesarias para la recuperación.
				
				**El ciclo de vida de respuesta a incidentes del NIST nos brinda una guía invaluable para navegar este proceso.** Este ciclo no es lineal, sino que se asemeja a un ciclo que se repite y se adapta a medida que se descubren nuevos detalles.
				
				**Antes de adentrarnos en las fases de detección y respuesta, es fundamental comprender qué es un incidente de seguridad.** Según el NIST, se define como "un suceso que inminentemente pone en peligro, sin autoridad legal, la confidencialidad, integridad o disponibilidad de información o un sistema de información; o constituye una violación o amenaza inminente de violación de la ley, políticas o procedimientos de seguridad, o políticas de uso aceptable".
				
				**Es importante diferenciar entre eventos e incidentes.** Un evento es cualquier suceso observable en una red, sistema o dispositivo. Por ejemplo, un usuario que inicia sesión en su cuenta de correo electrónico y olvida su contraseña, restableciéndola con éxito. Este es un evento observable, registrado por los sistemas y aplicaciones, pero no representa un incidente de seguridad, ya que no se violaron las políticas de seguridad.
				
				**En cambio, si un agente de amenaza intentara acceder a la misma cuenta, cambiar la contraseña y tener éxito, esto sí sería tanto un evento como un incidente de seguridad.** El evento es observable, pero además viola las políticas de seguridad y representa un acceso ilegal a la cuenta.
				
				**Al igual que un detective investiga un caso, un analista de seguridad debe recopilar y documentar cuidadosamente las pruebas y hallazgos durante la investigación de un incidente.** Esta investigación busca responder a las cinco W: quién (who), qué (what), cuándo (when), dónde (where) y por qué (why) ocurrió el incidente.
				
				**El seguimiento de esta información es crucial durante la investigación y posterior a ella, a la hora de elaborar el informe final.** 
			-  <strong style ="color: ;">Roles en respuesta</strong> 
			
				Estructura y responsabilidades de los equipos de respuesta a incidentes (CSIRT) y Centros de Operaciones de Seguridad (SOC), piezas fundamentales para la gestión eficaz de incidentes de seguridad.
				
				**Mando, control y comunicación: pilares de la respuesta efectiva**
				
				- **``Mando``:** Liderazgo claro y dirección precisa para supervisar las acciones del equipo.
				- **``Control``:** Capacidad para gestionar los aspectos técnicos, como la coordinación de recursos y la asignación de tareas.
				- **``Comunicación``:** Flujo de información transparente para mantener informadas a todas las partes interesadas.
				
				**Estructura organizativa del CSIRT**
				
				Un CSIRT bien estructurado, con roles y funciones claramente definidos, permite una respuesta ágil y eficiente. La estructura puede variar según la organización, pero comúnmente encontramos:
				
				-  **Analista de seguridad:**
				
					- Monitorea el entorno en busca de amenazas.
					- Analiza y clasifica alertas.
					- Investiga las causas raíz de los incidentes.
					- Notifica a los superiores o resuelve las alertas según corresponda.
				-  **Responsable técnico:**
				
					- Lidera la parte técnica de la respuesta a incidentes.
					- Determina la causa raíz del incidente.
					- Desarrolla e implementa estrategias para contener, erradicar y recuperar los sistemas afectados.
					- Colabora con otros equipos para alinear las prioridades de respuesta con las del negocio.
				-  **Coordinador de incidentes:**
				
					- Facilita la colaboración interdisciplinaria durante el incidente.
					- Mantiene abiertas las líneas de comunicación e informa al personal sobre el estado del incidente.
					- Coordina las tareas con los departamentos pertinentes.
				
				**Otros roles:**
				
				- Responsable de comunicación: gestiona la comunicación interna y externa durante el incidente.
				- Responsable legal: asesora sobre las implicaciones legales del incidente.
				- Responsable de planificación: desarrolla planes de respuesta a incidentes y mejora continua.
				
				**Centro de Operaciones de Seguridad (SOC)**
				
				-  **Analistas SOC:**
				
					- **Nivel 1 (L1):** Monitorean, revisan y priorizan alertas, crean y cierran tickets, y escalan alertas a niveles superiores.
					- **Nivel 2 (L2):** Realizan investigaciones más profundas, configuran herramientas de seguridad y reportan al líder SOC.
					- **Nivel 3 (L3):** Gestionan las operaciones del equipo, realizan análisis forense y de malware, y reportan al gerente SOC.
					
					- **``Líder SOC``:** Supervisa las operaciones del equipo, explora métodos de detección avanzados y reporta al gerente SOC.
					- **``Gerente SOC``:** Lidera el equipo SOC, contrata y evalúa a los miembros, establece métricas de rendimiento, desarrolla informes y comunica resultados a la dirección ejecutiva.
					
					**Roles especializados:**
					
					- Investigadores forenses: recopilan, conservan y analizan pruebas digitales para determinar la causa de los incidentes.
					- Cazadores de amenazas: detectan, analizan y se defienden contra amenazas nuevas y avanzadas.
			-  **Planes de respuesta a incidentes**
			
				Los incidentes de seguridad, como filtraciones de datos, ataques DDoS o ransomware, pueden tener un impacto devastador en las organizaciones. Para minimizar el daño y responder de forma rápida y eficiente, es crucial contar con un plan de respuesta a incidentes. Este plan define los pasos a seguir en cada etapa de la gestión de un incidente, desde su detección hasta su recuperación.
				
				**Elementos esenciales de un plan de respuesta a incidentes**
				
				-  **``Procedimientos de respuesta a incidentes``:** Instrucciones detalladas sobre cómo actuar ante diferentes tipos de incidentes.
				-  **``Información del sistema``:** Diagramas de red, diagramas de flujo de datos, registros e inventario de activos.
				-  **``Documentos de apoyo``:** Listas de contactos, formularios y plantillas.
				
				**Evolución y mejora continua: la clave del éxito**
				
				- **``Revisiones periódicas``:** Revisar el plan de forma regular para garantizar su vigencia y adecuación a las nuevas amenazas.
				- **``Pruebas y simulacros``:** Realizar ejercicios como mesas de trabajo o simulaciones para evaluar la eficacia del plan y familiarizar al equipo con los procedimientos.
				- **``Lecciones aprendidas``:** Analizar los incidentes pasados para identificar áreas de mejora y actualizar el plan en consecuencia.
				- **``Cumplimiento normativo``:** Considerar las regulaciones aplicables a la industria y adaptar el plan para cumplir con los requisitos legales.
			-  **El valor de la documentación**
			
				La documentación no se limita a textos escritos. Abarca una amplia gama de formatos que sirven para diversos propósitos:
				
				- **Manuales de estrategias:** Guían las acciones operativas durante un incidente, definiendo roles, responsabilidades y procedimientos.
				- **Diarios de gestión de incidentes:** Registran las observaciones y hallazgos durante la investigación de un incidente, incluyendo las 5W (quién, qué, dónde, cuándo y por qué).
				- **Políticas:** Establecen las normas y reglas que rigen el comportamiento y las actividades dentro de la organización en materia de seguridad.
				- **Planes:** Detallan los pasos a seguir para prevenir, detectar y responder a incidentes de seguridad.
				- **Informes finales:** Resumen los detalles de un incidente, su análisis, las acciones tomadas y las lecciones aprendidas.
				
				**Documentación efectiva: la clave para el éxito**
				
				Una documentación bien elaborada es crucial para:
				
				- **Reducir la incertidumbre y la confusión:** Proporciona información clara y concisa que guía a los equipos en la toma de decisiones durante un incidente.
				- **Facilitar la colaboración:** Permite que todos los involucrados compartan información de manera eficiente y trabajen en conjunto de manera efectiva.
				- **Preservar el conocimiento:** Registra las lecciones aprendidas de incidentes pasados para prevenir su recurrencia en el futuro.
				- **Cumplir con los requisitos legales:** Demuestra el cumplimiento de las regulaciones y normativas aplicables a la organización.
				
				**Herramientas para la era digital: tu kit de documentación**
				
				A la hora de crear y gestionar documentación, dispones de una variedad de herramientas:
				
				- **Procesadores de texto:** Google Docs, Microsoft Word, LibreOffice Writer.
				- **Sistemas de tickets:** Jira, Zendesk, ServiceNow.
				- **Hojas de cálculo:** Google Sheets, Microsoft Excel.
				- **Grabadoras de audio:** Dispositivos móviles, software de grabación dedicados.
				- **Cámaras:** Dispositivos móviles, cámaras digitales.
				- **Notas escritas:** Cuadernos, libretas digitales.
			-  **Sistemas de detección**
			
				**Sensores digitales: el papel de los IDS**
				
				Imagina un sistema de seguridad para tu hogar. Sensores de movimiento en puertas y ventanas detectan intrusiones y envían alertas a tu teléfono. Un IDS funciona de manera similar, monitorizando la actividad de la red y buscando comportamientos anormales que podrían indicar un ataque.
				
				**Alerta y análisis**
				
				- **``Firma``:** Patrón de ataque conocido.
				- **``Anomalía``:** Comportamiento inusual que se desvía de la actividad normal.
				- **``Política``:** Violación de una política de seguridad predefinida.
				
				**Prevención activa**
				
				Un IPS va más allá de la detección y toma medidas activas para detener las intrusiones. Funciona como una barrera de seguridad, bloqueando el tráfico malicioso o reconfigurando los sistemas para evitar el acceso no autorizado.
				
				-  **Herramientas para tu arsenal de seguridad**
				
					Existen diversas herramientas de IDS e IPS disponibles, cada una con sus propias características y capacidades. Algunas opciones populares incluyen:
					
					- **Snort:** Un IDS de código abierto ampliamente utilizado.
					- **Zeek:** Un IDS basado en flujo de red que ofrece análisis profundo del tráfico.
					- **Kismet:** Un IDS inalámbrico que detecta y analiza actividades en redes Wi-Fi.
					- **Sagan:** Un IDS basado en host que protege sistemas individuales.
					- **Suricata:** Un IDS de alto rendimiento que ofrece detección avanzada de amenazas.
				-  **¿Qué herramientas existen?**
				
					**1. Sistemas de detección de intrusiones (IDS)**
					
					- Monitorean la actividad de la red y los sistemas en busca de comportamientos anormales que podrían indicar un ataque.
					- Detectan y alertan sobre posibles intrusiones, pero no las detienen.
					- Ejemplos: Zeek, Suricata, Snort®, Sagan.
					
					**2. Sistemas de prevención de intrusiones (IPS)**
					
					- Similar a los IDS, pero con una función adicional: detener las intrusiones.
					- Pueden bloquear el tráfico malicioso, reconfigurar sistemas o tomar otras medidas para prevenir el acceso no autorizado.
					- Ejemplos: (Herramientas IDS como Suricata, Snort® y Sagan también pueden tener capacidades IPS).
					
					**3. Detección y respuesta de puntos de conexión (EDR)**
					
					- Se instalan en dispositivos finales (computadoras, teléfonos, etc.) para monitorizar su actividad.
					- Analizan el comportamiento del sistema para identificar patrones de amenazas.
					- Pueden detener automáticamente ataques sin intervención manual.
					- Ejemplos: Open EDR®, Bitdefender™ Endpoint Detection and Response, FortiEDR™.
					
					**¿Cuál herramienta elegir?**
					
					La mejor herramienta para ti dependerá de tus necesidades específicas.
					
					- **Si necesitas una monitorización básica de la red:** Un IDS es una buena opción.
					- **Si necesitas protección adicional contra intrusiones:** Un IPS o un EDR te ofrecerán mayor seguridad.
					- **Si necesitas una protección completa para tus dispositivos finales:** Un EDR es la mejor opción.
				-  **(SIEM) y (SOAR)**
				
					-  **SIEM: tu panel de control de seguridad**
					
						Imagina un auto con un panel que te indica el estado de cada componente, desde la presión de los neumáticos hasta el voltaje de la batería. ¡Así funciona SIEM! Esta herramienta recopila y analiza datos de registro de múltiples fuentes (IDS, IPS, firewalls, etc.) para brindarte una vista completa de la actividad en tu red.
						
						**¿Cómo funciona SIEM?**
						
						1. **Recopilación y agregación de datos:** SIEM ingiere enormes cantidades de datos de registro de diversas fuentes.
						2. **Normalización:** Los datos brutos se limpian y se les da un formato consistente para facilitar su análisis.
						3. **Análisis y correlación:** SIEM aplica reglas predefinidas para detectar eventos de seguridad y correlacionar información de diferentes fuentes.
						4. **Alertas:** Se generan alertas para notificar a los analistas sobre posibles amenazas o eventos que requieren atención.
					-  **SOAR: automatizando la respuesta a incidentes**
					
						SOAR va más allá de las alertas de SIEM. Utiliza la automatización para:
						
						- **Analizar eventos de seguridad:** SOAR examina las alertas de SIEM y otros datos para determinar su gravedad y alcance.
						- **Responder a incidentes:** SOAR puede tomar medidas automatizadas, como aislar sistemas infectados, bloquear direcciones IP maliciosas o enviar notificaciones a los equipos de respuesta.
						- **Gestionar casos:** SOAR centraliza la gestión de incidentes relacionados, permitiendo un seguimiento y una resolución eficientes.
						
						**¿En conjunto, qué hacen SIEM y SOAR?**
						
						- **Mejoran la visibilidad:** Te dan una vista completa de la actividad de la red y te ayudan a identificar amenazas de manera temprana.
						- **Aceleran la respuesta:** Automatizan tareas repetitivas, permitiendo que los analistas se concentren en investigaciones complejas.
						- **Reducen errores:** La automatización minimiza los errores humanos y garantiza respuestas consistentes.
						- **Mejoran la colaboración:** Facilitan la comunicación y la coordinación entre equipos de seguridad.
			-  <strong style ="color: red;">Actividad: Documenta un evento en un diario de gestión de incidentes</strong> 
			
				Una pequeña clínica de atención médica especializada en servicios de atención primaria en los Estados Unidos experimentó un incidente de seguridad un martes por la mañana, alrededor de las 9:00 a.m. Varios empleados reportaron la imposibilidad de utilizar sus computadoras para acceder a archivos como historiales médicos. Las operaciones comerciales se interrumpieron porque los empleados no podían acceder a los archivos y programas necesarios para realizar su trabajo.
				
				Además, los empleados informaron la aparición de  una nota de rescate en sus computadoras. Este mensaje decía que todos los archivos de la empresa habían sido cifrados por un grupo organizado de hackers poco éticos, conocidos por dirigir sus ataques a organizaciones en los sectores de salud y transporte. A cambio de restablecer el acceso a los archivos cifrados, la nota de rescate exigía una gran suma de dinero por la clave de descifrado. 
				
				Los atacantes lograron acceder a la red de la empresa mediante el uso de correos electrónicos de phishing dirigidos a varios empleados de la compañía. Estos correos contenían un archivo adjunto malicioso que instala malware en la computadora del empleado una vez descargado.
				
				Una vez que los atacantes obtuvieron acceso, desplegaron su ransomware, el cual cifró archivos críticos. La empresa se vio incapacitada para acceder a los datos críticos de pacientes, lo que causó interrupciones importantes en sus operaciones comerciales. La clínica tuvo que apagar sus sistemas informáticos y ponerse en contacto con varias organizaciones para reportar el incidente y recibir asistencia técnica.
				
				![[Barra.gif]]
				
				**Paso 2: Registra una entrada en el diario**
				
				Considera los siguientes puntos clave:
				
				- Una pequeña clínica de atención médica en Estados Unidos experimentó un incidente de seguridad el martes a las 9:00 a.m., lo cual interrumpió gravemente sus operaciones comerciales.
				- La causa del incidente de seguridad fue un correo electrónico de phishing que contenía un archivo adjunto malicioso. Una vez descargado, se desplegó un ransomware que cifró los archivos informáticos de la organización.
				- Un grupo organizado de hackers poco éticos dejó una nota de rescate indicando que los archivos de la empresa habían sido cifrados y exigían dinero a cambio de la clave de descifrado.
				
				**Paso 3: Registra una entrada en el diario**
				
				Utiliza el diario de gestión de incidentes para documentar tu primera entrada sobre el escenario dado. Asegúrate de completar todos los campos:
				
				-  En la sección **Fecha**, anota la fecha de la entrada en el diario. Debe ser la fecha real en la que se registra la entrada, no una ficticia.
				-  En la sección **Entrada**, anota un número de entrada en el diario. Por ejemplo, si es tu primera entrada, escribe 1.
				-  En la sección **Descripción**, introduce una descripción de la entrada.
				-  En la sección **Herramientas utilizadas**, enumera las herramientas de ciberseguridad empleadas, en caso de que se hayan usado. 
				-  En la sección **Las 5 W**, anota los detalles sobre el escenario dado.
				   
				    -  ¿Quién (who) causó el incidente?
				    -  ¿Qué (what) sucedió?
				    -  ¿Cuándo (when) ocurrió el incidente?
				    -  ¿Dónde (where) ocurrió el incidente?
				    -  ¿Por qué (why) ocurrió el incidente?
				-  En la fila **notas adicionales**, anota cualquier idea o pregunta que tengas sobre la situación planteada.
				
				![[Barra.gif]]
				
				![[documenta-evento-diario-gestión-incidentes.pdf]]
			-  **¿Por qué es importante analizar el tráfico de red?**
			
				En las redes modernas, es crucial comprender cómo circulan los datos para:
				
				-  **``Identificar comportamientos normales``:** Al analizar el flujo de tráfico habitual, podemos establecer una línea base de lo que se considera normal en la red.
				-  **``Detectar anomalías``:** Desviaciones significativas del comportamiento normal, como picos repentinos de tráfico o transferencias de datos inusuales, pueden indicar actividades maliciosas.
				-  **``Investigar incidentes de seguridad``:** El análisis del tráfico de red proporciona información valiosa para investigar incidentes como intrusiones, exfiltraciones de datos o malware.
				
				**¿Cómo se realiza el análisis del tráfico de red?**
				
				-  **``Análisis de paquetes``:** Examinar los paquetes de datos individuales que conforman el tráfico, observando aspectos como la dirección IP de origen y destino, el tipo de protocolo y el contenido de los datos.
				-  **``Análisis de flujo``:** Monitorear el flujo de datos agregados entre diferentes puntos de la red, identificando patrones y anomalías en el volumen de tráfico.
				-  **``Análisis de comportamiento``:** Utilizar técnicas de aprendizaje automático para identificar patrones de comportamiento inusuales en la red, lo que puede indicar la presencia de malware o actores maliciosos.
				
				-  **¿Qué son los indicadores de compromiso (IoC)?**
				
					Los IoC son señales que sugieren la presencia de una actividad maliciosa en la red. Estos indicadores pueden ser direcciones IP sospechosas, nombres de dominio maliciosos, patrones de tráfico inusuales o incluso fragmentos de código malicioso. El análisis del tráfico de red puede ayudar a identificar IoC y alertar a los equipos de seguridad sobre posibles amenazas.
					
					**Ejemplo: Detección de exfiltración de datos**
					
					Imagina que observas un aumento repentino en el tráfico de red saliente desde un servidor específico. Al analizar el contenido de este tráfico, descubres que se están transfiriendo grandes cantidades de datos sensibles fuera de la red. Esto podría ser un indicador de una exfiltración de datos en curso, lo que requiere una investigación inmediata.
			-  **Mantener la conciencia con el monitoreo de la red**
			
				- **``Sistemas de detección de intrusiones`` (IDS):** Detectan actividades sospechosas en la red y generan alertas para su investigación.
				- **``Sistemas de prevención de intrusiones`` (IPS):** No solo detectan actividades sospechosas, sino que también pueden tomar medidas para bloquearlas o mitigarlas.
				- **``Analizadores de protocolo de red``:** Permiten capturar y analizar el tráfico de red en detalle, lo que puede ser útil para identificar la causa de problemas específicos.
				
				**Establecimiento de líneas base**
				
				Para un monitoreo efectivo, es crucial establecer líneas base que definan el comportamiento normal de la red. Esto se puede lograr mediante el análisis de datos históricos y la identificación de patrones comunes. Las líneas base sirven como punto de referencia para comparar el tráfico actual y detectar anomalías.
				
				**Indicadores de compromiso (IoC)**
				
				Los IoC son señales que sugieren la presencia de una actividad maliciosa en la red. Estos indicadores pueden ser direcciones IP sospechosas, nombres de dominio maliciosos, patrones de tráfico inusuales o incluso fragmentos de código malicioso. El monitoreo de la red puede ayudar a identificar IoC y alertar a los equipos de seguridad sobre posibles amenazas.
				
				**Protección de la red**
				
				El monitoreo de la red es solo un aspecto de la protección de la red. Las organizaciones también deben implementar otras medidas de seguridad, como firewalls, control de acceso y cifrado de datos, para crear una defensa integral contra las amenazas cibernéticas.
			-  **Ataques de exfiltración de datos**
			
				La exfiltración de datos se produce cuando un actor no autorizado obtiene acceso a una red o sistema y extrae información confidencial sin autorización. Esta información puede incluir datos personales, propiedad intelectual, secretos comerciales o cualquier otro tipo de información sensible.
				
				-  **¿Cómo se produce la exfiltración de datos?**
				
					Los atacantes utilizan diversos métodos para infiltrarse en las redes y exfiltrar datos. Algunos métodos comunes incluyen:
					
					- **Phishing:** Engañar a los usuarios para que revelen credenciales o hagan clic en enlaces maliciosos que descargan malware.
					- **Malware:** Software malicioso que infecta sistemas y permite a los atacantes tomar el control y robar datos.
					- **Ataques de fuerza bruta:** Adivinar contraseñas débiles para obtener acceso no autorizado.
					- **Ingeniería social:** Manipular a los empleados para que revelen información confidencial o realicen acciones que beneficien al atacante.
				-  **¿Cómo detectar y prevenir la exfiltración de datos?**
				
					Las organizaciones pueden implementar varias medidas para detectar y prevenir la exfiltración de datos, incluyendo:
					
					- **Monitoreo de la red:** Observar el tráfico de red en busca de actividades inusuales que puedan indicar una exfiltración en curso.
					- **Análisis de registros:** Revisar los registros del sistema para identificar accesos no autorizados o actividades sospechosas.
					- **Herramientas de detección de intrusiones (IDS):** Detectar intentos no autorizados de acceso a la red o a sistemas específicos.
					- **Herramientas de prevención de intrusiones (IPS):** Bloquear o mitigar intentos de exfiltración de datos.
					- **Control de acceso:** Limitar el acceso a los datos confidenciales solo a los usuarios autorizados.
					- **Cifrado de datos:** Proteger los datos en reposo y en tránsito para dificultar su acceso en caso de una filtración.
					- **Capacitación de empleados:** Concienciar a los empleados sobre las amenazas de exfiltración de datos y las mejores prácticas para proteger la información confidencial.
				-  **¿Qué hacer en caso de una exfiltración de datos?**
				
					Si se produce una exfiltración de datos, es crucial actuar con rapidez para contener el daño y mitigar las consecuencias. Los pasos a seguir incluyen:
					
					- **``Identificar el alcance de la filtración``:** Determinar qué datos han sido exfiltrados y cuántos usuarios se han visto afectados.
					- **``Notificar a las partes afectadas``:** Informar a los usuarios, clientes y socios comerciales afectados sobre la filtración.
					- **``Contener la filtración``:** Tomar medidas para evitar que se exfiltre más información, como cambiar contraseñas y cerrar accesos no autorizados.
					- **``Investigar la causa de la filtración``:** Determinar cómo se produjo la filtración para evitar que vuelva a suceder.
					- **``Implementar medidas correctivas``:** Tomar medidas para mejorar la seguridad de la información y prevenir futuras filtraciones.
			-  **Paquetes y capturas de paquetes**
			
				Las capturas de paquetes son como fotografías instantáneas del tráfico de red. Permiten capturar y almacenar copias de los paquetes que viajan por una red en un momento determinado. Estas capturas se pueden analizar para obtener información valiosa sobre las actividades que ocurren en la red, como:
				
				- **``Identificar patrones de tráfico``:** Al observar el volumen y tipo de tráfico, se pueden identificar patrones normales y anormales. Desviaciones significativas de estos patrones podrían indicar actividad maliciosa.
				- **``Investigar incidentes de seguridad``:** En caso de un ataque o intrusión, las capturas de paquetes pueden proporcionar información crucial sobre cómo se produjo el ataque, qué datos se vieron afectados y quiénes fueron los responsables.
				- **``Solucionar problemas de red``:** Las capturas de paquetes pueden ayudar a identificar la causa de problemas de red, como latencia, congestión o pérdida de paquetes.
				
				**¿Cómo se capturan los paquetes?**
				
				Existen diversas herramientas para capturar paquetes de red, conocidas como analizadores de protocolo de red o rastreadores de paquetes. Estas herramientas se instalan en un ordenador que se conecta a la red que se desea monitorizar y permiten capturar y analizar el tráfico de red en tiempo real o guardar capturas para su análisis posterior.
				
				-  **¿Qué se puede analizar en una captura de paquete?**
				
					Al analizar una captura de paquete, se puede observar una gran cantidad de información, incluyendo:
					
					- **Encabezado del paquete:** Contiene información como la dirección IP de origen y destino, el tipo de protocolo utilizado, el número de secuencia y el número de puerto.
					- **Carga útil del paquete:** Contiene los datos reales que se están transmitiendo, como el contenido de un correo electrónico, una página web o un archivo.
					- **Información de tiempo:** Indica cuándo se capturó el paquete.
					
					**Herramientas para el análisis de paquetes**
					
					Existen diversas herramientas disponibles para el análisis de paquetes, tanto gratuitas como de pago. Algunas de las herramientas más populares incluyen:
					
					- **``Wireshark``:** Una herramienta gratuita y de código abierto ampliamente utilizada para el análisis de paquetes.
					- **``tcpdump``:** Una herramienta de línea de comandos para capturar y analizar paquetes de red.
					- **``Colasoft Capsa``:** Una herramienta de análisis de paquetes comercial con una amplia gama de funciones.
				-  **Revisa los campos del encabezado de un paquete**
				
					El encabezado IPv4 está compuesto por varios campos que proporcionan información esencial para el enrutamiento y la entrega de paquetes. A continuación, se presenta un desglose de los campos principales:
					
					- **``Versión`` (4 bits):** Indica la versión del protocolo IP que se está utilizando. En este caso, el valor será 4 para IPv4.
					- **``IHL`` (Longitud del encabezado de Internet) (4 bits):** Especifica la longitud del encabezado IP en palabras de 32 bits. Esto incluye el encabezado IP y cualquier opción que pueda estar presente.
					- **``ToS`` (Tipo de servicio) (8 bits):** Este campo se utiliza para indicar el tipo de servicio que se solicita para el paquete. Los bits individuales del campo ToS se pueden marcar para indicar diferentes prioridades o tratamientos para el paquete.
					- **``Longitud total`` (16 bits):** Indica la longitud total del paquete en bytes, incluyendo el encabezado IP y los datos.
					- **``Identificación`` (16 bits):** Este campo se utiliza para identificar de forma única un paquete fragmentado. Cuando un paquete IP es demasiado grande para ser transmitido por una red, se fragmenta en varios paquetes más pequeños. Cada fragmento tiene el mismo valor de identificación, lo que permite reensamblarlo en el destino.
					- **``Indicadores`` (3 bits):** Este campo contiene dos bits que se utilizan para controlar la fragmentación de paquetes: * **DF (Don't Fragment):** Si este bit está establecido, indica que el paquete no debe fragmentarse si es demasiado grande para la red. * **MF (More Fragments):** Si este bit está establecido, indica que el paquete es un fragmento de un paquete más grande.
					- **``Desplazamiento de fragmentos`` (13 bits):** Este campo indica la posición del fragmento actual dentro del paquete original no fragmentado.
					- **``TTL`` (Tiempo de vida) (8 bits):** Este campo especifica la cantidad de tiempo que un paquete puede estar en la red antes de ser descartado. El valor del TTL se decrementa en uno por cada enrutador que atraviesa el paquete. Si el TTL llega a cero antes de que el paquete llegue a su destino, se descarta.
					- **``Protocolo`` (8 bits):** Este campo indica el protocolo de transporte que se utiliza para transportar los datos del paquete. Los valores comunes para este campo incluyen: * **TCP (6):** Protocolo de control de transmisión * **UDP (17):** Protocolo de datagramas de usuario
					- **``Suma de comprobación del encabezado`` (16 bits):** Este campo contiene un valor de suma de comprobación que se utiliza para detectar errores en el encabezado IP.
					- **``Dirección IP de origen`` (32 bits):** Este campo especifica la dirección IP del dispositivo que envió el paquete.
					- **``Dirección IP de destino`` (32 bits):** Este campo especifica la dirección IP del dispositivo que debe recibir el paquete.
					- **``Opciones`` (variable):** Este campo es opcional y se puede utilizar para proporcionar información adicional sobre el paquete, como la seguridad o el enrutamiento.
					- **``Datos`` (variable):** Este campo contiene los datos reales que se están transmitiendo en el paquete.
					
					-  **Encabezados IPv6**
					
						- **``Versión`` (4 bits):** Indica la versión del protocolo IP, en este caso, 6 para IPv6.
						- **``Clase de tráfico`` (8 bits):** Similar al campo Tipo de servicio (ToS) en IPv4, este campo proporciona información sobre la prioridad del paquete para la entrega. Los bits individuales del campo Clase de tráfico se pueden marcar para indicar diferentes prioridades o tratamientos para el paquete.
						- **``Etiqueta de flujo`` (20 bits):** Este campo se utiliza para identificar los paquetes de un flujo. Un flujo es la secuencia de paquetes enviados desde una fuente específica. La etiqueta de flujo puede ser utilizada por enrutadores y conmutadores para optimizar el enrutamiento y la entrega de paquetes.
						- **``Longitud de carga útil`` (16 bits):** Especifica la longitud total del área de datos del paquete, en bytes.
						- **``Siguiente encabezado`` (8 bits):** Este campo indica el tipo de encabezado que sigue al encabezado IPv6, como TCP o UDP.
						- **``Límite de salto`` (8 bits):** Similar al campo Tiempo de vida (TTL) en IPv4, este campo restringe el tiempo que un paquete puede viajar en una red antes de que se descarte. El valor del Límite de salto se decrementa en uno por cada enrutador que atraviesa el paquete.
						- **``Dirección de origen`` (128 bits):** Especifica la dirección IP de origen del dispositivo que envió el paquete. IPv6 utiliza direcciones de 128 bits, lo que proporciona un espacio de direcciones mucho más grande que IPv4.
						- **``Dirección de destino`` (128 bits):** Especifica la dirección IP de destino del dispositivo que debe recibir el paquete.
						
						**Beneficios de los encabezados IPv6:**
						
						- **``Simplificación``:** Menos campos en el encabezado reducen la sobrecarga de procesamiento y mejoran la eficiencia.
						- **``Espacio de direcciones ampliado``:** Las direcciones IPv6 de 128 bits permiten acomodar una gran cantidad de dispositivos en Internet.
						- **``Seguridad mejorada``:** IPv6 incluye características de seguridad integradas, como la autenticación y el cifrado, para proteger las comunicaciones.
			-  **La fase de detección y análisis del ciclo de vida**
			
				- **``Eventos``:** Sucesos comunes dentro de las operaciones normales, como visitas a sitios web o solicitudes de restablecimiento de contraseñas.
				- **``Incidentes``:** Subconjuntos de eventos que indican una posible actividad maliciosa o una violación de la seguridad.
				
				**Proceso de detección:**
				
				- **``Recopilación de datos``:** Las herramientas IDS y SIEM reúnen datos de eventos de firewalls, registros de sistemas, endpoints, etc.
				- **``Análisis de datos``:** Se aplica inteligencia artificial, análisis estadístico y reglas predefinidas para identificar anomalías o comportamientos sospechosos.
				- **``Generación de alertas``:** Si se detecta actividad potencialmente maliciosa, se genera una alerta para notificar a los analistas de seguridad.
				
				**Fase de análisis:**
				
				- **``Investigación de alertas``:** Los analistas examinan las alertas para determinar si representan un verdadero incidente o un falso positivo.
				- **``Validación de la amenaza``:** Se analizan los indicadores de compromiso (IoCs) para confirmar la presencia de una amenaza real.
				- **``Recopilación de evidencia``:** Se recopila evidencia adicional, como registros de red, logs de aplicaciones y volcados de memoria, para comprender el alcance del incidente.
				- **``Contención del incidente``:** Se toman medidas para contener el daño y limitar el impacto del incidente, como aislar sistemas comprometidos o bloquear el acceso a recursos críticos.
				
				**Desafíos en la detección y el análisis:**
				
				- **``Limitaciones de las herramientas``:** Ninguna herramienta es perfecta y todas tienen limitaciones de detección.
				- **``Falsos positivos``:** Las configuraciones incorrectas o los patrones demasiado amplios pueden generar alertas innecesarias.
				- **``Alto volumen de alertas``:** Los analistas pueden verse abrumados por un gran número de alertas, dificultando la priorización y la investigación.
				- **``Ataques sofisticados``:** Los actores de amenazas pueden utilizar técnicas evasivas para eludir los sistemas de detección.
				
				**Mejores prácticas para el análisis efectivo:**
				
				- **``Utilizar herramientas de forma adecuada``:** Configurar correctamente las herramientas IDS y SIEM para minimizar los falsos positivos.
				- **``Priorizar alertas``:** Implementar un sistema de priorización para enfocarse en las alertas más relevantes.
				- **``Contar con un plan de respuesta``:** Tener un plan de respuesta a incidentes definido para guiar la investigación y la contención.
				- **``Analizar IoCs``:** Buscar y analizar indicadores de compromiso para confirmar la presencia de una amenaza.
				- **``Recopilar evidencia de manera forense``:** Preservar y recopilar evidencia de forma adecuada para posibles investigaciones legales.
				- **``Compartir información``:** Colaborar con otros equipos de seguridad e investigadores para compartir información y conocimiento.
			-  **Métodos de detección de incidentes de ciberseguridad**
			
				En esta ocasión, profundizaremos en diferentes métodos de detección que las organizaciones pueden utilizar para complementar las herramientas automatizadas y mejorar su postura de seguridad.
				
				**Métodos de detección complementarios:**
				
				-  **``Caza de amenazas``:** La caza de amenazas es una técnica proactiva que combina el análisis humano con herramientas tecnológicas para descubrir amenazas ocultas que podrían pasar desapercibidas para los sistemas de detección automatizados. Los cazadores de amenazas utilizan diversos métodos, como:
				
				    - **Análisis de registros:** Examinan registros de sistemas, redes y aplicaciones en busca de patrones o actividades inusuales que podrían indicar una amenaza.
				    - **Análisis de tráfico de red:** Monitorean el tráfico de red para detectar comportamientos anormales o conexiones sospechosas.
				    - **Análisis de vulnerabilidades:** Buscan vulnerabilidades conocidas en los sistemas y aplicaciones que podrían ser explotadas por los atacantes.
				    - **Investigación de malware:** Analizan archivos sospechosos en busca de malware o código malicioso.
				
				La caza de amenazas es particularmente útil para detectar amenazas nuevas o sofisticadas que aún no están siendo captadas por las herramientas de detección tradicionales.
				
				-  **``Inteligencia sobre amenazas``:** La inteligencia sobre amenazas es información basada en evidencia que proporciona contexto sobre las amenazas existentes o emergentes. Esta información puede provenir de diversas fuentes, como:
				    
				    - **Informes de la industria:** Publicados por empresas de seguridad e investigadores, ofrecen detalles sobre las tácticas, técnicas y procedimientos (TTP) de los atacantes.
				    - **Avisos gubernamentales:** Emitidos por agencias gubernamentales, alertan sobre las amenazas más recientes y los métodos de ataque.
				    - **Fuentes de datos de amenazas:** Proporcionan listas de indicadores de compromiso (IoCs), como direcciones IP, dominios y hashes de archivos, asociados con amenazas conocidas.
				
				La inteligencia sobre amenazas permite a las organizaciones comprender mejor el panorama de amenazas y tomar decisiones informadas para proteger sus activos.
				
				-  **``Ciberengaño``:** El ciber engaño consiste en el uso de técnicas para engañar deliberadamente a los agentes de amenaza. Un ejemplo común son los honeypots, que son sistemas o recursos diseñados para atraer ataques y así revelar las intenciones de los atacantes. Los honeypots pueden ser:
				    
				    - **De baja interacción:** Simulan sistemas vulnerables y registran la actividad de los atacantes sin interactuar con ellos.
				    - **De alta interacción:** Permiten que los atacantes interactúen con el sistema, lo que proporciona información más detallada sobre sus métodos y herramientas.
				
				El ciber engaño puede ser una herramienta valiosa para recopilar información sobre las amenazas y mejorar las estrategias de defensa.
			-  **Indicadores de compromiso**
			
				En el ámbito de la ciberseguridad, los Indicadores de Compromiso (IoCs) son piezas de información cruciales para identificar y responder a incidentes de seguridad. Estos indicadores actúan como pistas o señales que revelan la presencia de una amenaza o actividad maliciosa dentro de una red o sistema.
				
				**Definición:** Los IoCs son artefactos o características específicas que se asocian con una amenaza o un ataque en particular. Pueden ser direcciones IP, nombres de dominio, hashes de archivos, patrones de comportamiento de red, URLs maliciosas, entre otros. Al identificar y analizar IoCs, los analistas de seguridad pueden determinar si un sistema ha sido comprometido y tomar las medidas necesarias para contener el daño y mitigar el riesgo.
				  
				-  **``Tipos de IoCs``:** Existen diversos tipos de IoCs, cada uno con su propio propósito y utilidad:
				
				    - **IoCs de red:** Se basan en información de red, como direcciones IP, puertos, nombres de dominio o protocolos de comunicación.
				    - **IoCs de host:** Se enfocan en características específicas de un sistema comprometido, como hashes de archivos, nombres de procesos o indicadores de malware.
				    - **IoCs de comportamiento:** Analizan el comportamiento anómalo de un sistema o usuario, como patrones de acceso inusuales o intentos fallidos de autenticación.
				    - **IoCs de inteligencia:** Se derivan de informes de inteligencia sobre amenazas, avisos gubernamentales o investigaciones sobre ataques conocidos.
				-  **``Importancia de los IoCs``:** Son esenciales para la detección y respuesta a incidentes por varias razones:
				  
				    - **Precisión:** Permiten identificar amenazas con mayor precisión que los métodos tradicionales basados en firmas o reglas.
				    - **Eficacia:** Facilitan la investigación y el análisis de incidentes, ahorrando tiempo y recursos.
				    - **Prevención:** Ayudan a prevenir futuros ataques al identificar patrones y vulnerabilidades explotadas por los atacantes.
				    - **Colaboración:** Facilitan el intercambio de información entre equipos de seguridad y organizaciones, mejorando la respuesta global a las amenazas.
			-  **Los beneficios de la documentación**
			
				- **``Transparencia``:** La documentación transparente proporciona un registro claro de las acciones tomadas, las decisiones realizadas y los resultados obtenidos. Esto es fundamental para auditorías, investigaciones y procesos legales, ya que permite demostrar el cumplimiento de las normas y procedimientos.
				- **``Estandarización``:** La documentación establece pautas y estándares que todos los miembros de la organización deben seguir, asegurando la consistencia en las prácticas de seguridad y la calidad del trabajo. Esto ayuda a minimizar errores, reducir riesgos y mantener la eficiencia operativa.
				- **``Claridad``:** Una documentación clara y concisa proporciona a los equipos de seguridad la información necesaria para comprender sus roles, responsabilidades y los procedimientos a seguir en diferentes situaciones. Esto reduce la ambigüedad, mejora la comunicación y facilita la colaboración durante la respuesta a incidentes.
				- **``Mejora continua``:** La documentación sirve como base para la revisión y actualización de las políticas, procesos y procedimientos de seguridad. Al documentar los cambios realizados y las lecciones aprendidas, las organizaciones pueden identificar áreas de mejora y adaptar sus estrategias de seguridad a las amenazas y desafíos en constante evolución.
				- **``Memoria institucional``:** La documentación preserva el conocimiento y la experiencia acumulados dentro de la organización, incluso cuando los miembros del equipo rotan o se retiran. Esto asegura que la información crítica no se pierda y que las nuevas generaciones de profesionales de seguridad puedan aprender de las experiencias pasadas.
				
				**Ejemplos de documentación en ciberseguridad:**
				
				- **``Políticas de seguridad``:** Establecen las reglas y directrices generales que rigen el uso de la tecnología y la información dentro de la organización.
				- **``Procedimientos de seguridad``:** Detallan los pasos específicos que deben seguirse para realizar tareas de seguridad, como la gestión de accesos, la respuesta a incidentes o la instalación de parches de seguridad.
				- **``Planes de respuesta a incidentes``:** Definen el proceso para identificar, contener, erradicar y recuperarse de incidentes de seguridad.
				- **``Guías de usuario``:** Proporcionan instrucciones paso a paso para utilizar herramientas de seguridad específicas o realizar tareas relacionadas con la seguridad.
				- **``Registros de auditoría``:** Registran las actividades de seguridad realizadas, como inicios de sesión, cambios en la configuración del sistema o accesos a datos confidenciales.
				
				**Recomendaciones para una documentación efectiva:**
				
				- **``Completa``:** Debe cubrir todos los aspectos relevantes de las políticas, procesos y procedimientos de seguridad.
				- **``Precisa``:** La información debe ser exacta, actualizada y fácil de entender.
				- **``Accesible``:** La documentación debe estar disponible para todos los miembros del equipo de seguridad que la necesiten.
				- **``Fácil de usar``:** La estructura y el formato deben ser amigables para el usuario, facilitando la búsqueda y consulta de información.
				- **``Viva``:** Debe revisarse y actualizarse periódicamente para reflejar los cambios en el entorno de amenazas, las regulaciones y las mejores prácticas.
	-  <strong style ="color: while;">Suplantación de identidad</strong>
	
		El phishing es el uso de comunicaciones digitales para engañar a las personas para que revelen datos confidenciales o implementen software malicioso. 
		
		Algunos de los tipos de ataques de phishing más comunes en la actualidad incluyen: 
		
		- **``Compromiso de correo electrónico empresarial``** (BEC): un actor de amenazas envía un mensaje de correo electrónico que parece provenir de una fuente conocida para realizar una solicitud de información aparentemente legítima, con el fin de obtener una ventaja financiera.
		- **``Spear phishing``**: un ataque de correo electrónico malicioso dirigido a un usuario o grupo de usuarios específico. El correo electrónico parece provenir de una fuente confiable.
		- **``Caza de ballenas``**: una forma de phishing. Los actores de amenazas se dirigen a los ejecutivos de las empresas para obtener acceso a datos confidenciales.
		- **``Vishing``**: La explotación de la comunicación de voz electrónica para obtener información confidencial o hacerse pasar por una fuente conocida.
		- **``Smishing``**: El uso de mensajes de texto para engañar a los usuarios, con el fin de obtener información confidencial o hacerse pasar por una fuente conocida.
	-  **Estrategias para la administración de riesgos de seguridad en la nube**
	
		- **``Marcos de trabajo`` (Frameworks):** Estándares que guían cómo organizar la seguridad (ej. NIST, ISO).
		- **``Gobierno de datos``:** La diferencia crucial entre **Privacidad** (quién tiene derecho a ver los datos) y **Protección** (las herramientas técnicas para que nadie más los vea).
		- **``Ciclo de vida de cumplimiento``:** No es un evento único; es un proceso de evaluación, auditoría y remediación continua.
		- **``Gestión de postura de seguridad`` (CSPM):** Herramientas para monitorear riesgos en entornos complejos (especialmente en arquitecturas multicloud).
		
		**Guía de implementación paso a paso**
		
		Como profesional de seguridad en la nube, tu flujo de trabajo para gestionar riesgos seguirá generalmente estos pasos:
		
		- **``Identificación de activos``:** Saber qué recursos tienes en GCP (Cómputo, Almacenamiento, Redes).
		- **``Evaluación de riesgos``:** Determinar qué amenazas podrían afectar esos recursos.
		- **``Selección de controles``:** Elegir la configuración de seguridad adecuada (ej. encriptación, reglas de Firewall, IAM).
		- **``Implementación mediante código``:** Usar **IaC (Terraform/Cloud Deployment Manager)** y **PaC** para que los controles sean automáticos y repetibles.
		- **``Auditoría y Monitoreo``:** Usar herramientas de cumplimiento para verificar que los controles están activos y funcionan.
-  **Ciberseguridad**

	-  **Networking** <strong style ="color: SpringGreen;"></strong>
	
		-  Lab: <strong style ="color: SpringGreen;">Seguir ruta de objetivos</strong>
		
			![[5.1.5 - Seguir una ruta de objetivos.pdf]]
		-  **[[Netzwerk#^RefSuiteTCPIP|Suite de protocolos TCP/IP]]**
		-  Lab: <strong style ="color: SpringGreen;">Introducción a Wireshark and Mininet</strong>
		
			1. Ejecuto: `sudo ~/lab.support.files/scripts/cyberops_topo.py`
			2. Inicializo nuevas terminales mininet: `xterm H1` & `xterm H2`
			3. Compruebo sus direcciones IP: `ip address`
			4. En la mininet H1 inicializamos ``wireshark &``
			5. Ejecutamos un ping ``ICMP``: ``ping -c 5 10.0.0.12``
			
			![[Pasted image 20240718185407.png]]
			
			6. Comprobamos las direcciones MAC de origen y destino.
			7. Finalice mininet: `quit` al cerrar finalice todos los procesos interpuestos por mininet `sudo mn -c`
		
			![[5.3.7 - Introducción a Wireshark and Mininet.pdf]]
		-  Lab: <strong style ="color: SpringGreen;">Identificación del direccionamiento IPv4 e IPv6</strong>
		
			![[7.2.8 - Identificación del Direccionamiento IPv4 e IPv6.pdf]]
			
			![[7.2.8 - Identificación del Direccionamiento IPv4 e IPv6.pka]]
		-  
	-  **[[systemtechnik|Systemtechnik]]**
	
		-  <strong style ="color: 40C4FF;">Protección</strong>: **Directorios y rutas susceptibles a ataques en Linux**
		
			^uhm9
			-  **``.``**
			
				- **``Descripción``**: Representa el directorio actual.
				- **``Propósito``**: Permite referirse al directorio en el que te encuentras actualmente.
			-  **``..``**
			
				- **``Descripción``**: Representa el directorio padre.
				- **``Propósito``**: Facilita la navegación hacia el directorio que contiene el directorio actual.
			-  **``bin -> usr/bin``**
			
				- **``Descripción``**: Enlace simbólico que apunta a `/usr/bin`.
				- **``Propósito``**: Contiene ejecutables esenciales que son utilizados por todos los usuarios del sistema.
			-  **``boot``**
			
				- **``Descripción``**: Directorio que contiene archivos necesarios para el arranque del sistema.
				- **``Propósito``**: Almacena el kernel de Linux y otros archivos relacionados con el proceso de arranque.
				-  **``Vulnerabilidades``**:
				
				    - **Modificación del kernel**: Los atacantes que acceden a este directorio pueden reemplazar el kernel por uno malicioso.
				-  **``Mitigación``**:
				
				    - Usar protección en el arranque (como GRUB con contraseña).
				    - Monitorear cambios en este directorio.
			-  **``dev``**
			
				- **``Descripción``**: Directorio que contiene archivos de dispositivo.
				- **``Propósito``**: Proporciona acceso a los dispositivos hardware del sistema, como discos duros, terminales, etc.
				-  **``Vulnerabilidades``**:
				
				    - **Acceso directo a hardware**: Si un atacante puede acceder a archivos de dispositivo, puede manipular hardware o explotar dispositivos vulnerables.
				-  **``Mitigación``**:
				
				    - Restringir acceso a archivos de dispositivos sensibles.
				    - Monitorear el acceso y uso de dispositivos para detectar comportamientos inusuales.
			-  **``Docker``**
			
				- **``Descripción``**: Directorio utilizado por Docker.
				- **``Propósito``**: Contiene configuraciones y datos relacionados con los contenedores Docker en el sistema.
			-  **``etc``**
			
				- **``Descripción``**: Directorio que contiene archivos de configuración del sistema.
				- **``Propósito``**: Almacena configuraciones de sistema y de aplicaciones que son esenciales para la operación del sistema.
				-  **``Vulnerabilidades``**:
				
				    - **Modificación de archivos críticos**: Si un atacante accede a este directorio, puede modificar configuraciones esenciales (como `/etc/passwd`).
				    - **Acceso a contraseñas**: Archivos como `/etc/shadow` pueden ser vulnerables si no se protegen correctamente.
				-  **``Mitigación``**:
				
				    - Implementar controles de acceso estrictos y utilizar el principio de menor privilegio.
				    - Monitorear cambios en archivos críticos con herramientas de detección de cambios.
			-  **``home``**
			
				- **``Descripción``**: Directorio que contiene los directorios personales de los usuarios.
				- **``Propósito``**: Almacena datos y configuraciones específicas de los usuarios.
				-  **``Vulnerabilidades``**:
				
				    - **Acceso a datos sensibles**: Archivos en los directorios personales pueden contener información personal y sensible.
				-  **``Mitigación``**:
				
				    - Asegurar que los permisos de los directorios de usuarios sean correctos (por ejemplo, `700` para directorios personales).
				    - Usar cifrado en datos sensibles almacenados en estos directorios.
			-  **``init``**
			
				- **``Descripción``**: Archivo ejecutable que es el primer proceso que se ejecuta en el sistema.
				- **``Propósito``**: Es el proceso padre de todos los demás procesos en Linux y se encarga de iniciar otros servicios y procesos durante el arranque.
			-  **``initrd.img -> boot/initrd.img-6.8.11-amd64``**
			
				- **``Descripción``**: Enlace simbólico a la imagen de disco inicial del sistema.
				- **``Propósito``**: Proporciona un sistema de archivos temporal que se utiliza para cargar el kernel y los módulos necesarios durante el arranque.
			-  **``initrd.img.old -> boot/initrd.img-6.8.11-amd64``**
			
				- **``Descripción``**: Enlace simbólico a una imagen de disco inicial anterior.
				- **``Propósito``**: Se guarda como copia de seguridad en caso de que se necesite revertir a una versión anterior.
			-  **``lib -> usr/lib``**
			
				- **``Descripción``**: Enlace simbólico que apunta a `/usr/lib`.
				- **``Propósito``**: Contiene bibliotecas compartidas que son utilizadas por programas y servicios del sistema.
			-  **``lib32 -> usr/lib32``**
			
				- **``Descripción``**: Enlace simbólico que apunta a `/usr/lib32`.
				- **``Propósito``**: Contiene bibliotecas de 32 bits para aplicaciones de 32 bits en sistemas de 64 bits.
			-  **``lib64 -> usr/lib64``**
			
				- **``Descripción``**: Enlace simbólico que apunta a `/usr/lib64`.
				- **``Propósito``**: Contiene bibliotecas de 64 bits para aplicaciones de 64 bits.
			-  **``lost+found``**
			
				- **``Descripción``**: Directorio utilizado por el sistema de archivos para almacenar archivos recuperados.
				- **``Propósito``**: Se utiliza para almacenar archivos perdidos o recuperados tras una falla del sistema o corrupción del sistema de archivos.
				-  **``Vulnerabilidades``**:
				
				    - **Datos no verificados**: Archivos recuperados pueden ser maliciosos o corruptos.
				-  **``Mitigación``**:
				
				    - Monitorear el contenido de este directorio y verificar los archivos recuperados.
			-  **``media``**
			
				- **``Descripción``**: Directorio donde se montan los dispositivos extraíbles.
				- **``Propósito``**: Facilita el acceso a medios como CD/DVDs y unidades USB.
				-  **``Vulnerabilidades``**:
				    - **Ejecución de código malicioso**: Dispositivos USB pueden contener malware que se ejecute al ser montados.
				-  **``Mitigación``**:
				    - Deshabilitar la autoejecución de medios extraíbles.
				    - Escanear dispositivos USB antes de montarlos.
			-  **``mnt``**
			
				- **``Descripción``**: Directorio utilizado para montar sistemas de archivos.
				- **``Propósito``**: Proporciona un punto de montaje temporal para sistemas de archivos y dispositivos.
				-  **``Vulnerabilidades``**:
				
				    - **Inyección de código malicioso**: Archivos maliciosos pueden ser almacenados en sistemas montados.
				-  **``Mitigación``**:
				
				    - Monitorear el uso de este directorio y aplicar políticas de acceso.
			-  **``opt``**
			
				- **``Descripción``**: Directorio para aplicaciones adicionales.
				- **``Propósito``**: Almacena aplicaciones de software que no forman parte de la distribución estándar del sistema.
				-  **``Vulnerabilidades``**:
				
				    - **Instalación de software malicioso**: La instalación de software de fuentes no confiables puede introducir vulnerabilidades.
				-  **``Mitigación``**:
				
				    - Limitar el acceso a la instalación de software en este directorio y verificar las fuentes de software.
			-  **``proc``**
			
				- **``Descripción``**: Sistema de archivos virtual que proporciona información sobre los procesos en ejecución.
				- **``Propósito``**: Permite el acceso a información del kernel y de procesos del sistema en tiempo real.
				-  **``Vulnerabilidades``**:
				
				    - **Exposición de información sensible**: Puede revelar información sobre procesos, usuarios y configuraciones que un atacante podría utilizar.
				-  **``Mitigación``**:
				
				    - Limitar el acceso a este sistema de archivos a usuarios no privilegiados.
			-  **``root``**
			
				- **``Descripción``**: Directorio personal del usuario root.
				- **``Propósito``**: Almacena configuraciones y datos específicos del superusuario del sistema.
			-  **``run``**
			
				- **``Descripción``**: Directorio que contiene datos en tiempo de ejecución.
				- **``Propósito``**: Almacena información sobre el sistema y los procesos que se están ejecutando actualmente.
			-  **``sbin -> usr/sbin``**
			
				- **``Descripción``**: Enlace simbólico que apunta a `/usr/sbin`.
				- **``Propósito``**: Contiene ejecutables utilizados por el administrador del sistema, normalmente para tareas de mantenimiento y configuración.
			-  **``srv``**
			
				- **``Descripción``**: Directorio utilizado para datos de servicios específicos.
				- **``Propósito``**: Almacena datos para servicios que se ejecutan en el sistema, como datos de un servidor web.
			-  **``sys``**
			
				- **``Descripción``**: Sistema de archivos virtual que proporciona información sobre los dispositivos y subsistemas del kernel.
				- **``Propósito``**: Permite acceder a información sobre dispositivos de hardware y configuraciones del sistema.
				-  **``Vulnerabilidades``**:
				
				    - **Acceso a configuraciones de hardware**: Puede permitir cambios no autorizados en la configuración de hardware.
				-  **``Mitigación``**:
				
				    - Limitar el acceso y monitorear cambios en este directorio.
			-  **``tmp``**
			
				- **``Descripción``**: Directorio para archivos temporales.
				- **``Propósito``**: Almacena archivos temporales que pueden ser creados por aplicaciones y procesos durante su ejecución.
				-  **``Vulnerabilidades``**:
				
				    - **Inyección de scripts**: Los atacantes pueden colocar scripts maliciosos en este directorio que pueden ser ejecutados por otros usuarios.
				    - **Ataques de race condition**: Un atacante puede crear un archivo en `/tmp` y luego esperar a que una aplicación legítima lo abra para ejecutar código malicioso.
				-  **``Mitigación``**:
				
				    - Limitar los permisos a este directorio (por ejemplo, usando `noexec` en la configuración de montaje).
				    - Limpiar regularmente archivos temporales.
				    - Implementar el uso de `secure_tmp`, que utiliza directorios temporales en sistemas de archivos que no son accesibles para los usuarios regulares.
			-  **``usr``**
			
				- **``Descripción``**: Directorio que contiene programas y datos de usuario.
				- **``Propósito``**: Almacena aplicaciones y librerías que son utilizadas por los usuarios, además de documentos y otros archivos.
				-  **``Vulnerabilidades``**:
				
				    - **Inyección de malware**: Si los permisos son demasiado permisivos, los atacantes pueden insertar malware en aplicaciones de usuario.
				-  **``Mitigación``**:
				
				    - Mantener actualizadas las aplicaciones y monitorear cambios en este directorio.
				    - Asegurar que solo usuarios autorizados puedan realizar cambios.
			-  **``var``**
			
				- **``Descripción``**: Directorio que contiene archivos variables.
				- **``Propósito``**: Almacena archivos que cambian durante la operación normal del sistema, como logs, bases de datos y archivos temporales.
				-  **``Vulnerabilidades``**:
				
				    - **Acceso no autorizado a logs**: Los logs pueden contener información sensible si no están protegidos adecuadamente.
				    - **Inyección de datos**: Los atacantes pueden intentar inyectar datos maliciosos en los sistemas de correo o bases de datos.
				-  **``Mitigación``**:
				
				    - Configurar permisos adecuados en archivos de log y restringir el acceso.
				    - Monitorizar la actividad en los archivos de log y establecer alertas para actividades sospechosas.
			-  **``vmlinuz -> boot/vmlinuz-6.8.11-amd64``**
			
				- **``Descripción``**: Enlace simbólico que apunta al kernel de Linux comprimido.
				- **``Propósito``**: Es el núcleo del sistema operativo que se carga durante el arranque del sistema.
			-  **``vmlinuz.old -> boot/vmlinuz-6.8.11-amd64``**
			
				- **``Descripción``**: Enlace simbólico que apunta a una versión anterior del kernel.
				- **``Propósito``**: Se mantiene como copia de seguridad para permitir la restauración a una versión anterior en caso de problemas con la nueva.
		-  <strong style ="color: 40C4FF;">Protección</strong>: **Directorios y rutas susceptibles a ataques en Windows**
		
			^uhm7
			-  **``C:\Windows``**
			
			    - **``Descripción``**: Directorio principal del sistema operativo Windows.
			    - **``Propósito``**: Contiene archivos esenciales para el funcionamiento de Windows, incluyendo el registro, bibliotecas, y otros componentes críticos del sistema.
			     
			    -  **``Vulnerabilidades``**:
			     
			        - **Modificación de archivos críticos**: Un atacante con privilegios suficientes podría reemplazar archivos esenciales, comprometiendo la integridad del sistema.
			    -  **``Mitigación``**:
			     
			        - Restringir permisos de acceso a este directorio solo a administradores.
			        - Utilizar herramientas de monitorización de integridad para detectar cambios en archivos críticos.
			-  **``C:\Windows\System32``**
			
			    - **``Descripción``**: Contiene ejecutables y bibliotecas del sistema, incluyendo el núcleo de Windows.
			    - **``Propósito``**: Almacena archivos que son fundamentales para la operación del sistema operativo, tales como `cmd.exe` y `svchost.exe`.
			    -  **``Vulnerabilidades``**:
			     
			        - **Inyección de malware**: Un atacante podría reemplazar ejecutables de este directorio para comprometer el sistema.
			    -  **``Mitigación``**:
			     
			        - Configurar permisos estrictos y utilizar software antivirus/antimalware para evitar modificaciones no autorizadas.
			        - Monitorear la actividad en este directorio y establecer alertas para cualquier cambio inesperado.
			-  **``C:\Program Files y C:\Program Files (x86)``**
			
			    - **``Descripción``**: Directorios donde se instalan las aplicaciones de 64 y 32 bits respectivamente.
			    - **``Propósito``**: Facilita el almacenamiento de aplicaciones de usuario y del sistema.
			    -  **``Vulnerabilidades``**:
			     
			        - **Elevación de privilegios**: Algunas aplicaciones mal configuradas en estos directorios pueden permitir que los atacantes escalen privilegios.
			    -  **``Mitigación``**:
			     
			        - Asignar permisos adecuados y utilizar el control de cuentas de usuario (UAC) para restringir instalaciones y cambios.
			-  **``C:\Users``**
			
			    - **``Descripción``**: Contiene carpetas personales para cada usuario.
			    - **``Propósito``**: Almacena documentos, configuraciones y datos específicos de cada usuario en sus subcarpetas, como `Desktop`, `Documents`, y `Downloads`.
			    -  **``Vulnerabilidades``**:
			     
			        - **``Acceso a datos personales``**: Un atacante puede acceder a archivos personales y posiblemente sensibles.
			    -  **``Mitigación``**:
			     
			        - Configurar permisos de acceso adecuados para cada usuario.
			        - Cifrar datos sensibles utilizando BitLocker o herramientas de cifrado específicas.
			-  **``C:\Users\Public``**
			
			    - **``Descripción``**: Carpeta compartida entre todos los usuarios del sistema.
			    - **``Propósito``**: Facilita el intercambio de archivos entre usuarios del mismo equipo.
			    -  **``Vulnerabilidades``**:
			     
			        - **``Difusión de malware``**: Los atacantes podrían dejar archivos maliciosos en esta carpeta para infectar a otros usuarios.
			    -  **``Mitigación``**:
			     
			        - Limitar el acceso a esta carpeta y educar a los usuarios sobre no ejecutar archivos desconocidos.
			-  **``C:\Windows\Temp``**
			
			    - **``Descripción``**: Carpeta de archivos temporales del sistema.
			    - **``Propósito``**: Almacena archivos temporales creados por el sistema y las aplicaciones.
			    -  **``Vulnerabilidades``**:
			     
			        - **Inyección de malware**: Los atacantes pueden dejar scripts maliciosos que otros procesos podrían ejecutar.
			    -  **``Mitigación``**:
			     
			        - Limpiar regularmente los archivos temporales y configurar permisos restrictivos.
			        - Utilizar políticas de seguridad para bloquear la ejecución de archivos en este directorio.
			-  **``C:\inetpub``**
			
			    - **``Descripción``**: Carpeta por defecto para los archivos de Internet Information Services (IIS).
			    - **``Propósito``**: Almacena sitios web y aplicaciones alojadas en el servidor web IIS.
			    -  **``Vulnerabilidades``**:
			     
			        - **Acceso a contenido sensible**: Si está mal configurado, un atacante podría acceder a archivos privados.
			    -  **``Mitigación``**:
			     
			        - Restringir permisos en archivos y carpetas.
			        - Configurar correctamente el servidor IIS para evitar la divulgación de información no autorizada.
			-  **``C:\Windows\System32\Drivers``**
			
			    - **``Descripción``**: Contiene los controladores del sistema.
			    - **``Propósito``**: Facilita la comunicación entre el sistema operativo y el hardware.
			    -  **``Vulnerabilidades``**:
			     
			        - **Controladores maliciosos**: Un atacante puede intentar reemplazar controladores para obtener control a bajo nivel.
			    -  **``Mitigación``**:
			     
			        - Limitar la instalación de controladores solo a administradores.
			        - Utilizar herramientas de monitorización para detectar cambios en los controladores.
			-  **``C:\Windows\SysWOW64``**
			
			    - **``Descripción``**: Carpeta que contiene las versiones de 32 bits de las aplicaciones y bibliotecas del sistema en Windows de 64 bits.
			    - **``Propósito``**: Garantiza la compatibilidad de aplicaciones de 32 bits en sistemas de 64 bits.
			    -  **``Vulnerabilidades``**:
			     
			        - **Inyección de código**: Los atacantes pueden intentar reemplazar archivos en este directorio.
			    -  **``Mitigación``**:
			     
			        - Mantener permisos restrictivos y realizar auditorías de integridad.
			-  **``C:\Windows\Logs``**
			
			    - **``Descripción``**: Carpeta que contiene logs de eventos y otros registros del sistema.
			    - **``Propósito``**: Permite la monitorización y auditoría de eventos del sistema y aplicaciones.
			    -  **``Vulnerabilidades``**:
			     
			        - **Manipulación de logs**: Un atacante podría modificar o eliminar registros para ocultar sus actividades.
			    -  **``Mitigación``**:
			     
			        - Configurar políticas para el acceso y retención de logs.
			        - Implementar un sistema de auditoría externa para mantener una copia segura de los registros.
			-  **``Registro de Windows`` (Windows Registry)**
			
			    - **``Ubicación``**: El registro de Windows no es una carpeta física, sino una base de datos jerárquica utilizada para almacenar configuraciones del sistema.
			    - **``Propósito``**: Guarda configuraciones de sistema, usuario y aplicaciones. Rutas importantes incluyen `HKEY_LOCAL_MACHINE` y `HKEY_CURRENT_USER`.
			    -  **``Vulnerabilidades``**:
			     
			        - **Modificación no autorizada**: Los atacantes pueden alterar configuraciones críticas y persistir malware.
			    -  **``Mitigación``**:
			     
			        - Restringir el acceso a usuarios con privilegios administrativos.
			        - Monitorizar cambios en el registro utilizando herramientas de auditoría.
			-  **``C:\Windows\WinSxS``**
			
			    - **``Descripción``**: Almacena varias versiones de bibliotecas de sistema para asegurar la compatibilidad de aplicaciones.
			    - **``Propósito``**: Permite que varias versiones de un archivo coexistan en el sistema.
			    -  **``Vulnerabilidades``**:
			     
			        - **``Infección de bibliotecas compartidas``**: Un atacante podría intentar inyectar código malicioso en bibliotecas del sistema.
			    -  **``Mitigación``**:
			     
			        - Mantener permisos restrictivos y realizar auditorías de integridad.
		-  <strong style ="color: Red;">Ataque</strong>: **Flujos de datos alternativos**
		
			^uhm8
			Flujos de Datos Alternativos ([[ADS (Alternate Data Stream)]]) en NTFS se exploró cómo NTFS almacena información adicional en archivos mediante los flujos de datos alternativos.
			
			- **``Definición``:** En NTFS, los archivos se componen de atributos, como el nombre del archivo y marcas de tiempo. El atributo **``$DATA``** almacena los datos principales del archivo. Los flujos de datos alternativos (ADS) permiten conectar información adicional a un archivo existente.
			- **``Uso``:** Algunas aplicaciones utilizan ADS para almacenar datos extra, lo cual puede ser útil pero también puede ser aprovechado por el malware para ocultar código malicioso.
		-  <strong style ="color: 40C4FF;">Protección</strong>: **Obtener información sobre usuarios y permisos en Linux**
		
			^RefObtenerInfoUsuariosLinux
			
			-  **Comandos del sistema**
			  
				- **``Descripción``**: Ejecutar comandos como `whoami`, `groups`, `id`, `ls -l`, `getent passwd`, `wheel`, etc., para listar usuarios y sus permisos.
				- **``Objetivo``**: Obtener información detallada sobre cuentas de usuario y sus privilegios.
			-  **Archivos de configuración**
			  
				- **``Descripción``**: Examinar archivos como `/etc/passwd`, `/etc/shadow`, y `/etc/group` para obtener detalles sobre usuarios y contraseñas.
				- **``Objetivo``**: Recopilar información crítica sobre usuarios y sus credenciales.
			
			Los comandos `getent group`,  `getent passwd` y `cat /etc/sudoers` en sistemas Linux se utilizan para acceder a la base de datos de información de los usuarios y grupos del sistema.
			
			-  El comando `getent passwd` obtiene información sobre todos los usuarios del sistema a partir de la base de datos de usuarios, que puede incluir tanto usuarios locales como usuarios de directorios remotos (como LDAP) si están configurados. 
			
				Al ejecutar `getent passwd`, la salida es una lista de usuarios en el formato siguiente: `username:x:UID:GID:comment:home_directory:shell`
				
				- **``username``**: Nombre de usuario.
				- **``x``**: Indica que la contraseña está almacenada de forma segura (generalmente en `/etc/shadow`).
				- **``UID``**: Identificador único del usuario (número que identifica al usuario).
				- **``GID``**: Identificador de grupo del usuario (número que identifica al grupo principal al que pertenece).
				- **``comment``**: Información adicional sobre el usuario, como el nombre completo o una descripción.
				- **``home_directory``**: Ruta al directorio personal del usuario.
				- **``shell``**: Shell predeterminado del usuario (por ejemplo, `/bin/bash`).
			-  El comando `getent group` obtiene información sobre todos los grupos del sistema a partir de la base de datos de grupos.
			
				Al ejecutar `getent group`, la salida es una lista de grupos en el formato siguiente: `groupname:x:GID:user1,user2,user3`
				
				- **``groupname``**: Nombre del grupo.
				- **``x``**: Indica que la contraseña del grupo (si existe) no se muestra.
				- **``GID``**: Identificador único del grupo.
				- **``user1,user2,user3``**: Lista de usuarios que pertenecen a este grupo.
			-  El comando `sudo cat /etc/shadow` se utiliza en sistemas Linux para mostrar el contenido del archivo `/etc/shadow`, que contiene información sensible sobre las cuentas de usuario del sistema.
			
				El archivo `/etc/shadow` tiene una estructura de líneas donde cada línea corresponde a un usuario en el sistema y tiene el siguiente formato: `usuario:contraseña_encriptada:última_fecha_cambio:min_días:max_días:advertencia:inactividad:expiración`
				
				- **``usuario``**: Nombre de la cuenta de usuario.
				- **``contraseña_encriptada``**: La contraseña del usuario, encriptada. Si está vacía, significa que la cuenta está deshabilitada.
				- **``última_fecha_cambio``**: La fecha del último cambio de contraseña (en días desde el 1 de enero de 1970).
				- **``min_días``**: El número mínimo de días que debe pasar antes de que el usuario pueda cambiar su contraseña.
				- **``max_días``**: El número máximo de días que la contraseña es válida.
				- **``advertencia``**: El número de días antes de que expire la contraseña en que el usuario será advertido.
				- **``inactividad``**: El número de días después de que una contraseña haya expirado antes de que la cuenta sea desactivada.
				- **``expiración``**: La fecha en que la cuenta se desactiva (en días desde el 1 de enero de 1970).
				
				**Información obtenible para la recopilación de información**
				
				Al ejecutar `sudo cat /etc/shadow`, se puede obtener la siguiente información:
				
				1. **``Contraseñas encriptadas``**:
				
				    - Aunque no se puede ver la contraseña en texto claro, se pueden obtener las contraseñas encriptadas que podrían ser vulnerables a ataques de fuerza bruta o cracking utilizando herramientas como `John the Ripper` o `Hashcat`.
				2. **``Estructura de cuentas``**:
				
				    - Se puede ver qué cuentas existen en el sistema, lo que ayuda a los atacantes a identificar usuarios potencialmente valiosos (como administradores).
				3. **``Políticas de contraseñas``**:
				
				    - Los campos de `min_días`, `max_días`, `advertencia` y `inactividad` permiten entender las políticas de gestión de contraseñas de la organización, lo que puede indicar debilidades en la seguridad.
				4. **``Cuentas deshabilitadas``**:
				
				    - Si hay líneas con contraseñas vacías, esto indica que esas cuentas están deshabilitadas, lo cual es útil para identificar posibles objetivos.
				5. **``Información de última modificación``**:
				
				    - La fecha del último cambio de contraseña puede ser útil para determinar si las contraseñas son viejas o si han sido actualizadas recientemente, lo que puede influir en los métodos de ataque.
			-  En sistemas Linux, el grupo **`wheel`** el grupo `wheel` es un grupo de usuarios que se utiliza en sistemas Unix y Linux para otorgar a sus miembros privilegios especiales. Generalmente, está relacionado con la capacidad de ejecutar comandos como superusuario (root) o realizar tareas administrativas que requieren permisos elevados.
			
				- En muchas distribuciones de Linux (especialmente aquellas basadas en Red Hat, como CentOS o Fedora), para que un usuario pueda ejecutar `su` y cambiar al usuario root sin serle solicitada la contraseña de root, debe ser miembro del grupo `wheel`.
				- Esto se implementa para proporcionar un nivel de seguridad adicional, restringiendo el acceso al comando `su` solo a usuarios de confianza.
		-  <strong style ="color: 40C4FF;">Protección</strong>: **Obtener información sobre usuarios y permisos en Windows**
		
			^uhm6
			
			-  **Comandos del sistema**
			
			    - **`Descripción`**: Ejecutar comandos como `net user`, `net localgroup`, `whoami`, `icacls`, entre otros, para listar usuarios y sus permisos.
			    - **`Objetivo`**: Obtener información detallada sobre cuentas de usuario, sus privilegios y grupos a los que pertenecen.
			-  **Archivos de configuración**
			
			    - **`Descripción`**: Examinar archivos como `C:\Windows\System32\config\SAM` y `C:\Windows\System32\config\SYSTEM` (con privilegios elevados) para obtener detalles sobre usuarios y grupos, aunque estos archivos suelen estar protegidos.
			    - **`Objetivo`**: Recopilar información crítica sobre los usuarios, contraseñas y configuraciones del sistema.
			
			**Comandos y herramientas comunes en Windows**:
			
			-  El comando `net user` se utiliza para obtener información sobre las cuentas de usuario en un sistema Windows.
			
			    Al ejecutar `net user`, la salida muestra los usuarios configurados en el sistema, y un formato típico de la salida es el siguiente:
				
				    Nombre de usuario               DefaultAccount
				    Comentarios                     El usuario predeterminado de cuenta del sistema.
				    Grupo(s) de los que forma parte   None
				    Fecha de última modificación     20/09/2021 12:01
				
			    - **Nombre de usuario**: Nombre de la cuenta de usuario.
			    - **Grupo(s) de los que forma parte**: Muestra a qué grupos pertenece el usuario (como `Administradores`).
			    - **Fecha de última modificación**: Muestra la última vez que se modificaron las credenciales del usuario.
			-  El comando `net localgroup` muestra todos los grupos locales en el sistema y sus miembros.
		    
			    Al ejecutar `net localgroup`, la salida muestra una lista de los grupos locales configurados en el sistema, como:
				
			    Nombre de grupo    Miembros
			    -----------------------------------
			    Administradores    John, Jane
			    Users              Guest, User1
				
			    - **Nombre de grupo**: Nombre del grupo local en el sistema.
			    - **Miembros**: Los usuarios que pertenecen a cada grupo.
			-  El comando `whoami` se utiliza para obtener información sobre el usuario actualmente autenticado.
		    
			    La salida será algo como:
				
			    dominio\usuario
				
			    - **``dominio``**: El dominio de la red (si aplica).
			    - **``usuario``**: El nombre de la cuenta de usuario en sesión.
			-  El comando `icacls` se utiliza para mostrar y configurar permisos de archivos y directorios en Windows.
		    
			    Un ejemplo básico de `icacls` sería:
				
			    icacls "C:\ruta\a\archivo"
				
			    La salida podría ser algo similar a:
				
			    C:\ruta\a\archivo Everyone:(R)
			    C:\ruta\a\archivo Administrators:(F)
				
			    - **``Everyone``**: Grupo de usuarios.
			    - **``Administrators``**: Grupo de administradores.
			    - **``(R)``**: Permiso de solo lectura.
			    - **``(F)``**: Permiso de control total.
			
			**Información obtenible para la recopilación de información**:
			
			-  **Usuarios y sus privilegios**:
			
			    Al ejecutar `net user` y `net localgroup`, se obtiene una lista completa de las cuentas y grupos del sistema, lo cual permite obtener información crítica sobre las cuentas de usuario y las configuraciones de privilegios.
			-  **Políticas de seguridad**:
			
			    El comando `icacls` permite verificar las configuraciones de seguridad de archivos y directorios específicos. Esto ayuda a identificar los archivos sensibles y sus permisos asociados, detectando posibles debilidades en la configuración de seguridad.
			-  **Acceso a grupos privilegiados**:
			
			    Los usuarios que pertenecen al grupo **Administradores** tienen acceso a privilegios elevados. Observar los miembros de este grupo es esencial para identificar cuentas con privilegios más altos.
			
			**Controles de seguridad en Windows**:
			
			-  **Controles de identidad**:
			
			    En Windows, los controles de identidad se implementan mediante herramientas como **Windows Defender Credential Guard** o el uso de **autenticación multifactor**. Estos controles permiten verificar la identidad de los usuarios y prevenir el acceso no autorizado.
			-  **Controles de protección**:
			
			    Los controles de protección en Windows incluyen el uso de **antivirus**, **firewalls** y **políticas de seguridad de contraseñas**. Las políticas de contraseñas, por ejemplo, pueden configurarse a través de las **Políticas de Grupo Local** para imponer requisitos de complejidad, longitud y caducidad.
			-  **Controles de redes**:
			
			    Windows utiliza **firewalls** de red y **VPNs** para proteger los accesos a través de redes inseguras. Configurar un firewall correctamente en Windows es fundamental para impedir el acceso no autorizado a los recursos de la red.
			-  **Controles de detección**:
			
			    Herramientas como **Windows Defender** y **Event Viewer** permiten la **detección de intrusiones** y la monitorización de eventos de seguridad en tiempo real. Estos sistemas alertan sobre comportamientos sospechosos o potencialmente maliciosos.
			-  **Controles de respuesta**:
			
			    En Windows, los controles de respuesta incluyen herramientas como **Automated Incident Response** (AIR) o **Windows Defender ATP**, que pueden automatizar las respuestas a incidentes de seguridad, como la desconexión de una cuenta comprometida.
			-  **Controles de recuperación**:
			
			    En caso de un ataque o de una brecha de seguridad, **Windows Backup** y las **copias de seguridad del sistema** permiten restaurar la funcionalidad del sistema a su estado previo y minimizar el impacto de una pérdida de datos.
		-  <strong style ="color: SpringGreen;">Reto</strong>: **Contraseña reto comandos**:
		
			-  `user1` - `user1` 
			-  `user2` - `Alakazam65`
			  
				Lo conseguí dirigiéndome a la ruta ``home/user2/contraseña_user2.txt ``
			-  `user3` - `Psyduck54`
			  
				Lo conseguí en el dir. `home/user3/` leyendo el archivo `.historial` ya que el archivo pertenece a un grupo en particular.
			-  `user4` - `Slowpoke79`
			  
				-  Al ingresar al Dir. `user4` existe un archivo perteneciente a un grupo en particular que accesible desde ``user2`` este archivo me proporciona una contraseña `qwerty67890` para ejecutar el archivo `contraseña.txt.cpt`.
				   
					Para desencriptar un archivo con la extensión `.cpt`, que indica que está cifrado con el programa **CybSecure**, necesitarás seguir estos pasos. Mover tanto `contraseña.txt.cpt` y `dame_pass.sh` al directorio `tmp`. Puedes realizar esto de dos formas:
				-  Ejecutando `dame_pass.sh` y añadiendo el token esto descifrara `contraseña.txt.cpt` o ejecutando `ccrypt -d contraseña.txt.cpt` or `ccdecrypt contraseña.txt.cpt -K $key` y añadiendo el token.
			-  `user5` - CTF = `CALEIDOSCOPIO`
			  
				- Como ``user4`` forma parte del grupo sudo solo tenemos que leer `exito.txt` con permisos de sudo.
				- Otra forma es agregar el archivo `exito.txt` al usuario 4
		-  <strong style ="color: SpringGreen;">Reto</strong>: **Procesos, subprocesos y servicios**
		
			![[explorar-procesos-subprocesos-controles-registro-windows.pdf]]
			Un proceso en Windows es cualquier programa en ejecución. Puede ser una aplicación individual o un servicio que se ejecuta en segundo plano. Cada proceso está compuesto, al menos, por un subproceso, que es una parte del proceso que puede ejecutarse de manera independiente. 
			
			Los procesos en Windows tienen su propio espacio de dirección virtual, lo que significa que los subprocesos dentro de un proceso no pueden acceder directamente a la memoria de otros procesos. Esto proporciona aislamiento y seguridad, ya que evita que los errores o problemas en un proceso afecten a otros procesos.
			
			Windows es capaz de ejecutar múltiples subprocesos simultáneamente, dependiendo del número de procesadores disponibles en la computadora. Esto permite realizar múltiples tareas de manera eficiente, mejorando así el rendimiento del sistema.
			
			**Administración de procesos en Windows**
			
			Para administrar los procesos en Windows, se utiliza el **Administrador de tareas**. Esta herramienta muestra una lista de todos los procesos en ejecución, junto con información detallada sobre el uso de CPU, memoria y otros recursos por cada proceso. Desde el Administrador de tareas, se pueden finalizar procesos, lo que es útil para detener aplicaciones que no responden o consumen recursos innecesariamente.
			
			**Servicios en Windows**
			
			Los servicios son programas diseñados para ejecutarse en segundo plano y proporcionar funcionalidades extendidas y continuas al sistema operativo y a las aplicaciones. Estos pueden iniciarse automáticamente al arrancar Windows o ser iniciados manualmente según sea necesario. Algunos ejemplos de servicios comunes son los encargados de la conexión de red, la administración de impresoras, la sincronización de tiempo y más.
			
			Administración de servicios en Windows
			
			La configuración de los servicios en Windows se realiza a través de la herramienta de **Servicios** en el Panel de control. Desde aquí, se puede ver una lista de todos los servicios instalados en el sistema, así como su estado (iniciado, detenido, automático, manual, etc.). 
			
			Es importante ser cuidadoso al modificar la configuración de los servicios, ya que algunos programas dependen de servicios específicos para funcionar correctamente. Desactivar o detener un servicio sin comprender sus implicaciones puede afectar adversamente el funcionamiento de otras aplicaciones o del sistema en general.
		-  <strong style ="color: SpringGreen;">Reto</strong>: **Crear cuenta de usuario**
		
			![[crear-cuentas-usuario-introducción.pdf]]
		-  <strong style ="color: SpringGreen;">Reto</strong>: **Auditar red Windows**
		
			![[utilizar-windows-powerShell.pdf]]
		-  <strong style ="color: SpringGreen;">Reto</strong>: **Administrador de tareas de Windows Objetivos**
		
			![[administrador-tareas-windows.pdf]]
		-  <strong style ="color: SpringGreen;">Reto</strong>: **Monitorear y administrar recursos en sistemas Windows**
		
			![[monitorear-administrar-recursos-sistema-windows.pdf]]
		-  <strong style ="color: 40C4FF;">Protección</strong>: **Comando netstat para análisis de conexiones**
		
			El comando `netstat` es una herramienta poderosa en la detección de malware y la gestión de conexiones de red en sistemas Windows. Aquí te explico cómo utilizarlo de manera efectiva. El comando `netstat` se utiliza para mostrar estadísticas de protocolos de red y conexiones de red activas. Cuando se ejecuta sin argumentos adicionales, muestra todas las conexiones activas:
			
			**Identificación de conexiones sospechosas**
			
			Para detectar conexiones sospechosas que podrían indicar la presencia de malware, es crucial utilizar el comando `netstat` con opciones adicionales. La opción `netstat -abno` es particularmente útil:
			
			- **-a**: Muestra todas las conexiones y puertos escuchando.
			- **-b**: Muestra el nombre del ejecutable que está usando el puerto.
			- **-n**: Muestra direcciones y números de puerto en formato numérico.
			- **-o**: Muestra el identificador de proceso (PID) asociado a cada conexión.
			
			**Interpretación de la Salida**
			
			Al ejecutar `netstat -abno`, obtienes una lista detallada de conexiones TCP activas con sus respectivos PIDs y los nombres de los servicios o ejecutables asociados. Esto te permite identificar qué programas están utilizando los puertos y si alguno de ellos es desconocido o sospechoso.
			
			Por ejemplo, podrías encontrar conexiones como:
			
				TCP    0.0.0.0:445       0.0.0.0:0       LISTENING       4            [svchost.exe]
			
			- **Proto**: Protocolo de la conexión (TCP en este caso).
			- **Local Address**: Dirección y puerto local.
			- **Foreign Address**: Dirección y puerto remoto.
			- **State**: Estado de la conexión (LISTENING indica un puerto abierto).
			- **PID**: Identificador de proceso asociado.
			- **Executable**: Nombre del programa o servicio asociado.
			
			**Acciones siguientes**
			
			1. **``Investigación``**: Verifica cada proceso para asegurarte de que sea legítimo. Busca el nombre del proceso y el PID en el Administrador de tareas para confirmar su legitimidad.
			2. **``Desactivación``**: Si identificas un proceso sospechoso, desactívalo desde el Administrador de tareas.
			3. **``Limpieza de malware``**: Utiliza software de eliminación de malware para limpiar la computadora si sospechas de infección.
		-  <strong style ="color: ;">Herramientas comunes en un SOC</strong>
		
			A continuación se detallan algunas herramientas esenciales que suelen encontrarse en un SOC y su función:
			
			-  **Software de captura de paquetes**
			
				**``Descripción``:** Herramienta fundamental que permite a los analistas del SOC observar y comprender cada aspecto de una transacción de red. Un ejemplo destacado es Wireshark, conocido por su capacidad de captura y análisis de paquetes de red.
			-  **Herramientas de análisis de malware**
			
				**``Descripción``:** Estas herramientas permiten a los analistas ejecutar y observar el comportamiento de malware de manera segura, sin comprometer el sistema subyacente.
			-  **Sistemas de detección de intrusiones** (IDS)
			
				**``Descripción``:** Utilizados para monitorear y analizar el tráfico en tiempo real, los IDS activan acciones predefinidas si detectan comportamientos sospechosos que coinciden con reglas establecidas.
			-  **Firewalls**
			
				**``Descripción``:** Software que controla el tráfico de red basado en reglas predefinidas, determinando si se permite o se bloquea el flujo de datos hacia y desde la red o dispositivos.
			-  **Administradores de registros**
			
				**``Descripción``:** Estos sistemas gestionan los registros de eventos generados por la red, facilitando la monitorización y análisis de grandes volúmenes de registros.
			-  **Administrar información y eventos de seguridad** (SIEM)
			
				**``Descripción``:** Proporciona análisis en tiempo real de alertas y registros generados por dispositivos de red como IDS y Firewalls, ayudando a los analistas a detectar y responder rápidamente a amenazas.
			-  **Sistema de etiquetes**
			
				**``Descripción``:** Utilizado para gestionar y registrar la asignación de tareas, los sistemas de gestión de etiquetes son cruciales para el manejo eficiente de alertas de seguridad, asignándolas a los analistas adecuados para su revisión y resolución.
		-  Lab: <strong style ="color: SpringGreen;">Trabajar con archivos de texto en la CLI Objetivos</strong>
		
			![[trabajar-archivos-texto-cli.pdf]]
		-  Lab: <strong style ="color: SpringGreen;">Servidor Linux</strong>
		
			![[servidores-inux.pdf]]
		-  Lab: <strong style ="color: SpringGreen;">Ubicar archivos de registro</strong>
		
			![[ubicar-archivos-registro.pdf]]




	-  **16.1.1 Ataques a los fundamentos**
	
		-  **Ataque Smurf Fix**
		
			Un **[ataque Smurf ](https://github.com/jamaliasultanajisha/ICMP_Smurf_Attack)** es un tipo de ataque DoS que explota la naturaleza del **Protocolo de Control de Mensajes de Internet (ICMP)**, específicamente las solicitudes de "eco" (ping). En un ataque Smurf, el atacante envía solicitudes ICMP "Echo Request" (ping) a una dirección de difusión de una red, pero **suplantando la dirección de origen** con la dirección IP de la víctima. Esto hace que todos los dispositivos de la red de destino respondan a la víctima, inundándola con respuestas ICMP, lo que puede hacer que la víctima se quede sin recursos y pierda conectividad.
			
			1. El atacante envía paquetes ICMP Echo Request (ping) a la dirección de difusión (`broadcast`) de una red.
			2. La solicitud ICMP incluye una dirección IP falsificada (spoofed), que es la dirección IP del objetivo que desea ser atacado.
			3. Todos los dispositivos en la red responden al ping con un mensaje ICMP Echo Reply dirigido a la dirección IP falsificada.
			4. Como resultado, el objetivo recibe un gran volumen de tráfico no solicitado, lo que puede saturar sus recursos y hacer que se caiga.
			
			![[scrip_smurf_fix.py]]
	-  **17.1.1 Atacando lo que hacemos**
	
		-  **Lab**: <strong style ="color: SpringGreen;">Exploración de tráfico de DNS</strong>
		
			![[17.1.7 - Exploración de tráfico de DNS.pdf]]
		
		-  **Lab**: <strong style ="color: SpringGreen;">Atacar una base de datos MySQL</strong>
		
			![[17.2.6 - Atacar una base de datos MySQL.pdf]]
		
		-  **Lab**: <strong style ="color: SpringGreen;">Leer archivos de registro de un servidor</strong>
		
			![[17.2.7 - Leer archivos de registro de un servidor.pdf]]
	-  **21.1.1 Criptografía**
	
		-  **Criptografía**
		  
			-  **Protegiendo las Comunicaciones**
			
				Para garantizar la seguridad de los datos a medida que viajan a través de una red, es esencial implementar varios principios fundamentales, los cuales son:
				
				- **Integridad de los datos**: Asegura que los datos no hayan sido alterados en tránsito. El uso de algoritmos de hash (como SHA-2 o SHA-3) garantiza que cualquier cambio accidental o malicioso en los datos pueda ser detectado. **MD5**, aunque todavía se usa ampliamente, es considerado inseguro y vulnerable a ataques, por lo que debe evitarse.
				- **Autenticación de origen**: Verifica que el remitente de los datos sea quien dice ser, y que el mensaje no sea falso. Esto se puede implementar mediante el uso de HMAC, un tipo de autenticación que utiliza una clave secreta adicional para garantizar que el mensaje proviene de una fuente legítima.
				- **Confidencialidad de los datos**: Asegura que solo los usuarios autorizados puedan leer los mensajes. La confidencialidad se garantiza mediante algoritmos de encriptación, tanto **simétrica** (como AES y DES) como **asimétrica** (como RSA y PKI).
				- **Imposibilidad de Negación de los Datos**: Asegura que el remitente no pueda negar la validez de un mensaje que ha enviado. Se logra mediante el uso de firmas digitales o características únicas relacionadas con el tratamiento del mensaje.
			-  **Funciones del Hash Criptográfico**
			
				El **hash criptográfico** es fundamental para verificar la integridad de los datos y garantizar que no han sido alterados durante su tránsito. Los algoritmos de hash aplican una **función matemática unidireccional** a un conjunto de datos de longitud arbitraria, produciendo un **valor de longitud fija** (llamado **hash**).
				
				- **Propiedades del Hash**:
				
				    - La entrada puede ser de cualquier longitud.
				    - La salida es de longitud fija.
				    - Es fácil calcular el valor hash para cualquier mensaje dado.
				    - La función de hash es **unidireccional** (es decir, no se puede revertir).
				    - No debe haber **colisiones**, es decir, dos entradas diferentes no deben producir el mismo valor hash.
			-  **Funcionamiento del Hash Criptográfico**
			
				El proceso de hash funciona matemáticamente con la fórmula **h = H(x)**, donde:
				
				- **x** es el mensaje de entrada.
				- **H(x)** es la función de hash aplicada a **x**, que genera el valor hash **h**.
				
				**Características de un algoritmo de hash**:
				
				- Es fácil de calcular para cualquier valor de entrada.
				- Es difícil revertir el proceso para obtener el mensaje original a partir del valor hash.
				- Debe ser resistente a colisiones, es decir, dos entradas diferentes no deben generar el mismo valor hash.
			-  **MD5 y SHA**
			
				- **MD5**: Genera un valor hash de 128 bits. Aunque fue popular en el pasado, se considera obsoleto debido a su vulnerabilidad a los ataques de colisión. No debe usarse en entornos de seguridad crítica.
				- **SHA-1**: Genera un hash de 160 bits, también se considera obsoleto debido a las vulnerabilidades que han sido descubiertas.
				- **SHA-2**: La familia más moderna de funciones de hash, que incluye SHA-224, SHA-256, SHA-384 y SHA-512. Se recomienda usar SHA-2 para la mayoría de las aplicaciones.
				- **SHA-3**: La última generación de algoritmos hash, que ofrece una mayor seguridad que SHA-2 y se recomienda siempre que sea posible.
			-  **Autenticación de Origen**
			
				La autenticación de origen asegura que el mensaje recibido proviene realmente de quien dice provenir. Un método común para esto es el **HMAC** (código de autenticación de mensaje basado en hash).
				
				- **Funcionamiento de HMAC**:
				    - Utiliza una **clave secreta** y una **función de hash** para crear un valor hash que depende tanto del mensaje como de la clave.
				    - Solo las partes que comparten la clave secreta pueden generar o verificar correctamente el valor de HMAC.
				    - Si el valor HMAC calculado coincide con el valor HMAC adjunto al mensaje, se asegura que el mensaje no ha sido alterado y que proviene de la fuente legítima.
			-  **Integridad de los Datos y Autenticación de Origen**
			
				Combinar los procesos de **encriptación simétrica y asimétrica** asegura no solo la **confidencialidad** de los datos, sino también su **autenticidad** e **integridad**. La combinación de ambos asegura que los datos no hayan sido modificados durante la transmisión y que provienen realmente de la fuente esperada.
			-  **Diffie-Hellman (DH)**
			
				El algoritmo **Diffie-Hellman** (DH) permite a dos partes generar de manera segura una clave secreta compartida, sin necesidad de haberla intercambiado previamente. Este algoritmo se basa en matemáticas avanzadas, como la **exponenciación modular** y la **dificultad de calcular logaritmos discretos**.
				
				**Funcionamiento de Diffie-Hellman**:
				
				- Ambas partes **eligen un número público común**.
				- Cada parte **elige un valor secreto** y calcula un valor público utilizando este secreto y el número común.
				- Se intercambian los valores públicos, y luego cada parte utiliza su propio secreto y el valor público recibido para calcular la clave secreta compartida.
				
				**Seguridad**: El algoritmo se basa en la **dificultad** de calcular la clave secreta sin conocer los valores secretos, incluso si se conocen los valores públicos.
				
				**Aplicaciones de Diffie-Hellman**:
				
				- **VPNs** con **IPsec**.
				- **SSH** para **acceso remoto seguro**.
				- **Protocolos de comercio electrónico**.
			-  **Aplicaciones Comunes de Encriptación Asimétrica**
			
				- **VPNs con IPsec**: Se utiliza para **intercambiar claves** de forma segura.
				- **SSH**: Para un **acceso remoto seguro** a dispositivos de red.
				- **PGP**: Para asegurar **comunicaciones por correo electrónico** y proporcionar **autenticación criptográfica**.
		
		-  **Lab**: <strong style ="color: SpringGreen;">Creación de códigos</strong>
		
			![[21.0.3 - Creación de códigos.pdf]]
		
		-  **Lab**: <strong style ="color: SpringGreen;">Convertir Elementos en Hashes</strong>
		
			![[21.1.6 - Convertir Elementos en Hashes.pdf]]
		
		-  **Lab**: <strong style ="color: SpringGreen;">Encriptar y desencriptar datos utilizando OpenSSL</strong>
		
			![[21.2.10 - Encriptar y Desencriptar Datos Utilizando OpenSSL.pdf]]
		
		-  **Lab**: <strong style ="color: SpringGreen;">Examinación de Telnet y SSH en Wireshark</strong>
		
			![[21.2.12 - Examinación de Telnet y SSH en Wireshark.pdf]]
		
		-  **Lab**: <strong style ="color: SpringGreen;">Encriptar y desencriptar utilizando una herramienta de hacker</strong>
		
			![[21.2.11 - Encriptar y Desencriptar Utilizando una Herramienta de Hacker.pdf]]
		
		-  **Lab**: <strong style ="color: SpringGreen;">Almacenes de autoridades emisoras de certificados</strong>
		
			![[21.4.7 - Almacenes de autoridades emisoras de certificados.pdf]]
	-  **22.1.1 Protección de terminales**
	
		-  **Firewall en Linux**
		
			-  **iptables**:
			    
			    - Es una herramienta usada en **Linux** para configurar **reglas de acceso** a la red, que forma parte de **Netfilter**, el sistema de filtrado de paquetes del kernel de Linux.
			-  **nftables**:
			    
			    - Es la sucesora de **iptables** en **Linux**. Usa una **máquina virtual simple** en el kernel para inspeccionar y filtrar paquetes según reglas predefinidas.
			-  **TCP Wrappers**:
			    
			    - Es un **sistema de control de acceso y registro** para Linux. Permite el filtrado de paquetes basándose en **direcciones IP** y **servicios de red**, proporcionando una capa adicional de protección.
	-  **25.1.1 Datos de seguridad de la red**
	
		-  **Lab**: <strong style ="color: SpringGreen;">Explorar una implementación de NetFlow</strong>
		
			![[25.3.10 -Explorar una implementación de NetFlow.pdf]]
			
			![[25.3.10 -Explorar una implementación de NetFlow.pka]]
		-  **Lab**: <strong style ="color: SpringGreen;">Generar archivos de registro desde varias fuentes</strong>
		
			![[25.3.11 - Generar archivos de registro desde varias fuentes.pdf]]
			
			![[25.3.11 - Generar archivos de registro desde varias fuentes.pka]]
		-  **Lab**: <strong style ="color: SpringGreen;">Reglas de Snort y firewalls</strong>
		
			![[26.1.7 - Reglas de Snort y firewalls.pdf]]
		-  **Lab**: <strong style ="color: SpringGreen;">Conversión de datos a un formato universal</strong>
		
			![[27.1.5 - Conversión de datos a un formato universal.pdf]]
		-  **Lab**: <strong style ="color: SpringGreen;">Tutorial de expresiones regulares</strong>
		
			![[27.2.9 - Tutorial de expresiones regulares.pdf]]
		-  **Lab**: <strong style ="color: SpringGreen;">Extraer un ejecutable de un PCAP</strong>
		
			![[27.2.10 - Extraer un ejecutable de un PCAP.pdf]]
		-  **Lab**: <strong style ="color: SpringGreen;">Interpretar datos HTTP y DNS</strong>
		
			![[27.2.12 - Interpretar datos HTTP y DNS para aislar al actor de la amenaza.pdf]]
		-  **Video: Interpretar datos HTTP y DNS**
		
			![[Interpretar datos HTTP y DNS para aislar a los actores maliciosos.mp4]]
		-  **Lab**: <strong style ="color: SpringGreen;">Aislamiento de hosts afectados mediante 5 tuplas</strong>
		
			![[27.2.14 - Aislamiento de hosts afectados mediante 5 tuplas.pdf]]
		-  **Video - Aislamiento de hosts afectados mediante 5 tuplas**
		
			![[Aislamiento de hosts afectados mediante 5 tuplas.mp4]]
		-  **Lab**: <strong style ="color: SpringGreen;">Investigar un ataque de malware Exploit</strong>
		
			![[27.2.15 - Investigar un ataque de malware Exploit.pdf]]
		-  **Lab**: <strong style ="color: SpringGreen;">Investigación de un ataque en un host de Windows</strong>
		
			![[27.2.16 - Investigación de un ataque en un host de Windows.pdf]]
		-  **Lab**: <strong style ="color: SpringGreen;">Manejo de incidentes</strong>
		
			![[28.4.13 - Manejo de incidentes.pdf]]





























































































































	

