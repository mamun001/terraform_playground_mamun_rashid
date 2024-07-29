

# This creates a Kubernetes Cluster in the VPC that we create via a different .tf file in this folder
resource "google_container_cluster" "gke_cluster" {
  name               = local.cluster_name
  project            = local.project
  location           = local.region
  initial_node_count = 1
  network            = google_compute_network.gke_vpc.name
  subnetwork         = google_compute_subnetwork.gke_subnet.name
}
