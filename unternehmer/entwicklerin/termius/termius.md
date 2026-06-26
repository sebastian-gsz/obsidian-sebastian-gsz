
![[barra.gif]]

A diferencia de los clientes SSH tradicionales que tratan cada conexión como una cadena de sesión separada, Termius proporciona un modelo estructurado para gestionar el acceso a la infraestructura.

Termius organiza el acceso a la infraestructura en torno a tres conceptos fundamentales: Bóvedas, Grupos y Anfitriones.

```
Vaults
└── Groups
	└── Hosts 
		├── SSH (port 22, key: prod-key)  
		├── SFTP  
		└── Telnet (port 23)
```

En lugar de pensar en términos de cadenas de conexión en bruto, Termius te permite pensar en términos de máquinas y entornos.

- **[[kanban-termius|Kanban Termius]]**
- **[Documentación Termius ](https://docs.termius.com/)**

![[barra.gif]]

-  **Aprende sobre las bóvedas**

	Las bóvedas en Termius son el **almacenamiento cifrado en la nube de extremo a** extremo para Hosts, Claves, Fragmentos, reglas de Reenvío de Puertos y Hosts Conocidos. Las bóvedas permiten **sincronizar** entre dispositivos y **compartir de forma segura** entre tu equipo.
	
	- Tu **bóveda personal** es para objetos que no están pensados para ser vistos por el equipo, como credenciales o servidores de prueba y en proceso de trabajo.
	- El **refugio del equipo** se crea automáticamente una vez que invitas a tu primer compañero. Esta bóveda se comparte con todos los miembros del equipo, permitiendo que tu equipo gestione la infraestructura juntos.
	- **Las bóvedas personalizadas de equipo** son bóvedas adicionales cuando tu empresa requiere **permisos detallados** y acceso controlado a la información entre los miembros del equipo. Úsalos para separar los datos por equipo, proyecto o entorno, y definir quién puede acceder a cada bóveda.














