

# When we run "terraform apply" , terraform will print out the IP address of the web application we are deploying
output "public_url" {
  value = "http://${google_compute_address.public_lb_ip.address}"
}
