output "site_fqdn" {
  description = "FQDN público del sitio de WordPress"
  value       = azurerm_public_ip.main.fqdn
}

output "site_public_ip" {
  description = "Dirección IP pública del Application Gateway"
  value       = azurerm_public_ip.main.ip_address
}

output "storage_account_name" {
  description = "Nombre de la cuenta de almacenamiento"
  value       = azurerm_storage_account.main.name
}

output "wordpress_private_ip" {
  description = "Dirección IP privada del contenedor de WordPress"
  value       = azurerm_container_group.wordpress.ip_address
}

output "mysql_private_ip" {
  description = "Dirección IP privada del contenedor de MySQL"
  value       = azurerm_container_group.mysql.ip_address
}

output "vnet_id" {
  description = "ID de la Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "application_gateway_id" {
  description = "ID del Application Gateway"
  value       = azurerm_application_gateway.main.id
}
