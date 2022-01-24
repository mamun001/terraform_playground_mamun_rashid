

# This create the map it needs to feed to the module to do its job (please README.md file) from a JSON file.
locals {
  tpl_inputs = jsondecode(file("./inputs.json"))
}

# Using the map created above , call the module to create 
#  1. Service Account
#  2. Roles
#  3. Key for the SA
#  4. Kubernetes secret from that key to be used by deployments
#
module "service_accounts_plus" {
  source = "/Users/mamun001/repos/modules/local_service_accounts_plus"
  mod_inputs_map = local.tpl_inputs
}
