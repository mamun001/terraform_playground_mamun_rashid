
resource "google_compute_instance" "foobar_gce_1" {
  name         = local.instance_name_1
  machine_type = local.instance_type
  zone         = local.zone
  boot_disk {
    initialize_params {
      image = local.image
    }
  }
  network_interface {
    network = local.vpc
    subnetwork = local.subnet
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "foobar_gce_2" {
  name         = local.instance_name_2
  machine_type = local.instance_type
  zone         = local.zone
  boot_disk {
    initialize_params {
      image = local.image
    }
  }
  network_interface {
    network = local.vpc
    subnetwork = local.subnet
    access_config {
      // Ephemeral IP
    }
  }
}



