# Public IP para Application Gateway
resource "azurerm_public_ip" "main" {
  name                = "publicIp1"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "acisite${substr(md5(data.azurerm_resource_group.main.id), 0, 13)}"
}
# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = [var.vnet_address_prefix]
}
# Subnet para Container Instances
resource "azurerm_subnet" "aci" {
  name                 = var.subnet1_name
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet1_address_prefix]

  service_endpoints = ["Microsoft.Storage"]

  delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.ContainerInstance/containerGroups"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}
# Subnet para Application Gateway
resource "azurerm_subnet" "ag" {
  name                 = var.subnet2_name
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet2_address_prefix]
}
# Network Profile para Container Instances
resource "azurerm_network_profile" "main" {
  name                = "aci-networkProfile"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  container_network_interface {
    name = "eth0"

    ip_configuration {
      name      = "ipconfigprofile1"
      subnet_id = azurerm_subnet.aci.id
    }
  }
}
