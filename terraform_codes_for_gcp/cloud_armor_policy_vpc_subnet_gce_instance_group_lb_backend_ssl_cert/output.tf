

# We should add more here

output "vpc_id" {
  description = "VPC ID"
  value       = google_compute_network.foobar-vpc.id
}

output "ssl_cert_self_link" {
  description = "ssl_cert_self_link"
  value       = google_compute_managed_ssl_certificate.foobar.self_link
}
