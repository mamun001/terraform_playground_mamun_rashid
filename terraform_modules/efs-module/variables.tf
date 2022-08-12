
# all the input variables needed to call efs module
# 

variable "creation_token" {
  description = "creation token nique for idempotency purposes"
}

variable "encrypted" {
  description = "encrypted or not"
  default = "true"
}

variable "name_tag" {
  description = "Tag value for key Name"
}

# unused useful code
# a list!
#variable "security_groups" {
  #description = "security groups"  
  #default = ["undefined_sg1", "undefined_sg2"]
#}

