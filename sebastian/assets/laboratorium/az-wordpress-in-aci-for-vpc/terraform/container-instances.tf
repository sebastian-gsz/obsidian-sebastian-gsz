# Container Group para MySQL
resource "azurerm_container_group" "mysql" {
  name                = "mysql-containerinstance"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  ip_address_type     = "Private"
  os_type             = "Linux"
  subnet_ids          = [azurerm_subnet.aci.id]

  container {
    name   = "mysql"
    image  = "mysql:5.6"
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = 3306
      protocol = "TCP"
    }

    environment_variables = {
      MYSQL_ROOT_PASSWORD = var.mysql_password
    }

    volume {
      name                 = "mysqlfile"
      mount_path           = "/var/lib/mysql"
      storage_account_name = azurerm_storage_account.main.name
      storage_account_key  = azurerm_storage_account.main.primary_access_key
      share_name           = azurerm_storage_share.mysql.name
    }
  }

  depends_on = [
    azurerm_storage_share.mysql,
    azurerm_subnet.aci
  ]
}
# Container Group para WordPress
resource "azurerm_container_group" "wordpress" {
  name                = "wordpress-containerinstance"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  ip_address_type     = "Private"
  os_type             = "Linux"
  subnet_ids          = [azurerm_subnet.aci.id]

  container {
    name   = "wordpress"
    image  = "wordpress:4.9-apache"
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      WORDPRESS_DB_HOST     = "${azurerm_container_group.mysql.ip_address}:3306"
      WORDPRESS_DB_PASSWORD = var.mysql_password
    }

    volume {
      name                 = "wordpressfile"
      mount_path           = "/var/www/html"
      storage_account_name = azurerm_storage_account.main.name
      storage_account_key  = azurerm_storage_account.main.primary_access_key
      share_name           = azurerm_storage_share.wordpress.name
    }
  }

  depends_on = [
    azurerm_storage_share.wordpress,
    azurerm_container_group.mysql,
    azurerm_subnet.aci
  ]
}
