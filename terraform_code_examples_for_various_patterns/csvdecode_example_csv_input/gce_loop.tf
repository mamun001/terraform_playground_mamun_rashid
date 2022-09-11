resource "google_compute_instance" "vm" {
  for_each = { for inst in local.instances : inst.name => inst }
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = each.value.vpc
    subnetwork = each.value.subnet

    access_config {
      // Ephemeral IP
    }
  }





}
