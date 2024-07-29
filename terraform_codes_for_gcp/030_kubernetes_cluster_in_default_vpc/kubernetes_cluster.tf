

# Create a Kubernetes Cluster 
#  Parameters are in variables.tf

resource "google_container_cluster" "foobar" {
  name               = local.name
  location           = local.location
  initial_node_count = 2

  master_auth {
    username = local.username
    password = local.password

    client_certificate_config {
      issue_client_certificate = local.issue_client_certificate
    }
  }

  node_config {
    oauth_scopes = local.oauth_scopes 

    metadata = {
      disable-legacy-endpoints = local.disable-legacy-endpoints
    }

    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

  timeouts {
    create = local.create
    update = local.update
  }
}

