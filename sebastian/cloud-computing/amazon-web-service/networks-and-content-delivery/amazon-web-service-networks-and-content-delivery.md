
-  **[Documentación de la nube privada virtual ](https://docs.aws.amazon.com/vpc/)**
![[barra.gif]]
-  **Virtual Private Cloud**

	-  **Flow Logs**
	
		Un **registro de flujo (VPC Flow Log)** sirve justamente para capturar información sobre el tráfico IP que entra y sale de las interfaces de red en tu subred.
		
		Permite registrar datos clave para auditorías de seguridad y resolución de problemas, tales como:
		
		-  **Direcciones IP** de origen y destino, así como los puertos utilizados.
		-  **Protocolos** de red (TCP, UDP, ICMP).
		-  **Volumen de tráfico** (cantidad de paquetes y bytes transmitidos).
		-  **Estado de la conexión** (`ACCEPT` para tráfico permitido por las reglas de seguridad o `REJECT` para tráfico bloqueado).
		
		Estos registros se envían normalmente a Amazon CloudWatch Logs o a un bucket de S3, lo que te permite analizar anomalías, investigar intentos de acceso no autorizados o cumplir con normativas de seguridad en tu infraestructura.
		
		**Casos de uso clave para emplear VPC Flow Logs:**
		
		-  **Diagnóstico de reglas de seguridad bloqueadas:** Cuando una aplicación deja de comunicarse repentinamente y sospechas que un Grupo de Seguridad (Security Group) o una ACL de red está bloqueando el tráfico, activas los registros de flujo filtrando los estados `REJECT`. Esto te permite ver exactamente qué IP intentó conectarse, a qué puerto y qué regla bloqueó el paquete para corregirla de inmediato.
		-  **Auditorías de seguridad e intrusiones (Forenses):** Cuando un servidor o aplicación sufre un comportamiento extraño o sospechas de un acceso no autorizado del exterior, y necesitas reconstruir el historial de conexiones para identificar si hubo IPs maliciosas escaneando puertos o intentando extraer datos de la red.
		-  **Verificación de tráfico en pasarelas o NAT:** Cuando configuras un NAT Gateway o un Internet Gateway y el tráfico de salida a internet falla o es más lento de lo esperado; al habilitar los flujos puedes auditar el volumen de paquetes y comprobar si las instancias privadas están enrutando correctamente hacia el exterior o si hay cuellos de botella.
		-  **Monitoreo de dependencias entre microservicios:** Cuando tienes arquitecturas complejas de microservicios distribuidos en varias subredes y necesitas descubrir qué servicios se comunican entre sí para documentar la arquitectura o validar que el tráfico interno fluye exclusivamente por los canales autorizados.