
# n2-standard quota is 0. n2d-standard is available
# mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json is for EZ gcp my test project for cloud armor
locals {
  project = "mrashid-cloud-armor-playground"
  credentials_file = "/Users/mamunrashid/mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json"
  region = "us-central1"
  zone = "us-central1-f"
  instance_type = "n2d-standard-2"
  image = "debian-cloud/debian-10"
  instance_name = "deleteme2"
  instance_group_name = "foobar"
  subnet = "foobar"
  cidr = "10.2.0.0/16"
  vpc = "foobar-vpc"
  policy = "cloud-armor-test-policy"
  https-lb = "foobar-https-lb"
  firewall_network = "foobar-firewall-network"
  health_check = "foobar-health-check"
  backend_service = "foobar-backend-service"
  url_map = "foobar-url-map"
}

variable "default_rules" {
  description = "default rule"
  default = {
    def_rule = {
      action = "allow"
      priority = "2147483647"
      versioned_expr = "SRC_IPS_V1"
      src_ip_ranges = ["*"]
      description = "default rule"
    }
  }
  type = map(object({
    action = string 
    priority = string 
    versioned_expr = string 
    src_ip_ranges = list(string) 
    description = string 
    })
  )
}


