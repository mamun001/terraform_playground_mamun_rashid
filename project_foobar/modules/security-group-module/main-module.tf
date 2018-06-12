
# creates a SG group - simplified
# only ingress
# only one port
# only one CIDR block ingress

# 3 vars are defined in the tfvars file in this folder
#variable "allowed_ingress_port" 
#variable "allowed_ingress_cidr" 
#variable "vpc_id" 

resource "aws_security_group" "allow_one_port" {
  name        = "allow_one_port"
  description = "Allow inbound traffic for one port ingres"
  vpc_id     = "${var.vpc_id}"

  ingress {
    from_port   = "${var.allowed_ingress_port}"
    to_port   = "${var.allowed_ingress_port}"
    # any protocol
    protocol    = "-1"
    cidr_blocks = "${var.allowed_ingress_cidr}"
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # everything is allowed outbound
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


# ______________________________________________________________________________
# other code snippets that are useful, but not actively used here 

#resource "aws_subnet" "created_subnet" {
  #vpc_id     = "${var.vpc_id_of_subnet}"
  #cidr_block = "${var.cidr_block}"
  ##cidr_block = "10.0.1.0/24"
#}

# THIS WORKS! sending value OUT of the module
# caller code should now be able to grab the value using created_vpc_id variable
#output "created_vpc_id" {
  #value = "${aws_vpc.foobar_vpc.id}"
#}




#______
#  cidr_block = "${var.cidr}"   # cidr is defined in the variables.tf file in this module folder"



