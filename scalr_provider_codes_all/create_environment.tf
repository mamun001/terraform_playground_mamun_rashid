resource "scalr_environment" "test" {
  name       = "delete-this-made-by-terraform"
  account_id = "acc-sqjrmlaec46dacg"
  # cost_estimation_enabled = true
  #cloud-credentials = ["cred-xxxxx", "cred-yyyyy"]
  #policy_groups = ["pgrp-xxxxx", "pgrp-yyyyy"]
}
