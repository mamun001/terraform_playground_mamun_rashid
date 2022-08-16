
# n2-standard quota is 0. n2d-standard is available
# mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json is for EZ gcp my test project for cloud armor
locals {
  project = "mrashid-cloud-armor-playground"
  credentials_file = "/Users/mamunrashid/mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json"
  region = "us-central1"
  zone = "us-central1-f"
  instance_type = "n2d-standard-2"
  image = "debian-cloud/debian-10"
  instance_name = "deleteme2"
  instance_group_name = "foobar"
  subnet = "foobar"
  cidr = "10.2.0.0/16"
  vpc = "foobar-vpc"
}


