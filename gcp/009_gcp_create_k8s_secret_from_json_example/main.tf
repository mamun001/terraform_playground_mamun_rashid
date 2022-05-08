

# This code will will work if the data was correct
# But the real data has been replaced with fake data

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
        "sa.json" = file("${path.cwd}/sa.json")
      }
}
