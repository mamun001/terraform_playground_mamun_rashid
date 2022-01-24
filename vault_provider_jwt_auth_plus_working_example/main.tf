
provider "vault" {

address = "https://mgr-np.foobar.com"   # non-prod
#skip_tls_verify = true
#token = "FAKE_TOKEN"
}


# read a secret (kv)
data "vault_generic_secret" "foo" {
  path = "just-a-test/foo"
}

# output a secret (kv)
#worked with tf refresh!
output Namekv1 {
  value = "${data.vault_generic_secret.foo.data.foo}"
}


#   BACKEND AUTH ONLY
#vault write auth/jwt/config jwks_url="https://gitlab.com/-/jwks" bound_issuer="gitlab.com"
#resource "vault_jwt_auth_backend" "example" {
    #description  = "Demonstration of the Terraform JWT auth backend"
    #path = "jwt"
    #oidc_discovery_url = "https://myco.auth0.com/"
    #bound_issuer = "https://myco.auth0.com/"
#}
resource "vault_jwt_auth_backend" "jwt_gitlab2" {
    description  = "Demonstration of the Terrafom JWT auth backend for Gitlab"
    path = "jwt-via-terraform"
    bound_issuer = "gitlab.com"
    jwks_url = "https://gitlab.com/-/jwks"
}



# WRITE A SECRET  : GENERIC ONLY : NOT GCP
# works nonprod: create/write a secret
resource "vault_generic_secret" "writing_secret_example" {
  path = "just-a-test/foo2"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}


# READ A GCP SECRET
# FROM:   https://www.arctiq.ca/our-blog/2020/5/12/vault-and-tfe-fun-with-dynamic-secrets-for-gcp/
# read a gcp secret already written to vault via CLI
# works
# READ A SECRET. Thisnonly works because we wrote this secret via CLI outside terraform
data "vault_generic_secret" "gcp_secret" {
  path = "gcp/config"
}



# from https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_secret_backend
# works, but in reality, all it does is enable the path? what happens to the cred I just provided?
# it does put in! see the output!
resource "vault_gcp_secret_backend" "gcp_secret_creds" {
  credentials = "${file("/Users/mamun001/sre_sandbox_access.json")}"
  path = "gcp_creds_via_terraform"
}
output gcp_secret_terraform_put_in {
  value = "${vault_gcp_secret_backend.gcp_secret_creds.credentials}"
}
# output above works, prints out the json data in the cred file we provided


# ENABLE GCP BACKEND
# also from https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_secret_backend
# THIS IS SAME AS enable gcp backedn auth
# this works even though , i have enabld gcp backend auth already at /gcp
# works because I gave different path here
resource "vault_auth_backend" "gcp" {
    path = "gcp_backend_via_terraform"
    type = "gcp"
}
# also worked ADD ROLE TO VAULT
resource "vault_gcp_auth_backend_role" "vault_gcp_role_via_terraform" {
    backend                = vault_auth_backend.gcp.path
    bound_projects = toset(["sre-sandbox-243618"])
    # sa-mamun-terraform                                              sa-mamun-terraform@sre-sandbox-243618.iam.gserviceaccount.com
    #bound_service_accounts = ["database-server@foo-bar-baz.iam.gserviceaccount.com"]   # optional
    bound_service_accounts = ["sa-mamun-terraform@sre-sandbox-243618.iam.gserviceaccount.com"]   # required if iam type is used
    #token_policies         = ["database-server"] # also optional
    type = "iam"  # required
    role                   = "sample-vault-role"
}





# output a GCP secret works, but have no private_key_data
#worked with tf refresh!
output gcp_secret_out {
  value = "${data.vault_generic_secret.gcp_secret.data}"
}
#output
#gcp_secret_out = {
#  "max_ttl" = "8640000"
#  "ttl" = "360000"
#}




#provider "google" {
    # Pass the key from Vault to the Google provider
    #credentials = base64decode(data.vault_generic_secret.gcp_secret.data.private_key_data) 
    #project = "sre-sandbox-243618"
#}





