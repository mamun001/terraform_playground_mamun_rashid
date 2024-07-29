resource "google_compute_subnetwork" "public-subnet" {
name = local.subnet
ip_cidr_range = local.cidr
region = local.region
network = local.vpc
}
