variable "resource_group_name" {
  description = "Nombre del Resource Group donde se desplegarán los recursos"
  type        = string
}

variable "location" {
  description = "Ubicación para todos los recursos"
  type        = string
  default     = "spaincentral"
}

variable "vnet_name" {
  description = "Nombre de la VNet"
  type        = string
  default     = "aci-vnet"
}

variable "vnet_address_prefix" {
  description = "Prefijo de dirección de la VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet1_address_prefix" {
  description = "Prefijo de la subred para ACI"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet1_name" {
  description = "Nombre de la subred para ACI"
  type        = string
  default     = "aci-subnet"
}

variable "subnet2_address_prefix" {
  description = "Prefijo de la subred para el Application Gateway"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_name" {
  description = "Nombre de la subred para el Application Gateway"
  type        = string
  default     = "ag-subnet"
}

variable "mysql_password" {
  description = "Contraseña para la base de datos MySQL"
  type        = string
  sensitive   = true
}

variable "storage_account_type" {
  description = "Tipo de cuenta de almacenamiento"
  type        = string
  default     = "Standard_LRS"
}

variable "cpu_cores" {
  description = "Núcleos de CPU para los contenedores"
  type        = string
  default     = "1.0"
}

variable "memory_in_gb" {
  description = "Memoria en GB para los contenedores"
  type        = string
  default     = "1.5"
}

variable "app_gateway_sku_name" {
  description = "SKU del Application Gateway"
  type        = string
  default     = "Standard_v2"
}

variable "app_gateway_capacity" {
  description = "Capacidad del Application Gateway"
  type        = number
  default     = 2
}

variable "subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
  default     = "6d6ecac1-31b9-45e1-82bf-23e5443d5d2f"
}