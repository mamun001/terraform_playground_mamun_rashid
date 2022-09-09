
resource "google_service_account" "log_user_1" {
  account_id   = "deleteme164286"
  display_name = "d123"
  project = "test-7-481ef3d2"
}

resource "google_service_account" "log_user_2" {
  account_id   = "deleteme27439282"
  display_name = "d28492"
  project = "test-7-481ef3d2"
}


resource "google_service_account" "log_user_3" {
  account_id   = "deleteme33781"
  display_name = "d38492"
  project = "test-7-481ef3d2"
}


# this  replaces! authoritative

#resource "google_project_iam_binding" "binding1" {
  #project = "test-7-481ef3d2"
  #role    = "roles/logging.logWriter"
  #members = [
    #"serviceAccount:${google_service_account.log_user_1.email}",
    #"serviceAccount:${google_service_account.log_user_2.email}"
  #]
#}

resource "google_project_iam_member" "binding_no_replacing_1" {
  project = "test-7-481ef3d2"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.log_user_1.email}"
}


resource "google_project_iam_member" "binding_no_replacing_2" {
  project = "test-7-481ef3d2"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.log_user_2.email}"
}



resource "google_project_iam_member" "binding_no_replacing" {
  project = "test-7-481ef3d2"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.log_user_3.email}"
}

resource "google_service_account_key" "key_1" {
  service_account_id = google_service_account.log_user_1.name
}

resource "kubernetes_secret" "google_application_credentials_1" {
  metadata {
    name = "google-application-credentials"
    namespace = "development"
  }
  data = {
    "credentials.json" = base64decode(google_service_account_key.key_1.private_key)
  }
}


