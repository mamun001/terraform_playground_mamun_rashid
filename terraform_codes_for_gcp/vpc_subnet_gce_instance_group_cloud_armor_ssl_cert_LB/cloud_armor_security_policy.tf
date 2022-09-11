

#  Code Modified from:  https://brk0018.medium.com/implement-cloud-armor-security-policy-s-using-terraform-1794792e2842
#  Creates cloud armor policy with OWASP Rules
#  OWASP Rules are defined in variables.tf file


resource "google_compute_security_policy" "cloud_armor_security_policy_1" {
    project = local.project 
    name = local.policy
    dynamic "rule" {
        for_each = var.default_rules
        content {
            action = rule.value.action 
            priority = rule.value.priority 
            match {
                versioned_expr = rule.value.versioned_expr 
                config {
                    src_ip_ranges = rule.value.src_ip_ranges 
                }
            }
            description = rule.value.description 
        }
    }
    dynamic "rule" {
        for_each = var.owasp_rule
        content {
            action = rule.value.action 
            priority = rule.value.priority 
            match {
              expr {
                expression = rule.value.expression
                }
            }
        }
    }
}
