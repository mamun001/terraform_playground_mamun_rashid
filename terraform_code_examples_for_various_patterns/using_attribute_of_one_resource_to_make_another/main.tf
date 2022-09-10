


#  In this section, we create a  service_account in GCP project
#  In GCP Console, the name will be foobar1234567
#  In here, Terraform will know it as google_service_account.foobar_service_account
#  One of it's atrributes is: email
resource "google_service_account" "foobar_service_account" {
  account_id   = "foobar1234567"
  display_name = "foobar service account"
  project = "foobar-gcp-project"
}


# iam_member
# google_service_account has an attribute called "email"
# We use that to create another resource iam_member
#  Giving The Service Account logWriter Role
resource "google_project_iam_member" "foobar_iam_member" {
  project = "foobar-gcp-project"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.foobar_service_account.email}"
}

