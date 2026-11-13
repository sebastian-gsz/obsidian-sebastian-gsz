variable "project_id" {
  type        = string
  description = "The GCP project ID to host the IAM service account"
}

variable "account_id" {
  type        = string
  default     = "bloghost-sa"
  description = "The account ID for the service account"
}

variable "display_name" {
  type        = string
  default     = "SA para bloghost"
  description = "The display name for the service account"
}

variable "sa_exists" {
  type    = bool
  default = false
}

