resource "google_compute_security_policy" "foobar-policy" {
  name        = "foobar-policy"
  description = "Mamuns Test Policy"

  # Allow All Traffic i.e. default rule
  rule {
    action   = "allow"
    priority = "2147483647"

    match {
      versioned_expr = "SRC_IPS_V1"

      config {
        src_ip_ranges = ["*"]
      }
    }

    description = "allow all: default rule"
  }

  # Allow traffic from some IP
  rule {
    action   = "allow"
    priority = "1001"

    match {
      versioned_expr = "SRC_IPS_V1"

      config {
        src_ip_ranges = local.ip_white_list
        #src_ip_ranges = ["192.168.0.0/16"]    (example)
      }
    }

    description = "allow traffic from a class B"
  }
}
