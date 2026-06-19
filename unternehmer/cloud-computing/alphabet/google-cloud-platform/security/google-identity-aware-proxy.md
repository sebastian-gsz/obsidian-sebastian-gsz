
-  **Documentación**

	- **[Documentación de Identity-Aware Proxy ](https://docs.cloud.google.com/iap/docs?hl=es_419)**
	- 

**Google Cloud Identity‑Aware Proxy (IAP) es un servicio de seguridad que protege aplicaciones y VMs usando identidad en lugar de redes, permitiendo acceso seguro sin VPN y aplicando políticas centralizadas de autenticación y autorización**

**``Nota``**: Identity‑Aware Proxy no es equivalente a Cognito. **IAP es un servicio de autorización centralizada que actúa como una puerta de seguridad** para tus aplicaciones alojadas en Google Cloud, eliminando la necesidad de VPNs tradicionales para el acceso interno.

![[Barra.gif]]

-  **Qué hace realmente Identity‑Aware Proxy (IAP)**

	IAP sirve para:
	
	- **proteger aplicaciones y servicios** detrás de un proxy de autenticación
	- **verificar identidad** antes de permitir acceso
	- **aplicar políticas de acceso basadas en IAM**
	- **evitar exponer servicios directamente a Internet**
	
	IAP es, en esencia: **Un reverse proxy con autenticación y autorización gestionada por Google.** No gestiona usuarios, no crea pools, no registra apps, no hace federación avanzada.
-  **Qué hace Cognito**

	Cognito es un **servicio de identidad completo**, que incluye:
	
	- **User Pools** → gestión de usuarios, contraseñas, MFA, login, signup
	- **Federación** con Google, Microsoft, Facebook, SAML, OIDC
	- **Identity Pools** → credenciales temporales de AWS
	- **Tokens JWT** para apps web y móviles
	
	Cognito es más parecido a:
	
	- Azure AD B2C
	- Auth0
	- Okta
	- Firebase Authentication
-  **Entonces, ¿Qué se parece a qué?**

	**IAP ≈ AWS ALB + OIDC Authentication**
	
	El equivalente más cercano en AWS sería:
	
	- **Application Load Balancer (ALB)** con
	- **OIDC Authentication** habilitada
	
	Porque ambos:
	
	- protegen aplicaciones
	- actúan como reverse proxy
	- verifican identidad antes de permitir acceso
	- no gestionan usuarios directamente
	
	**Cognito ≠ IAP**
	
	Cognito es un **Identity Provider**. IAP es un **Access Proxy**.
	
	Son piezas distintas en la arquitectura.