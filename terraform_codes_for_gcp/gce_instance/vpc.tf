resource "google_compute_network" "vpc" {
  name          =  "foobar-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}
