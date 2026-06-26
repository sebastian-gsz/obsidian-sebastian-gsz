output "instance_ip" {
  value       = local.instance_public_ip
  description = "The public IP address of the compute instance"
}

output "instance_self_link" {
  value       = local.instance_self_link
  description = "The URI of the instance"
}
