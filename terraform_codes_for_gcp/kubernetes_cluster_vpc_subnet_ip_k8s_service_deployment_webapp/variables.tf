

# These are values we will use in various .tf files to create all the resources
#
# You should only need to edit this file and no other to deploy in your GCP project
#
#   project = GCP project where all of these get deployed

locals {
  project = "youtubedemo-332106" 
  vpc_name = "vpc-for-gke"
  subnet_name = "gke-subnet"
  ip_cidr_range = "10.10.0.0/20"
  region = "us-central1"
  cluster_name = "foo-gke-cluster"
}

