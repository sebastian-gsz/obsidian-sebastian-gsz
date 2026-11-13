
-  **Tools**
  ![[barra.gif]]
-  **AWS Organizations**

	-  **Crear una organización nueva**: `aws organizations create-organization`
	-  **Describir una organización**: `aws organizations describe-organization`
	-  **Crear una unidad organizativa (OU)**: `aws organizations create-organizational-unit --parent-id r-<examplerootid111> --name AccountingOU`
	-  **Eliminar una OU**: `aws organizations delete-organizational-unit --organizational-unit-id ou-<examplerootid111>-<exampleouid111>`
	-  **Actualizar una OU**: `aws organizations update-organizational-unit --organizational-unit-id ou-<examplerootid111>-<exampleouid111> --name AccountingOU`
	-  **Adjuntar una política**: `aws organizations attach-policy --policy-id p-<examplepolicyid111> --target-id ou-<examplerootid111>-<exampleouid111>`
	-  **Crear una política**: `aws organizations create-policy --content file://policy.json --name AllowAllS3Actions, --type SERVICE_CONTROL_POLICY --description "Allows delegation of all S3 actions"`
	-  **Eliminar una política**: `aws organizations delete-policy --policy-id p-<examplepolicyid111>`


