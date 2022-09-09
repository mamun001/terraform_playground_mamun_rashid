
## This provider.tf file is needed just so Terraform can authenticate with your GCP account
##
###  service_account.json file would have the JSON credentials you would download from IAM console on GCP.

provider "google" {
  credentials = file("service_acount.json")
  project     = "my-project-id"
  region      = "us-central1"
}
