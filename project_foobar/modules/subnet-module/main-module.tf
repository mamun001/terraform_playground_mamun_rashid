
# creates a subnet  -mamun

# 2 vars are defined in the tfvars file in this folder
resource "aws_subnet" "created_subnet" {
  vpc_id     = "${var.vpc_id_of_subnet}"
  cidr_block = "${var.cidr_block}"
  #cidr_block = "10.0.1.0/24"
}

# THIS WORKS! sending value OUT of the module
# caller code should now be able to grab the value using created_vpc_id variable
#output "created_vpc_id" {
  #value = "${aws_vpc.foobar_vpc.id}"
#}




#______
#  cidr_block = "${var.cidr}"   # cidr is defined in the variables.tf file in this module folder"



