resource "google_compute_network" "foobar-vpc" {
  name          =  local.vpc
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}
