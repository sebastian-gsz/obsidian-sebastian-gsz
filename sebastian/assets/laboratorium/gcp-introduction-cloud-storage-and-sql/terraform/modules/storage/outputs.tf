output "bucket_name" {
  value       = local.bucket_name
  description = "El nombre del bucket de almacenamiento"
}

output "bucket_url" {
  value       = "gs://${local.bucket_name}"
  description = "La URL del bucket de almacenamiento en formato gs://"
}

output "public_url_object" {
  value       = "https://storage.googleapis.com/${local.bucket_name}/my-excellent-blog.png"
  description = "La URL HTTP pública para acceder directamente a la imagen del banner"
}
