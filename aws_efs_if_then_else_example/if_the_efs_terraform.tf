
# This is a module
# Exemplifies how to have if-then-else logic in HCL terraform
#

variable "create_efs" { description = "If set to true, create an EFS" }
variable "creation_token" { description = "creation token nique for idempotency purposes" }
variable "encrypted" { description = "encrypted or not" default = "true" }
variable "name_tag" { description = "Tag value for key Name" }
variable "performance_mode" { description = "Performance Mode" }


# BEGIN
# creates an efs (Elastic File System) 

resource "aws_efs_file_system" "efs_foo" {
  count = "${var.create_efs}"
  creation_token = "${var.creation_token}"
  encrypted = "${var.encrypted}"
  performance_mode = "${var.performance_mode}"

  tags {
    Name = "${var.name_tag}"
  }
}

# exposing variables to caller code

output "created_efs_id" { value = "${aws_efs_file_system.efs_foo.id}" }
output "created_efs_dns_name" { value = "${aws_efs_file_system.efs_foo.dns_name}" }






