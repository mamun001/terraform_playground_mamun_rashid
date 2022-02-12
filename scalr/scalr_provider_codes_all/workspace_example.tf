resource "scalr_workspace" "example" {
  name            = "my-workspace-name"
  environment_id  = "env-t95jbksb17p9iq8"  # temp env created by TF
  #vcs_provider_id = "my_vcs_provider"
  #vcs_repo {
      #identifier          = "org/repo"
      #branch              = "dev"
  #}
}
