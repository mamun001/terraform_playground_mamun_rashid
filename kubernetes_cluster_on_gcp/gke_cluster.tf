resource "google_container_cluster" "gke_cluster" {
  name               = local.cluster_name
  project            = local.project
  location           = local.region
  initial_node_count = 1
  network            = google_compute_network.gke_vpc.name
  subnetwork         = google_compute_subnetwork.gke_subnet.name
}
