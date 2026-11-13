resource "google_compute_network" "vpc" {
  count                   = var.vpc_exists ? 0 : 1
  name                    = var.network_name
  auto_create_subnetworks = false
  project                 = var.project_id
}

data "google_compute_network" "existing_vpc" {
  count   = var.vpc_exists ? 1 : 0
  name    = var.network_name
  project = var.project_id
}

locals {
  vpc_id        = var.vpc_exists ? data.google_compute_network.existing_vpc[0].id : google_compute_network.vpc[0].id
  vpc_self_link = var.vpc_exists ? data.google_compute_network.existing_vpc[0].self_link : google_compute_network.vpc[0].self_link
  vpc_name      = var.vpc_exists ? data.google_compute_network.existing_vpc[0].name : google_compute_network.vpc[0].name
}

resource "google_compute_subnetwork" "subnet" {
  count         = var.subnet_exists ? 0 : 1
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.subnet_region
  network       = local.vpc_id
  project       = var.project_id
}

data "google_compute_subnetwork" "existing_subnet" {
  count   = var.subnet_exists ? 1 : 0
  name    = var.subnet_name
  region  = var.subnet_region
  project = var.project_id
}

locals {
  subnet_self_link = var.subnet_exists ? data.google_compute_subnetwork.existing_subnet[0].self_link : google_compute_subnetwork.subnet[0].self_link
}

resource "google_compute_firewall" "allow_ssh_http" {
  count   = var.firewall_exists ? 0 : 1
  name    = "allow-ssh-http"
  network = local.vpc_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

resource "google_compute_address" "static_ip" {
  count   = var.static_ip_exists ? 0 : 1
  name    = "bloghost-static-ip"
  region  = var.subnet_region
  project = var.project_id
}

data "google_compute_address" "existing_static_ip" {
  count   = var.static_ip_exists ? 1 : 0
  name    = "bloghost-static-ip"
  region  = var.subnet_region
  project = var.project_id
}

locals {
  static_ip_address = var.static_ip_exists ? data.google_compute_address.existing_static_ip[0].address : google_compute_address.static_ip[0].address
}
