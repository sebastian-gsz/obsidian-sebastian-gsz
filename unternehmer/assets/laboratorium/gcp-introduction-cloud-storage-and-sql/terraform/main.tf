module "vpc" {
  source           = "./modules/vpc"
  project_id       = var.project_id
  network_name     = var.network_name
  subnet_name      = var.subnet_name
  subnet_cidr      = var.subnet_cidr
  subnet_region    = var.region
  vpc_exists       = data.external.gcp_check.result.vpc_exists == "true"
  subnet_exists    = data.external.gcp_check.result.subnet_exists == "true"
  static_ip_exists = data.external.gcp_check.result.static_ip_exists == "true"
  firewall_exists  = data.external.gcp_check.result.firewall_exists == "true"
}

module "iam" {
  source       = "./modules/iam"
  project_id   = var.project_id
  account_id   = var.sa_account_id
  display_name = var.sa_display_name
  sa_exists    = data.external.gcp_check.result.sa_exists == "true"
}

locals {
  custom_startup_script = <<EOT
#!/bin/bash
apt-get update
apt-get install apache2 php php-mysql -y

# Crear el archivo index.php de forma dinámica con las credenciales de Cloud SQL y el banner de Cloud Storage
cat <<'EOF' > /var/www/html/index.php
<html>
<head><title>Welcome to my excellent blog</title></head>
<body>
<h1>Welcome to my excellent blog</h1>
<img src='${module.storage.public_url_object}'>
<?php
$dbserver = "${module.sql.db_instance_ip}";
$dbuser = "blogdbuser";
$dbpassword = "${module.sql.db_user_password}";
// In a production blog, we would not store the MySQL
// password in the document root. Instead, we would store
//  it in a Secret Manger. For more information see
// https://cloud.google.com/sql/docs/postgres/use-secret-manager
	
try {
$conn = new PDO("mysql:host=$dbserver;dbname=mysql", $dbuser, $dbpassword);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "Connected successfully";
} catch(PDOException $e) {
echo "Database connection failed:: " . $e->getMessage();
}
?>
</body></html>
EOF

service apache2 restart
EOT
}

module "compute" {
  source                   = "./modules/compute"
  project_id               = var.project_id
  instance_name            = var.instance_name
  zone                     = var.zone
  machine_type             = var.machine_type
  subnet_self_link         = module.vpc.subnet_self_link
  service_account_email    = module.iam.email
  tags                     = var.instance_tags
  startup_script           = local.custom_startup_script
  static_ip                = module.vpc.static_ip
  is_spot                  = var.is_spot
  boot_disk_size           = var.boot_disk_size
  boot_disk_type           = var.boot_disk_type
  max_run_duration_seconds = var.max_run_duration_seconds
  instance_exists          = data.external.gcp_check.result.instance_exists == "true"
}

module "storage" {
  source           = "./modules/storage"
  project_id       = var.project_id
  location         = var.bucket_location
  local_image_path = "${path.module}/essets/my-excellent-blog.png"
  bucket_exists    = data.external.gcp_check.result.bucket_exists == "true"
  banner_exists    = data.external.gcp_check.result.banner_exists == "true"
}

module "sql" {
  source                = "./modules/sql"
  project_id            = var.project_id
  region                = var.region
  zone                  = var.zone
  authorized_network_ip = module.vpc.static_ip
  sql_exists            = data.external.gcp_check.result.sql_exists == "true"
  db_user_exists        = data.external.gcp_check.result.db_user_exists == "true"
  db_password           = var.db_password
}
