

![[barra.gif]]
-  **Docker Engine**

	-  **Comportamiento en Linux**
	
		El grupo `docker` se crea de forma automática en el sistema cuando instalas Docker Engine. Su propósito principal es permitir que los usuarios añadidos a él puedan interactuar con el demonio de Docker sin depender de `sudo`.
	-  **Comportamiento en Windows**
	
		En los entornos de Windows con Docker Desktop, no se genera un grupo POSIX llamado `docker`. En su lugar, el instalador crea o utiliza un grupo de seguridad local de Windows denominado `docker-users`. Este grupo cumple una función equivalente para administrar los permisos de acceso a las características avanzadas y de virtualización del software.