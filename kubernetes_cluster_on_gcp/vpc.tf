resource "google_compute_network" "gke_vpc" {
  name                    = "vpc-for-gke"     #underscore not allowed
  auto_create_subnetworks = false
  project = "youtubedemo-332106"  # has to be the ID not name
}
