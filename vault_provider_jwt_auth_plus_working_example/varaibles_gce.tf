
# n2-standard quota is 0. n2d-standard is available

locals {
  project = "sre-sandbox-243618"
  credentials_file = "/Users/mamun001/sandbox_access.json"
  region = "us-central1"
  zone = "us-central1-f"
  instance_type = "n2d-standard-2"
  image = "debian-cloud/debian-9"
  instance_name = "deleteme2"
}


