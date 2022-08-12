resource "google_storage_bucket" "bucket" {
  name     = var.name
  location = var.location
}
