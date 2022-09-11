
# USING SHELL MODULE BY Matt Pakrula TO RUN BASH SCRIPT and CAPTURE OUTPUT
### This code Matt Paksula's terraform-shell-resource module ( https://github.com/matti/terraform-shell-resource)
### Delivers some magic
#

##  USE CASES:
###
###  1. If you are running terraform code on a temporary container/Virtual Machine as part of a CICD pipeline and you need values from OS inside the terraform code
###  2. What if you want to run a script and use the output from those to create other cloud resources via Terraform ? Now you can do this!
###  3. when you run provisioners (basically like user scripts for ec2) , this module will come in handy when you need to run scripts of the remote host.
###
#



### set_environment_variables_and_report_back.tfsSets variables and captures them in terraform state and reports back in the form of terraform output
### First of all it is a DYNAMICALLY created BASH script! 
### NOTE: This does not have to be env variables. This can be ANY bash script!
#


##### This code is like magic
##### This uses a publicly available terraform module from Matti Paksula
#
##### Using this module , you can pretty much run any shell command on the machine that runs terraform and capture the output in terraform output
##### See various examples below
#


##### From these examples in run_a_shell_command_and_report_back.tf, you can see we can run pretty much any command on the local machine and capture the output
#


###  NOTE: The run_a_shell_command_and_report_back.tf file has NO DEPENDENCY on the set_environment_variables_and_report_back.tf file in directory. 
###        That is just another exmaple for setting variables on local machine
#




### Here is what you should get if you ran "terraform state list" on the local host after "terraform apply"
      local_file.setenvvars
      null_resource.chmod_setenv
      null_resource.exec_setenv
      module.date_command.null_resource.contents
      module.date_command.null_resource.contents_if_missing
      module.date_command.null_resource.shell
      module.date_command.random_uuid.uuid
      module.ls-l-command.null_resource.contents
      module.ls-l-command.null_resource.contents_if_missing
      module.ls-l-command.null_resource.shell
      module.ls-l-command.random_uuid.uuid
      module.ping_command.null_resource.contents
      module.ping_command.null_resource.contents_if_missing
      module.ping_command.null_resource.shell
      module.ping_command.random_uuid.uuid
      module.shell_execute.null_resource.contents
      module.shell_execute.null_resource.contents_if_missing
      module.shell_execute.null_resource.shell
      module.shell_execute.random_uuid.uuid
#



### Here is what you should get if you ran "terraform apply" from this directory
      current_time = "Fri Sep  9 22:01:18 PDT 2022"
      ls-l-output = <<EOT
      total 80
      -rw-r--r--  1 mamunrashid  staff    331 Sep  9 22:02 run_a_shell_command_and_report_back.tf
      drwxr-xr-x  3 mamunrashid  staff     96 Sep  9 22:01 scripts
      -rw-r--r--  1 mamunrashid  staff   1020 Sep  9 21:49 set_environment_variables_and_report_back.tf
      -rw-r--r--  1 mamunrashid  staff  11266 Sep  9 22:03 terraform.tfstate
      -rw-r--r--  1 mamunrashid  staff  13923 Sep  9 22:03 terraform.tfstate.backup
      -rw-r--r--  1 mamunrashid  staff    163 Sep  9 21:44 variables.tf
      EOT
      ping_command_output = <<EOT
      PING 8.8.8.8 (8.8.8.8): 56 data bytes
      64 bytes from 8.8.8.8: icmp_seq=0 ttl=117 time=7.048 ms
      64 bytes from 8.8.8.8: icmp_seq=1 ttl=117 time=10.993 ms
      
      --- 8.8.8.8 ping statistics ---
      2 packets transmitted, 2 packets received, 0.0% packet loss
      round-trip min/avg/max/stddev = 7.048/9.021/10.993/1.972 ms
      EOT
      shell_exitstatus = 0
      shell_stderr = ""
      shell_stdout = <<EOT
      PROJECT_ID a1234
      LOCATION us-central1-f
      BUCKET bucket1
      EOT

