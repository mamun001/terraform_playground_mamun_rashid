
# setup the GCP provider
# this is pre-req for these code set to work
# these variables are defined in variables.tf file
#


terraform {
  required_version = ">= 0.12"
}
provider "google" {
  project     = local.project
  credentials = local.credentials_file
  region      = local.region
  zone        = local.zone
}
