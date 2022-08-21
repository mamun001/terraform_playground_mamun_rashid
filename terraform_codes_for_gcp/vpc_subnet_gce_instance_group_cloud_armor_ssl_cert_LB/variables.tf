
# n2-standard quota is 0. n2d-standard is available
locals {
  project = "mrashid-cloud-armor-playground"
  credentials_file = "/Users/mamunrashid/my.json"
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
  firewall_network = "foobar-vpc"
  health_check = "foobar-health-check"
  backend_service = "foobar-backend-service"
  url_map = "foobar-url-map"
}


#  "default here has nothing to do with "default" rule in cloud armor policy
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



# owasp rules as of Jan 2022 (pre-configured)
# sqli-stable
# owasp-crs-v030001-id942251-sqli
# owasp-crs-v030001-id942420-sqli
# owasp-crs-v030001-id942431-sqli
# owasp-crs-v030001-id942460-sqli
# owasp-crs-v030001-id942421-sqli
# owasp-crs-v030001-id942432-sqli
#
variable "owasp_rule" {
  description = " blah"
  default = {
    rule_sqli = {
      action = "deny(403)"
      priority = "1001"
      expression = "evaluatePreconfiguredExpr('sqli-stable', ['owasp-crs-v030001-id942251-sqli','owasp-crs-v030001-id942420-sqli','owasp-crs-v030001-id9424431-sqli','owasp-crs-v030001-id942460-sqli'])"
    }
    rule_lfi = {
      action = "deny(403)"
      priority = "1002"
      expression = "evaluatePreconfiguredExpr('lfi-stable')"
    }
  }
  type = map(object({
    action = string
    priority = string
    expression = string
    })
  )
}
