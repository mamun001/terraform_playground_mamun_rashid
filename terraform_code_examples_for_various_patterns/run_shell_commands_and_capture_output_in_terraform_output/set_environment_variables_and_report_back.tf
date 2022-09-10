

# This code Matt Paksula's terraform-shell-resource module ( https://github.com/matti/terraform-shell-resource)
# Delivers some magic
# Sets variables and captures them in terraform state and reports back in the form of terraform output


# first DYNAMICALLY create a BASH script! 
# NOTE: This does not have to be env variables. This can be ANY bash script!
resource "local_file" "setenvvars" {
  filename = "./terraform_generated_scripts/setenv.sh"
  content  = <<-EOT
    #!/bin/bash
    export PROJECT_ID=${var.modinput_project-id}
    export LOCATION=${var.modinput_location}
    export BUCKET=${var.modinput_bucket}
    echo PROJECT_ID $PROJECT_ID 
    echo LOCATION $LOCATION
    echo BUCKET $BUCKET
  EOT
}


# Now, we chmod the file we just created so that it (bash script) is executable
resource "null_resource" "chmod_setenv" {
  provisioner "local-exec" {
    command = "chmod +x ./terraform_generated_scripts/setenv.sh"
  }
  depends_on = [local_file.setenvvars]
}


# Now we execute the setenv script we just created
# Notice it is doing a local-exec : means this runs on the same host where the terraform apply runs
resource "null_resource" "exec_setenv" {
  provisioner "local-exec" {
    command = "./terraform_generated_scripts/setenv.sh"
  }
  depends_on = [
    local_file.setenvvars,
    null_resource.chmod_setenv]
}


# NOW, we actually execute the BASH SCRIPT we just created
#   Notice: it can be ANY bash script on the local machine
module "shell_execute" {
  source  = "github.com/matti/terraform-shell-resource"
  command = "./terraform_generated_scripts/setenv.sh"
}


# We capture STDOUT and report back 
output "shell_stdout" {
  value = module.shell_execute.stdout
}


# We capture STDERR and report back 
output "shell_stderr" {
  value = module.shell_execute.stderr
}


# We capture EXIT STATUS and report back 
output "shell_exitstatus" {
  value = module.shell_execute.exitstatus
}

