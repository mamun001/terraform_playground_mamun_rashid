
# creates an efs (Elastic File System) 

# 4 vars are defined in the tfvars file in this folder
#creation_token
#name_tag


resource "aws_efs_file_system" "efs_foo" {
  creation_token = "${var.creation_token}"

  tags {
    Name = "${var.name_tag}"
  }
}

# exposing variables to caller code

output "created_efs_id" {
  value = "${aws_efs_file_system.efs_foo.id}"
}

output "created_efs_dns_name" {
  value = "${aws_efs_file_system.efs_foo.dns_name}"
}



# useful unused code
# THIS WORKS! sending value OUT of the module
# caller code should now be able to grab the value using created_vpc_id variable
#output "created_vpc_id" {
  #value = "${aws_vpc.foobar_vpc.id}"
#}




