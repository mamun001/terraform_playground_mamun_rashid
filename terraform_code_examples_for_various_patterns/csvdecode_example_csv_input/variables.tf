locals {
  instances = csvdecode(file("input.csv"))
  project = "mrashid-cloud-armor-playground"
  credentials_file = "/Users/mamunrashid/mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json"
  region = "us-central1"
  zone = "us-central1-f"
  vpc = "foobar-vpc"
  subnet = "foobar-subnet"
  cidr = "192.168.0.0/16"
}
