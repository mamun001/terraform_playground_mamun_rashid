

# This code is like magic
# This uses a publicly available terraform module from Matti Paksula
#
# Using this module , you can pretty much run any shell command on the machine that runs terraform and capture the output in terraform output
# See various examples below


# From these examples below, you can see we can run pretty much any command on the local machine and capture the output


#  NOTE: This .tf file has NO DEPENDENCY on the set_environment_variables_and_report_back.tf file in directory. 
#        That is just another exmaple for setting variables on local machine


# Run ls -l on the local machine (Machine that runs terraform)
module "ls-l-command" {
  source  = "github.com/matti/terraform-shell-resource"
  command = "ls -l"
}
# Now we can output what we got back and capture them in terraform state
output "ls-l-output" {
  value = module.ls-l-command.stdout
}




# Run date command on the local machine (Machine that runs terraform)
module "date_command" {
  source  = "github.com/matti/terraform-shell-resource"
  command = "date"
}
# Now we can output what we got back and capture them in terraform state
output "current_time" {
  value = module.date_command.stdout
}




# Run ping command on the local machine (Machine that runs terraform)
module "ping_command" {
  source  = "github.com/matti/terraform-shell-resource"
  command = "ping -c 2 8.8.8.8"
}
# Now we can output what we got back and capture them in terraform state
output "ping_command_output" {
  value = module.ping_command.stdout
}



