
# How to auth with GCP using provider.tf linking to a json key file

provider "google" {
  #credentials = file("account.json")
  project     = "test-7-481ef3d2"
  region      = "us-central1"
}
