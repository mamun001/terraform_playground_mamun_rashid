

# Only modify the locals section to fit your enviroment
# You can leave "variables section untouched

locals {
  project = "foobar-project"
  credentials_file = "/Users/mamunrashid/my.json"
  region = "us-central1"
  location = "us-central1-a"
  zone = "us-central1-f"
  ip_white_list = ["9.9.9.0/24"]
}



#  Leave these untouched
#  These define all the rules that you need to implement OWASP rules in Cloud Armor

variable "owasp_rules" {
  description = "OWASP Rules"
  default = {
    rule_lfi = {
      action = "deny(403)"
      priority = "1001"
      expression = "evaluatePreconfiguredExpr('lfi-stable')"
      description = "OWASP lfi"
    }
    rule_methodenforcement = {
      action = "deny(403)"
      priority = "1002"
      expression = "evaluatePreconfiguredExpr('methodenforcement-stable')"
      description = "OWASP methodenforcement"
    }
    rule_protcolattack = {
      action = "deny(403)"
      priority = "1003"
      expression = "evaluatePreconfiguredExpr('protocolattack-stable')"
      description = "OWASP procolattack"
    }
    rule_rce = {
      action = "deny(403)"
      priority = "1004"
      expression = "evaluatePreconfiguredExpr('rce-stable')"
      description = "OWASP rce"
    }
    rule_rfi = {
      action = "deny(403)"
      priority = "1005"
      expression = "evaluatePreconfiguredExpr('rfi-stable')"
      description = "OWASP rfi"
    }
    rule_scannerdetection = {
      action = "deny(403)"
      priority = "1006"
      expression = "evaluatePreconfiguredExpr('scannerdetection-stable')"
      description = "OWASP scannerdetection"
    }
    rule_sessionfixation = {
      action = "deny(403)"
      priority = "1007"
      expression = "evaluatePreconfiguredExpr('sessionfixation-stable')"
      description = "OWASP sessionfixation"
    }
    rule_sqli = {
      action = "deny(403)"
      priority = "1008"
      expression = "evaluatePreconfiguredExpr('sqli-stable')"
      description = "OWASP sqli"
    }
    rule_xss = {
      action = "deny(403)"
      priority = "1009"
      expression = "evaluatePreconfiguredExpr('xss-stable')"
      description = "OWASP xss"
    }
  }
  type = map(object({
    action = string
    priority = string
    expression = string
    description = string
    })
  )
}
