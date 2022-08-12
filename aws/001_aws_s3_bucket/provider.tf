

# If you are using AWS cred via shell variables, rename this file to something else


provider "aws" {
  region  = var.aws_region

  # You can use access keys
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  # Or specify an aws profile, instead.
  # profile = "<aws profile>"
}

