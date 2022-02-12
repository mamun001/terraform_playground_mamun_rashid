
output "public_url" {
  value = "http://${google_compute_address.public_lb_ip.address}"
}
