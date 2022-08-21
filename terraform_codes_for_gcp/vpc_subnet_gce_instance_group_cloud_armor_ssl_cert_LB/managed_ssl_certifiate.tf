resource "google_compute_managed_ssl_certificate" "foobar" {
  name = "test-cert"

  managed {
    domains = ["sslcert.tf-test.club."]
  }
}
