
# creates an ec2 instance  -mamun

# 4 vars are defined in the tfvars file in this folder
# "subnet_id" 
# "ami_code" 
# "instance_type" 
# vpc_security_group_ids    A list!
# "az_id"    
# key_name

resource "aws_instance" "created_ec2" {
  subnet_id     = "${var.subnet_id}"
  ami     = "${var.ami_code}"
  instance_type     = "${var.instance_type}"
  # not having security_groups as a LIST gives error: should be a list
  # that's why first code below fails, while 2nd one (with []) succeeds
  #security_groups     = "${var.security_groups}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  availability_zone = "${var.az_id}"
  key_name = "${var.key_name}"

  tags {
    Name = "${var.name_tag}"
  }


}

output "created_ec2_private_ip" {
  value = "${aws_instance.created_ec2.private_ip}"
}

output "created_ec2_key_name" {
  value = "${aws_instance.created_ec2.key_name}"
}


# useful unused code
# THIS WORKS! sending value OUT of the module
# caller code should now be able to grab the value using created_vpc_id variable
#output "created_vpc_id" {
  #value = "${aws_vpc.foobar_vpc.id}"
#}




