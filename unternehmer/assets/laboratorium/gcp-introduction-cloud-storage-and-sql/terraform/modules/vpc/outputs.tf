output "network_self_link" {
  value       = local.vpc_self_link
  description = "The URI of the VPC network"
}

output "subnet_self_link" {
  value       = local.subnet_self_link
  description = "The URI of the subnet"
}

output "static_ip" {
  value       = local.static_ip_address
  description = "The reserved static external IP address for the VM"
}
