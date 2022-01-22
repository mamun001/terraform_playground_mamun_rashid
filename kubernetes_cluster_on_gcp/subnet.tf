
resource "google_compute_subnetwork" "gke_subnet" {
  name                     = "gke-subnet"
  project                  = "youtubedemo-332106" 
  ip_cidr_range            = "10.10.0.0/20"
  network                  = google_compute_network.gke_vpc.self_link
  region                   = "us-central1"
  private_ip_google_access = true
}
