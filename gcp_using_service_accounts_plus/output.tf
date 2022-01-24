
output "service_account_ids" {
  value = module.service_accounts_plus.account_ids
}

output "rolebinding_ids" {
  value = module.service_accounts_plus.rolebindings
}


output "service_account_keys_ids" {
  value = module.service_accounts_plus.service_account_keys
}

output "kubernetes_secrets_ids" {
  value = module.service_accounts_plus.kubernetes_secrets
}



