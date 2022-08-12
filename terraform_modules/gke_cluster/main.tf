resource "google_container_cluster" "foobar" {
  name               = var.name
  location           = var.location
  initial_node_count = 2

  master_auth {
    username = var.username
    password = var.password

    client_certificate_config {
      issue_client_certificate = var.issue_client_certificate
    }
  }

  node_config {
    oauth_scopes = var.oauth_scopes 

    metadata = {
      disable-legacy-endpoints = var.disable-legacy-endpoints
    }

    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

  timeouts {
    create = var.create
    update = var.update
  }
}

