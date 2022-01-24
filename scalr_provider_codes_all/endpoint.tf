
resource "random_string" "r" {
  length = 16
}


resource "scalr_endpoint" "example" {
  name           = "my-endpoint-name"
  #secret_key     = "my-secret-key"
  secret_key = random_string.r.result
  timeout        = 15
  max_attempts   = 3
  url            = "https://my-endpoint.url"
  environment_id = "env-t95jbksb17p9iq8"   # temp env created by tf
}
