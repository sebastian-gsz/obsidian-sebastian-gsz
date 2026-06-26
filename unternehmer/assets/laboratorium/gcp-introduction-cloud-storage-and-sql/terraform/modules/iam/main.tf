resource "google_service_account" "sa" {
  count        = var.sa_exists ? 0 : 1
  account_id   = var.account_id
  display_name = var.display_name
  project      = var.project_id
}

data "google_service_account" "existing_sa" {
  count      = var.sa_exists ? 1 : 0
  account_id = var.account_id
  project    = var.project_id
}

locals {
  sa_email = var.sa_exists ? data.google_service_account.existing_sa[0].email : google_service_account.sa[0].email
}
