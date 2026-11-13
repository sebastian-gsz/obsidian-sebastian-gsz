output "db_instance_ip" {
  value       = local.db_instance_ip
  description = "La dirección IP pública de la instancia de Cloud SQL"
}

output "db_instance_connection_name" {
  value       = local.db_instance_connection_name
  description = "El nombre de conexión de la instancia de base de datos"
}

output "db_root_password" {
  value       = local.root_pwd
  description = "La contraseña del usuario administrador (root)"
  sensitive   = true
}

output "db_user_password" {
  value       = local.db_pwd
  description = "La contraseña del usuario de la aplicación (blogdbuser)"
  sensitive   = true
}
