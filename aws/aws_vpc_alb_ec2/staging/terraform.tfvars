

# for some reason, all .tf files in this directory are executed even through config below
#  only mentions one file
#
terragrunt = {
  # (put your Terragrunt configuration here)
  source = "./vpc_via_module.tf"
}
