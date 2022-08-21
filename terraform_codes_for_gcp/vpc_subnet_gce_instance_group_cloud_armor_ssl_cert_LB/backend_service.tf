
# defines a group of virtual machines that will serve traffic for load balancing

resource "google_compute_backend_service" "foobar" {
  name = local.backend_service
  project = local.project
  port_name = "http"
  protocol = "HTTP"
  #health_checks = ["${google_compute_health_check.foobar.self_link}"]  
  health_checks = [google_compute_health_check.foobar.self_link]  
  backend {
    group = google_compute_instance_group.foobar.self_link
    #balancing_mode = "RATE"
    balancing_mode = "UTILIZATION"
    max_rate_per_instance = 100
  }
}
