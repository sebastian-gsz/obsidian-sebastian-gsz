---
def-type: atomic
version: 1
id: def-aws-systems-manager-run-command-lab
status: completed
category: cloud-computing
date: 2026-08-29
tags:
  - aws
  - systems-manager
  - ec2
  - alb
  - automatizacion
  - devops
aliases:
  - using the aws systems manager run command for automation
  - aws systems manager run command lab
---
Este laboratorio configura tres instancias de **Amazon EC2 (Amazon Linux 2023)** con componentes clave de automatización y administración:

*  **Agente de Systems Manager (SSM):** Viene preinstalado para permitir la gestión centralizada de las instancias (ejecución de comandos por lotes, parches e inventario).
*  **Perfil de Instancia IAM:** Cuenta con la política administrada **`AmazonSSMManagedInstanceCore`**, otorgando los permisos mínimos necesarios para que Systems Manager controle las instancias (como ejecutar scripts mediante *Activar comando*).
*  **Automatización mediante Datos de Usuario (*User Data*):** Al arrancar, cada instancia ejecuta un script que:
  
	*  Obtiene su propio ID utilizando el servicio de metadatos.
	*  Instala **Apache HTTP Server** con el administrador de paquetes `dnf`.
	*  Crea una página predeterminada (`index.html`) que muestra el ID de la instancia y el mensaje *"¡Hola, desde Apache!"*.
	*  Habilita e inicia el servicio de Apache automáticamente mediante `systemctl`.

A continuación, se muestra un ejemplo de los datos de usuario de Amazon EC2 que utilizan las tres instancias:

```Bash
#!/bin/bash

token=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` 
instance_id=$(curl -H "X-aws-ec2-metadata-token: $token" -v http://169.254.169.254/latest/meta-data/instance-id)
dnf install -y httpd
echo "<br><br><br><h4 align="Center">INSTANCE ID: $instance_id</h4><br><h1 align="Center">Hello, from Apache!</h1>" > /var/www/html/index.html
systemctl enable httpd
systemctl start httpd
```

En este laboratorio, el equilibrador de carga de aplicación se usa para distribuir el tráfico entrante del sitio web entre varios destinos (instancias de EC2) para lograr tolerancia a errores y baja latencia. Se definen los oyentes (puertos para escuchar) y las reglas (cómo enrutar las solicitudes en función del contenido) y, luego, se registran los destinos (como las instancias de EC2) para que se puedan enrutar las solicitudes. Una vez configurado el equilibrador de carga de aplicación, distribuye las solicitudes entrantes de los clientes de acuerdo con las reglas establecidas. Estas reglas ayudan a garantizar que cada objetivo registrado reciba su parte de la carga de solicitudes.
![[aws-using-systems-manager-for-automation.mp4]]
![[barra.gif]]
-  **Tarea 1: <strong style ="color:5d6d7e;">Arquitectura e Infraestructura Inicial</strong>**

	-  **Instancias EC2:** El laboratorio despliega tres instancias (`WebServer1`, `WebServer2` y `WebServer3`) ejecutando una AMI de Amazon Linux 2023. Estas instancias cuentan con:
	
	    -  El **agente de SSM** preinstalado.
	    -  Un **Perfil de instancia IAM** con la política administrada `AmazonSSMManagedInstanceCore`, que les otorga los permisos mínimos necesarios para comunicarse con el servicio Systems Manager.
	    -  Un script de **Datos de usuario (_User Data_)** que instala automáticamente el servidor web **Apache** y configura una página web predeterminada que muestra el ID único de cada instancia mediante el servicio de metadatos (IMDSv2).
	
	-  **Equilibrador de carga de aplicación (ALB):** Distribuye el tráfico web entrante (puerto 80) entre las tres instancias utilizando un algoritmo de tipo _Round Robin_ (por turnos).
-  **Tarea 2: <strong style ="color:5d6d7e;">Prueba Inicial y Migración con Run Command</strong>**

	-  **Verificación de apache:** Al ingresar al DNS del ALB, podrás comprobar cómo el tráfico rota y muestra las respuestas iniciales desde Apache (`Hello, from Apache!`).
	-  **Uso de activar comando (_Run Command_):** Utilizarás el documento predefinido `AWS-RunShellScript` para enviar un comando remoto a toda la flota de golpe, utilizando etiquetas de instancia (`ServerType: WebServer`). Este script:
	
	    1. Desinstalará Apache (`dnf remove -y httpd`).
	    2. Instalará y configurará **Nginx** (`dnf install -y nginx`).
	    3. Modificará la página de bienvenida para mostrar el ID de la instancia junto con el mensaje predeterminado de Nginx.
	    4. Desactivará la propiedad `if_modified_since` en la configuración de Nginx para evitar que el navegador almacene en caché la respuesta y te permita ver la rotación real del ALB entre las distintas instancias.
