

#  We need this authenticate from shell
#  export GOOGLE_APPLICATION_CREDENTIALS="/Users/mamunrashid/mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json"


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
