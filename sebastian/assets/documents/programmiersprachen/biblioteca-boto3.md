
-  **Documentación**

	-  **[Amazon SDK for Python ]([AWS SDK for Python (Boto3) Documentation](https://docs.aws.amazon.com/pythonsdk/))**
![[Barra.gif]]
-  **Funciones**

	-  **IAM**
	
		-  **[iam.list_users() ](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam/client/list_users.html):** Enumera los usuarios de IAM que tienen el prefijo de ruta especificado. Si no se especifica ningún prefijo de ruta, la operación devuelve todos los usuarios de la cuenta de AWS, si no hay ninguno, la operación devuelve una lista vacía.
		
			{
			    'Users': [
			        {
			            'Path': 'string',
			            'UserName': 'string',
			            'UserId': 'string',
			            'Arn': 'string',
			            'CreateDate': datetime(2015, 1, 1),
			            'PasswordLastUsed': datetime(2015, 1, 1),
			            'PermissionsBoundary': {
			                'PermissionsBoundaryType': 'PermissionsBoundaryPolicy',
			                'PermissionsBoundaryArn': 'string'
			            },
			            'Tags': [
			                {
			                    'Key': 'string',
			                    'Value': 'string'
			                },
			            ]
			        },
			    ],
			    'IsTruncated': True|False,
			    'Marker': 'string'
			}
			
			**Ejemplo**
			
			-  **`users_response['Users']:`**: Accede al valor con la clave `'Users'`, es una **lista** de diccionarios:
			
				``def get_iam_inventory():``
				``    iam = boto3.client('iam')``
				``    users_response = iam.list_users()``
				    ``users_data = {}``
				   `` for user in users_response['Users']:``
				   `...`
			-  **`for user in ...`**: Itera sobre cada elemento de esa lista
			-  **`user`**: En cada iteración, `user` es un diccionario que representa un usuario IAM
		-  **[iam.list_groups_for_user() ](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam/client/list_groups_for_user.html):** Enumera los grupos de IAM a los que pertenece el usuario de IAM especificado.
		
			{
			    'Groups': [
			        {
			            'Path': 'string',
			            'GroupName': 'string',
			            'GroupId': 'string',
			            'Arn': 'string',
			            'CreateDate': datetime(2015, 1, 1)
			        },
			    ],
			    'IsTruncated': True|False,
			    'Marker': 'string'
			}
			
			**Ejemplo**
			
			-  **``groups = iam.get_groups_for_user(UserName=username)['Groups']``**: Esta línea hace **dos operaciones.**
			
				**Primero**: `iam.get_groups_for_user(UserName=username)`
				
				- Llama a la API de AWS para obtener los grupos del usuario específico
				- Devuelve un diccionario con esta estructura:
				
				{
				    'Groups': [
				        {'GroupName': 'Developers', 'GroupId': '...', 'Arn': '...'},
				        {'GroupName': 'Admins', 'GroupId': '...', 'Arn': '...'}
				    ],
				    'IsTruncated': False,
				    'ResponseMetadata': {...}
				}
				
				**Segundo**: `...['Groups']`
				
				- Accede a la clave `'Groups'` del diccionario resultante
				- Esto devuelve una **lista** de diccionarios con información de grupos
				
				**Entonces**: Para el usuario 'juan', obtiene todos los grupos a los que pertenece.
	-  **S3**
	
		-  **[head_bucket() ](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3/client/head_bucket.html):** Puede utilizar esta operación para determinar si existe un bucket y si tiene permiso para acceder a él. La acción devuelve un si el bucket existe y tienes permiso para acceder a él.`200 OK` 
		
			{
			    'BucketArn': 'string',
			    'BucketLocationType': 'AvailabilityZone'|'LocalZone',
			    'BucketLocationName': 'string',
			    'BucketRegion': 'string',
			    'AccessPointAlias': True|False
			}
