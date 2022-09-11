

# This code set assumes kubernetes cluster would be deployed in "default" VPC

locals {
  name = "foobar"
  location = "us-central1-a"
  initial_node_count = 2
  username = "foo"
  password = "foobarfoobarfoobar"
  issue_client_certificate = false
  disable-legacy-endpoints = "true"
  create = "30m"
  update = "40m"
  oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
}


