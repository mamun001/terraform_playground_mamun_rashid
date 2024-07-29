


###  slightly modified from
###  https://github.com/hashicorp/terraform-provider-google/blob/main/examples/cloud-armor/main.tf
###  tested successfully with Terraform 0.13.7



### google_compute_backend_service needs
###    instance group , security_policy (armor) and healthcheck
###       instance group needs#       google_compute_instance
