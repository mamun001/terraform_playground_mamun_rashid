
# ADDED
module "shell_execute" {
  source  = "github.com/matti/terraform-shell-resource"
  command = "./scripts/setenv.sh"
}



resource "local_file" "setenvvars" {
  filename = "./scripts/setenv.sh"
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
resource "null_resource" "chmod_setenv" {
  provisioner "local-exec" {
    command = "chmod +x ./scripts/setenv.sh"
  }
  depends_on = [local_file.setenvvars]
}
resource "null_resource" "exec_setenv" {
  provisioner "local-exec" {
    command = "./scripts/setenv.sh"
  }
  depends_on = [
    local_file.setenvvars,
    null_resource.chmod_setenv]
}



# ADDED
output "shell_stdout" {
  value = module.shell_execute.stdout
}

output "shell_stderr" {
  value = module.shell_execute.stderr
}

output "shell_exitstatus" {
  value = module.shell_execute.exitstatus
}

