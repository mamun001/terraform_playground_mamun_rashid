
# creates security groups  using module -mamun


# call the module to create SG instead of  creating here
# this module only takes 3 variables: 
# "allowed_ingress_port"  "allowed_ingress_cidr" "vpc_id" 

module "security_group_module" {
  source = "../../modules/security-group-module"
  # current value is totally made up
  allowed_ingress_cidr = ["10.0.4.0/24"]
  # allowed port: current value is made up:
  allowed_ingress_port = "443"
  # vpc id comes from output of another tf file in this dir
  vpc_id = "${module.foobar_vpc.created_vpc_id}"
}

# usefukl code snippets not used
#vpc_id     = "${module.foobar_vpc.created_vpc_id}"
