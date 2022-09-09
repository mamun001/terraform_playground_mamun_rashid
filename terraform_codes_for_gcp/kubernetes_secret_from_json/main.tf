

# This code will will work if the data was correct
# But the real data has been replaced with fake data

# This will read the data in service_account.json and use that to create a Kubernetes Secret

resource "kubernetes_secret" "some-secret" {

      metadata {
        name      = "some-secret"
        #namespace = "namespace1"
        labels = {
          "sensitive" = "true"
          "app"       = "my-app"
        }
      }
      data = {
        "service_account.json" = file("${path.cwd}/service_account.json")
      }
}
