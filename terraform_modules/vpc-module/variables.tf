
# Just 2 variables: cidr and tag name

# CIDR of the VPC
variable "cidr" {
  description = "CIDR of the VPC you want to create"  
}

# "Name" tag on the VPC
variable "name_tag" {
  description = "Tag value for key Name"
}
