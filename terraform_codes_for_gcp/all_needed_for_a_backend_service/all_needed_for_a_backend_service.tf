

#  slightly modified from
#  https://github.com/hashicorp/terraform-provider-google/blob/main/examples/cloud-armor/main.tf
#  tested successfully with Terraform 0.13.7



# google_compute_backend_service needs
#    instance group , security_policy (armor) and healthcheck 
#       instance group needs#       google_compute_instance

resource "random_id" "instance_id" {
  byte_length = 4
}



resource "google_compute_instance" "cluster1" {
  name         = "armor-gce-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "stage"
    access_config {
      # Ephemeral IP
    }
    subnetwork = "stage-uscentral1"
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq nginx; sudo service nginx restart"
}


resource "google_compute_instance_group" "webservers" {
  name        = "instance-group-all"
  description = "An instance group for the single GCE instance"
  zone = "us-central1-a"

  instances = [
    google_compute_instance.cluster1.self_link,
  ]

  named_port {
    name = "http"
    port = "80"
  }
}


resource "google_compute_http_health_check" "health" {
  name               = "armor-healthcheck"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}


resource "google_compute_backend_service" "website" {
  name        = "armor-backend"
  description = "Our company website"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  enable_cdn  = false

  backend {
    group = google_compute_instance_group.webservers.self_link
  }

  # uncomment when you apply owasp policy again
  #security_policy = google_compute_security_policy.security-policy-1.self_link

  health_checks = [google_compute_http_health_check.health.self_link]
}
