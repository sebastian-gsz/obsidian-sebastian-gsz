variable "project_id" {
  type        = string
  description = "The GCP project ID to host the network resources"
}

variable "network_name" {
  type        = string
  default     = "artificial-intelligence-vpc"
  description = "The name of the VPC network"
}

variable "subnet_name" {
  type        = string
  default     = "lab-subnet"
  description = "The name of the subnet inside the VPC"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR range for the subnet"
}

variable "subnet_region" {
  type        = string
  default     = "us-central1"
  description = "The region to deploy the subnet"
}

variable "vpc_exists" {
  type    = bool
  default = false
}

variable "subnet_exists" {
  type    = bool
  default = false
}

variable "static_ip_exists" {
  type    = bool
  default = false
}

variable "firewall_exists" {
  type    = bool
  default = false
}

