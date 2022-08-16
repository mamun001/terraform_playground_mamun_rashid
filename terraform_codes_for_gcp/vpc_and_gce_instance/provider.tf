
# setup the GCP provider
terraform {
  required_version = ">= 0.12"
}
provider "google" {
  project     = local.project
  credentials = local.credentials_file
  region      = local.region
  zone        = local.zone
}
