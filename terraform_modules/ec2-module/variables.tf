
# all the input variables needed to call ec2_module
# 7 as of now

variable "key_name" {
  description = "key name"  
}

variable "az_id" {
  description = "availability zone"  
}

variable "subnet_id" {
  description = "subnet that ec2 instance goes into"  
}

variable "ami_code" {
  description = "AMI"  
}

variable "instance_type" {
  description = "instance type"  
}


# "Name" tag on the VPC
variable "name_tag" {
  description = "Tag value for key Name"
}

# a list!
variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"  
  default = ["undefined_sg1", "undefined_sg2"]
}


# a list!
#variable "vpc_security_groups" {
  #description = "vpc_security groups"  
  #default = ["undefined_sg1", "undefined_sg2"]
#}

