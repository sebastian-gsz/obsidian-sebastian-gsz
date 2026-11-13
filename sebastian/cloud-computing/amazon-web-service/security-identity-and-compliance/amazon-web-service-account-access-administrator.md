


-  **Centralización del acceso raíz para cuentas de miembro**

	En AWS IAM e integra con AWS Organizations permite administrar, monitorear y controlar de forma centralizada las credenciales del **usuario raíz** de todas las cuentas secundarias o miembro de tu organización.
	
	Es una funcionalidad de seguridad que permite **eliminar por completo las credenciales permanentes del usuario raíz** (contraseñas, claves de acceso y MFA) en las cuentas miembro.
	
	Tradicionalmente, cada cuenta de AWS tiene su propio usuario raíz con privilegios ilimitados, lo que obligaba a gestionarlas o protegerlas de manera independiente en decenas o cientos de cuentas. Con esta opción, puedes desactivarlas y gestionarlas desde una única cuenta de administración o un administrador delegado, manteniendo un procedimiento seguro de emergencia (_break-glass_) solo cuando sea estrictamente necesario.
	
	**¿Qué beneficios tiene?**
	
	-  **Seguridad mejorada:** Al eliminar las credenciales raíz de las cuentas miembro, reduces drásticamente la superficie de ataque; ya nadie puede usar claves o contraseñas raíz permanentes para vulnerar esas cuentas.
	-  **Cumplimiento y auditoría:** Facilita demostrar ante los auditores que las cuentas miembro operan bajo estrictas normas de seguridad, comprobando que no existen credenciales de usuario raíz activas en el día a día.
	-  **Control total centralizado:** Permite realizar tareas privilegiadas que normalmente requerirían el acceso root (como desbloquear políticas de S3 o SQS bloqueadas) o autorizar recuperaciones de contraseña de forma controlada desde una cuenta central segura, sin exponer el acceso general.


