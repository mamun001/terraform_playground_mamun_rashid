resource "google_container_cluster" "gke_cluster" {
  name               = "foo-gke-cluster"
  project            = "youtubedemo-332106" 
  location           = "us-central1"
  initial_node_count = 1
  network            = google_compute_network.gke_vpc.name
  subnetwork         = google_compute_subnetwork.gke_subnet.name
}
