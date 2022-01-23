resource "google_compute_network" "gke_vpc" {
  name                    = local.vpc_name     #underscore not allowed
  auto_create_subnetworks = false
  project = local.project  # has to be the ID not name
}
