variable "project_id" {
  type        = string
  description = "El ID del proyecto de GCP"
}

variable "region" {
  type        = string
  description = "La región para la instancia de Cloud SQL"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "La zona principal preferida para la base de datos (zona única)"
  default     = "us-central1-a"
}

variable "instance_name" {
  type        = string
  description = "El ID de la instancia de Cloud SQL"
  default     = "blog-db"
}

variable "db_username" {
  type        = string
  description = "El nombre del usuario de la base de datos"
  default     = "blogdbuser"
}

variable "root_password" {
  type        = string
  description = "Contraseña para el usuario root de la base de datos. Si se deja vacía, se generará una contraseña aleatoria."
  default     = ""
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "Contraseña para el usuario blogdbuser de la base de datos. Si se deja vacía, se generará una contraseña aleatoria."
  default     = ""
  sensitive   = true
}

variable "authorized_network_ip" {
  type        = string
  description = "La dirección IP pública externa de la instancia VM bloghost para permitir el acceso (red autorizada)"
}

variable "sql_exists" {
  type    = bool
  default = false
}

variable "db_user_exists" {
  type    = bool
  default = false
}

