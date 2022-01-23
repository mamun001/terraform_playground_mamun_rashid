resource "google_container_cluster" "deleteme1" {
  name               = "deleteme1"
  project            = "test-7-481ef3d2"
  location           = "us-central1"
  network            = "kubernetes"
  initial_node_count = 2

  master_auth {
    username = "foo"
    password = "bar1234567789012345"

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      disable-legacy-endpoints = true
    }

    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

