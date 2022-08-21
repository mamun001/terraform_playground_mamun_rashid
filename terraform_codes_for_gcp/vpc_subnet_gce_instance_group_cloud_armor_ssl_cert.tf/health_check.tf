
resource "google_compute_health_check" "foobar" {
  name = local.health_check
  timeout_sec = 1
  check_interval_sec = 1
  http_health_check {
    port = 80
  }
}
