

# Unfortunately this code uses hard-coded values


# Codes in this file creates:
# 1. A kubernetes Cluster
# 2. Service Account
# 3. Role Binding
# 4. a Key for the Service Account
# 5. a kubernetes secret from that key


# CREATE A KUBERNETES CLUSTER
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


#   SERVICE ACCOUNT
resource "google_service_account" "log_user_1" {
  account_id   = "deleteme164286"
  display_name = "d123"
  project = "test-7-481ef3d2"
}


#  Giving The Service Account logWriter Role
resource "google_project_iam_member" "binding_no_replacing_1" {
  project = "test-7-481ef3d2"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.log_user_1.email}"
}


# Creates a key for the Service Account
resource "google_service_account_key" "key_1" {
  service_account_id = google_service_account.log_user_1.name
}


# Using the key created above , this creates a Kubernetes Secret
resource "kubernetes_secret" "google_application_credentials_1" {
  metadata {
    name = "google-application-credentials"
    namespace = "development"
  }
  data = {
    "credentials.json" = base64decode(google_service_account_key.key_1.private_key)
  }
}


