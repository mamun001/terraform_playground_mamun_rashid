locals {
  project = "youtubedemo-332106" 
  vpc_name = "vpc-for-gke"
  subnet_name = "gke-subnet"
  ip_cidr_range            = "10.10.0.0/20"
  region = "us-central1"
  cluster_name = "foo-gke-cluster"
}

