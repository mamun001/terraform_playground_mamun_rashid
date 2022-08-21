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
}
