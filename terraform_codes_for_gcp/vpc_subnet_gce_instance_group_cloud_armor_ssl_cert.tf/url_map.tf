
# used to route requests to a backend service based on rules that you define for the host and path of an incoming URL

resource "google_compute_url_map" "foobar" {
  name = local.url_map
  project = local.project
  default_service = google_compute_backend_service.foobar.self_link
}
