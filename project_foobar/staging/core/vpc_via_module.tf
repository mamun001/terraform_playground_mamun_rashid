
# creates a vpc using module -mamun

#resource "aws_vpc" "foobar_vpc" {
  #cidr_block = "10.0.0.0/16"
#}


# call the module to create vpc instead of  creating here
# this vpc modulke only takes one variable cidr
module "foobar_vpc" {
  source = "../../modules/vpc-module"
  cidr = "10.0.0.0/16"
}


