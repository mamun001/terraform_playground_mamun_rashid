
terraform {
  required_providers {
    scalr = {
      source  = "scalr.com/scalr/scalr"   # This is a must
      #hostname = "https://foobarles.scalr.io/"  # This can be replaced by ENV var
      #token = "blahblah"  # this can be replaced by a ENV var
      version = "1.0.0"
    }
  }
}


