

#  We need this authenticate from shell
#  export GOOGLE_APPLICATION_CREDENTIALS="/some_folder/some_json_file.json"


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
