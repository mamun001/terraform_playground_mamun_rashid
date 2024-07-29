module "awesome_bucket" {
  source      = "git::https://github.com/SweetOps/terraform-google-storage-bucket.git?ref=master"
  name        = "awesome"
  stage       = "development"
  namespace   = "sweetops"
  location    = "us-central1"
  project     = "foobar-project-123456"
}
