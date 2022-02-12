provider "vault" {

address = "https://mgr-np.foobar.com"   # non-prod
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


# read the  secret (kv) we just wrote
data "vault_generic_secret" "written_secret_example" {
  path = "just-a-test/foo2"
}

# now read the what we wrote
output written_secret {
  value = "${data.vault_generic_secret.written_secret_example.data.foo}"
}
