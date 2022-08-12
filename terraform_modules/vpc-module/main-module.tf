
# creates a vpc -mamun

resource "aws_vpc" "foobar_vpc" {
  #cidr_block = "10.0.0.0/16"
  cidr_block = "${var.cidr}"   # cidr is defined in the variables.tf file in this module folder"
  tags {
    Name = "${var.name_tag}"
  }
}


# THIS WORKS! sending value OUT of the module
# caller code should now be able to grab the value using created_vpc_id variable
output "created_vpc_id" {
  value = "${aws_vpc.foobar_vpc.id}"
}


