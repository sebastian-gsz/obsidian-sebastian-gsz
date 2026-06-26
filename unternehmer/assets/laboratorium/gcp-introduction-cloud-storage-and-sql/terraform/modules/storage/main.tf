# Recurso para crear el bucket de Google Cloud Storage
resource "google_storage_bucket" "bucket" {
  count                       = var.bucket_exists ? 0 : 1
  name                        = var.bucket_name != "" ? var.bucket_name : var.project_id
  location                    = var.location
  force_destroy               = true # Habilita la eliminación del bucket con todos sus objetos para pruebas del laboratorio
  uniform_bucket_level_access = false
}

data "google_storage_bucket" "existing_bucket" {
  count = var.bucket_exists ? 1 : 0
  name  = var.bucket_name != "" ? var.bucket_name : var.project_id
}

locals {
  bucket_name = var.bucket_exists ? data.google_storage_bucket.existing_bucket[0].name : google_storage_bucket.bucket[0].name
}

# Recurso para subir la imagen del banner al bucket
resource "google_storage_bucket_object" "banner" {
  count        = var.banner_exists ? 0 : 1
  name         = "my-excellent-blog.png"
  bucket       = local.bucket_name
  source       = var.local_image_path
  content_type = "image/png"
}

# Control de acceso a nivel de objeto para hacer que el banner sea legible por cualquiera en internet
resource "google_storage_object_access_control" "public_rule" {
  count  = var.banner_exists ? 0 : 1
  object = google_storage_bucket_object.banner[0].output_name
  bucket = local.bucket_name
  role   = "READER"
  entity = "allUsers"
}
