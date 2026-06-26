# External data source to check for the existence of GCP resources before applying / Origen de datos externo para verificar la existencia de recursos de GCP antes de aplicar
data "external" "gcp_check" {
  program = ["python", "${path.module}/essets/check_resources.py"]

  query = {
    project_id        = var.project_id
    network_name      = var.network_name
    subnet_name       = var.subnet_name
    region            = var.region
    zone              = var.zone
    sa_email          = "${var.sa_account_id}@${var.project_id}.iam.gserviceaccount.com"
    instance_name     = var.instance_name
    bucket_name       = var.project_id # The bucket defaults to the project ID / El bucket predeterminado es el ID del proyecto
    sql_instance_name = "blog-db"      # The default in modules/sql/variables.tf is "blog-db" / El nombre predeterminado en modules/sql/variables.tf es "blog-db"
    db_username       = "blogdbuser"   # The default in modules/sql/variables.tf is "blogdbuser" / El nombre predeterminado en modules/sql/variables.tf es "blogdbuser"
  }
}
