resource "google_compute_instance" "default" {
  name         = local.instance_name
  machine_type = local.instance_type
  zone         = local.zone

  boot_disk {
    initialize_params {
      #image = "debian-cloud/debian-9"
      image = local.image
    }
  }

  network_interface {
    subnetwork = local.subnet

    access_config {
      // Ephemeral IP
    }
  }

}
