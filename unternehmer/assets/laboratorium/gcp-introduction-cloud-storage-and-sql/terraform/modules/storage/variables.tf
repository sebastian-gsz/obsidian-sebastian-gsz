variable "project_id" {
  type        = string
  description = "El ID del proyecto de GCP"
}

variable "bucket_name" {
  type        = string
  description = "El nombre del bucket de Google Cloud Storage. Si se deja vacío, se utilizará el project_id por defecto."
  default     = ""
}

variable "location" {
  type        = string
  description = "La ubicación geográfica del bucket (por ejemplo, US, EU, o una región específica)"
  default     = "US"
}

variable "local_image_path" {
  type        = string
  description = "La ruta local al archivo de la imagen que se subirá al bucket"
}

variable "bucket_exists" {
  type    = bool
  default = false
}

variable "banner_exists" {
  type    = bool
  default = false
}

