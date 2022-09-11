
# we need a VPC for subnet and GCE Instance

resource "google_compute_network" "foobar-vpc" {
  name          =  local.vpc
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}
