variable "project_id" {
  type        = string
  description = "The GCP Project ID where resources will be deployed / El ID del proyecto de GCP donde se desplegarán los recursos"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The default region for resources / La región predeterminada para los recursos"
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "The default zone for the compute instance / La zona predeterminada para la instancia de computación"
}

variable "network_name" {
  type        = string
  default     = "artificial-intelligence-vpc"
  description = "The name of the VPC network / El nombre de la red VPC"
}

variable "subnet_name" {
  type        = string
  default     = "lab-subnet"
  description = "The name of the subnet / El nombre de la subred"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR range for the subnet / El rango CIDR para la subred"
}

variable "sa_account_id" {
  type        = string
  default     = "bloghost-sa"
  description = "The account ID of the service account to create / El ID de cuenta de la cuenta de servicio a crear"
}

variable "sa_display_name" {
  type        = string
  default     = "SA para bloghost"
  description = "The display name of the service account to create / El nombre para mostrar de la cuenta de servicio a crear"
}

variable "instance_name" {
  type        = string
  default     = "bloghost"
  description = "The name of the GCE VM instance / El nombre de la instancia de VM de GCE"
}

variable "machine_type" {
  type        = string
  default     = "e2-micro"
  description = "The machine type for the VM instance / El tipo de máquina para la instancia de VM"
}

variable "instance_tags" {
  type        = list(string)
  default     = ["web-server"]
  description = "The tags to apply to the VM instance (used by the firewall rule) / Las etiquetas para aplicar a la instancia de VM (utilizada por la regla de firewall)"
}

variable "startup_script" {
  type        = string
  default     = "apt-get update; apt-get install apache2 php php-mysql -y; service apache2 restart"
  description = "The startup script for configuring the web server / El script de inicio para configurar el servidor web"
}

variable "is_spot" {
  type        = bool
  default     = true
  description = "Whether to use Spot VM pricing (preemptible) / Si se debe utilizar el precio de VM Spot (interrumpible)"
}

variable "boot_disk_size" {
  type        = number
  default     = 10
  description = "The size of the boot disk in GB (minimum 10GB for standard images) / El tamaño del disco de arranque en GB (mínimo 10GB para imágenes estándar)"
}

variable "boot_disk_type" {
  type        = string
  default     = "pd-standard"
  description = "The GCE boot disk type (e.g. pd-standard, pd-balanced, pd-ssd) / El tipo de disco de arranque de GCE (por ejemplo, pd-standard, pd-balanced, pd-ssd)"
}

variable "max_run_duration_seconds" {
  type        = number
  default     = 1800
  description = "Maximum run duration for the VM in seconds (e.g., 1800 seconds = 30 minutes) / Duración máxima de ejecución de la VM en segundos (por ejemplo, 1800 segundos = 30 minutos)"
}

variable "bucket_location" {
  type        = string
  default     = "US"
  description = "The location for the Cloud Storage bucket / La ubicación para el bucket de Cloud Storage"
}

variable "skip_existence_checks" {
  type        = bool
  default     = false
  description = "Set to true to bypass existence checks for GCP resources / Establecer en true para omitir las comprobaciones de existencia de recursos"
}

variable "db_password" {
  type        = string
  default     = ""
  description = "The password for the blogdbuser. If the database user already exists, provide its password here. / La contraseña para blogdbuser. Si el usuario de la base de datos ya existe, proporcione su contraseña aquí."
  sensitive   = true
}


