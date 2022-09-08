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

  # Deny traffic to actuator
  rule {
    action   = "deny(403)"
    priority = "0"
    match {
      expr {
        expression = "request.path.matches('actuator*')"
      }
    }
    description = "Deny traffic to actuator"
  }

  # Deny traffic to swagger.html
  rule {
    action   = "deny(403)"
    priority = "1"
    match {
      expr {
        expression = "request.path.matches('swagger-ui.html')"
      }
    }
    description = "Deny traffic to swagger.html"
  }

  # Deny traffic matching OWASP Rules
  dynamic "rule" {
    for_each = var.owasp_rules
      content {
        action = rule.value.action
        priority = rule.value.priority
        description = rule.value.description
        preview = "true"
          match {
            expr {
              expression = rule.value.expression
            }
          }
       }
   }

}
