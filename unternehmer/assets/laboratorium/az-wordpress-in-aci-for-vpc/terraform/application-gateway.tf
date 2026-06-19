# Application Gateway
resource "azurerm_application_gateway" "main" {
  name                = "applicationGateway1"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  sku {
    name     = var.app_gateway_sku_name
    tier     = "Standard_v2"
    capacity = var.app_gateway_capacity
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = azurerm_subnet.ag.id
  }

  frontend_port {
    name = "appGatewayFrontendPort"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "appGatewayFrontendIP"
    public_ip_address_id = azurerm_public_ip.main.id
  }

  backend_address_pool {
    name         = "appGatewayBackendPool"
    ip_addresses = [azurerm_container_group.wordpress.ip_address]
  }

  backend_http_settings {
    name                  = "appGatewayBackendHttpSettings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "appGatewayHttpListener"
    frontend_ip_configuration_name = "appGatewayFrontendIP"
    frontend_port_name             = "appGatewayFrontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "appGatewayHttpListener"
    backend_address_pool_name  = "appGatewayBackendPool"
    backend_http_settings_name = "appGatewayBackendHttpSettings"
    priority                   = 100
  }

  depends_on = [
    azurerm_public_ip.main,
    azurerm_subnet.ag,
    azurerm_container_group.wordpress
  ]
}
