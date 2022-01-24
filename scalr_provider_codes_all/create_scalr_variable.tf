resource "scalr_variable" "example" {
  key          = "my_key_name"
  value        = "my_value_name"
  category     = "terraform"
  workspace_id = "ws-t1hdgup6bcaa7mo"   # one of the workspaces in sandbox
}
