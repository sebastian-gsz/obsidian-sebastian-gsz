# Storage Account
resource "azurerm_storage_account" "main" {
  name                     = substr(replace(lower("${data.azurerm_resource_group.main.name}${data.azurerm_resource_group.main.id}"), "/[^a-z0-9]/", ""), 0, 24)
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = split("_", var.storage_account_type)[1]

  lifecycle {
    ignore_changes = [
      name
    ]
  }
}
# Azure File Share para WordPress
resource "azurerm_storage_share" "wordpress" {
  name                 = "wordpress-share"
  storage_account_id   = azurerm_storage_account.main.id
  quota                = 5

  depends_on = [azurerm_storage_account.main]
}
# Azure File Share para MySQL
resource "azurerm_storage_share" "mysql" {
  name                 = "mysql-share"
  storage_account_id   = azurerm_storage_account.main.id
  quota                = 5

  depends_on = [azurerm_storage_account.main]
}
