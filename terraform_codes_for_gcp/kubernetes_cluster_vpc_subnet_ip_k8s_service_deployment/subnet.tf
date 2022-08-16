
resource "google_compute_subnetwork" "gke_subnet" {
  name                     = local.subnet_name
  project                  = local.project
  ip_cidr_range            = local.ip_cidr_range
  network                  = google_compute_network.gke_vpc.self_link
  region                   = local.region
  private_ip_google_access = true
}
