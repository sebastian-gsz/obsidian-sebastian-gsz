resource "google_compute_instance" "vm" {
  count        = var.instance_exists ? 0 : 1
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  tags = var.tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  network_interface {
    subnetwork = var.subnet_self_link

    # Allocate a public external IP / Asignar una IP externa pública
    access_config {
      nat_ip = var.static_ip
    }
  }

  scheduling {
    preemptible                 = var.is_spot
    automatic_restart           = !var.is_spot
    provisioning_model          = var.is_spot ? "SPOT" : "STANDARD"
    instance_termination_action = var.is_spot ? "DELETE" : null

    dynamic "max_run_duration" {
      for_each = var.is_spot && var.max_run_duration_seconds > 0 ? [1] : []
      content {
        seconds = var.max_run_duration_seconds
      }
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = var.startup_script
}

data "google_compute_instance" "existing_vm" {
  count   = var.instance_exists ? 1 : 0
  name    = var.instance_name
  zone    = var.zone
  project = var.project_id
}

locals {
  instance_public_ip = var.instance_exists ? data.google_compute_instance.existing_vm[0].network_interface[0].access_config[0].nat_ip : (length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].network_interface[0].access_config[0].nat_ip : "")
  instance_self_link = var.instance_exists ? data.google_compute_instance.existing_vm[0].self_link : (length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].self_link : "")
}
