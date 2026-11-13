variable "project_id" {
  type        = string
  description = "The GCP project ID to host the compute instance"
}

variable "instance_name" {
  type        = string
  default     = "bloghost"
  description = "The name of the GCE instance"
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "The zone to deploy the compute instance"
}

variable "machine_type" {
  type        = string
  default     = "e2-micro"
  description = "The GCE machine type"
}

variable "subnet_self_link" {
  type        = string
  description = "The self link of the subnetwork where the instance will reside"
}

variable "service_account_email" {
  type        = string
  description = "The email address of the service account to assign to the instance"
}

variable "tags" {
  type        = list(string)
  default     = ["web-server"]
  description = "The network tags to assign to the instance"
}

variable "startup_script" {
  type        = string
  default     = "apt-get update; apt-get install apache2 php php-mysql -y; service apache2 restart"
  description = "The startup script metadata for the VM instance"
}

variable "is_spot" {
  type        = bool
  default     = true
  description = "Whether to use Spot VM pricing (preemptible)"
}

variable "boot_disk_size" {
  type        = number
  default     = 10
  description = "The size of the boot disk in GB (minimum 10GB for standard images)"
}

variable "boot_disk_type" {
  type        = string
  default     = "pd-standard"
  description = "The GCE boot disk type (e.g. pd-standard, pd-balanced, pd-ssd)"
}

variable "max_run_duration_seconds" {
  type        = number
  default     = 1800
  description = "Maximum run duration for the VM in seconds (e.g., 1800 seconds = 30 minutes)"
}

variable "static_ip" {
  type        = string
  description = "El IP público estático reservado para la VM"
  default     = null
}

variable "instance_exists" {
  type    = bool
  default = false
}


