
#
# Actual values will come from tfvars file in run time.
#
# project = where service accounts are created
#
provider "google" {
  project     = var.project
  region      = var.region
}
