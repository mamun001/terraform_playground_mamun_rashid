resource "scalr_webhook" "example" {
  name           = "my-webhook-name"
  enabled        = true
  endpoint_id    = "ep-t95jgqlnu9v15j0"  # ep I created in temp env
  events         = ["run:completed", "run:errored"]
  workspace_id = "ws-t95lq48m076cefg"   # foo workspace manually created on GUI
  environment_id  = "env-t95jbksb17p9iq8"  # temp env created by TF
}
