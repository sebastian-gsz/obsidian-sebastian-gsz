# Generación de contraseña aleatoria para root si no se proporciona una / Generation of a random password for root if one is not provided
resource "random_password" "root_password" {
  count   = var.root_password == "" ? 1 : 0
  length  = 16
  special = false # Sin caracteres especiales para simplificar scripts de inicio
}

# Generación de contraseña aleatoria para el usuario de la aplicación si no se proporciona una y el usuario no existe / Generatión of a random password for the application user if one is not provided and the user does not exist
resource "random_password" "db_password" {
  count   = (var.db_password == "" && !var.db_user_exists) ? 1 : 0
  length  = 16
  special = false
}

locals {
  root_pwd = var.root_password != "" ? var.root_password : (length(random_password.root_password) > 0 ? random_password.root_password[0].result : "EXISTING_ROOT_PASSWORD_PRESERVED")
  db_pwd   = var.db_password != "" ? var.db_password : (length(random_password.db_password) > 0 ? random_password.db_password[0].result : "EXISTING_USER_PASSWORD_PRESERVED")
}

# Recurso de instancia de base de datos de Cloud SQL (MySQL) / Cloud SQL database instance resource (MySQL)
resource "google_sql_database_instance" "instance" {
  count            = var.sql_exists ? 0 : 1
  name             = var.instance_name
  database_version = "MYSQL_8_0"
  region           = var.region
  project          = var.project_id
  root_password    = local.root_pwd

  settings {
    edition           = "ENTERPRISE"
    tier              = "db-f1-micro"
    availability_type = "ZONAL" # Zona única (sin alta disponibilidad para ahorrar costos de laboratorio) / Single zone (no high availability to save lab costs)

    location_preference {
      zone = var.zone # Zona principal especificada en variables / Main zone specified in variables
    }

    ip_configuration {
      ipv4_enabled = true # Habilita la IP pública como se requiere para el laboratorio / Enables public IP as required for the lab

      # Firewall a nivel de base de datos (Redes Autorizadas) / Database-level firewall (Authorized Networks)
      # Permite la conexión únicamente desde la dirección IP pública de la máquina virtual bloghost / Allows connection only from the public IP address of the bloghost virtual machine
      dynamic "authorized_networks" {
        for_each = var.authorized_network_ip != "" ? [1] : []
        content {
          name  = "web front end"
          value = "${var.authorized_network_ip}/32"
        }
      }
    }
  }

  # Desactivamos la protección contra eliminación para permitir una destrucción limpia de los recursos del laboratorio / We disable deletion protection to allow clean destruction of lab resources
  deletion_protection = false
}

data "google_sql_database_instance" "existing_instance" {
  count   = var.sql_exists ? 1 : 0
  name    = var.instance_name
  project = var.project_id
}

locals {
  db_instance_ip              = var.sql_exists ? data.google_sql_database_instance.existing_instance[0].public_ip_address : google_sql_database_instance.instance[0].public_ip_address
  db_instance_connection_name = var.sql_exists ? data.google_sql_database_instance.existing_instance[0].connection_name : google_sql_database_instance.instance[0].connection_name
  db_instance_name            = var.sql_exists ? data.google_sql_database_instance.existing_instance[0].name : google_sql_database_instance.instance[0].name
}

# Cuenta de usuario de aplicación adicional (blogdbuser) / Additional application user account (blogdbuser)
resource "google_sql_user" "db_user" {
  count    = var.db_user_exists ? 0 : 1
  name     = var.db_username
  instance = local.db_instance_name
  password = local.db_pwd
  host     = "%" # Permite la conexión desde cualquier host (restringido externamente por la IP de la VM) / Allows connection from any host (externally restricted by the VM's IP)
  project  = var.project_id
}
