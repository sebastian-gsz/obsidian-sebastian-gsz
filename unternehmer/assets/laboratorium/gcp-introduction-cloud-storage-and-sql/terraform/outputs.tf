output "network_self_link" {
  value       = module.vpc.network_self_link
  description = "The URI of the VPC network / La URI de la red VPC"
}

output "subnet_self_link" {
  value       = module.vpc.subnet_self_link
  description = "The URI of the subnet / La URI de la subred"
}

output "service_account_email" {
  value       = module.iam.email
  description = "The email address of the service account / La dirección de correo electrónico de la cuenta de servicio"
}

output "instance_public_ip" {
  value       = module.compute.instance_ip
  description = "The public IP address of the bloghost compute instance / La dirección IP pública de la instancia de computación bloghost"
}

output "instance_self_link" {
  value       = module.compute.instance_self_link
  description = "The URI of the created compute instance / La URI de la instancia de computación creada"
}

output "bucket_name" {
  value       = module.storage.bucket_name
  description = "The name of the Cloud Storage bucket / El nombre del bucket de Cloud Storage"
}

output "public_banner_url" {
  value       = module.storage.public_url_object
  description = "The public HTTP URL of the banner image / La URL HTTP pública de la imagen de banner"
}

output "db_instance_ip" {
  value       = module.sql.db_instance_ip
  description = "The public IP address of the Cloud SQL instance / La dirección IP pública de la instancia de Cloud SQL"
}

output "db_root_password" {
  value       = module.sql.db_root_password
  description = "The database root user password / La contraseña del usuario root de la base de datos"
  sensitive   = true
}

output "db_user_password" {
  value       = module.sql.db_user_password
  description = "The database application user password / La contraseña del usuario de la aplicación de base de datos"
  sensitive   = true
}
