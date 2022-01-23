
# Mamun's notes
# We will need an public IP for the load balancer where the k8s app  will be reachable


resource "google_compute_address" "public_lb_ip" {
  name   = "example-lb-ip"
  region = local.region
  project = local.project
}
