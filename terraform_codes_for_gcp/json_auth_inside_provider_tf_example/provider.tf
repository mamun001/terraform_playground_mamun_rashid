
## How to auth with GCP using provider.tf linking to a json key file
##
### First, you would create a service account in GCP and create a json file with its credentials on the GCP Console
### You would download that json file somwhere on your computer
### In the credentials line below, you would point to that file
### DO NOT save that file in a git repo! 

provider "google" {
  credentials = file("account.json")
  project     = "test-7-481ef3d2"
  region      = "us-central1"
}
