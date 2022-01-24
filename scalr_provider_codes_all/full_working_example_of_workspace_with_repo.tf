resource "scalr_workspace" "service_project" {
  name            = "service_project"
  environment_id  = scalr_environment.env.id
  terraform_version = var.terraform_version
  vcs_provider_id = var.vcs_provider_id
  vcs_repo {
      identifier          = "foobarles/sandbox/mamun-sandbox/templates/terraform-google-arc_project"
      branch              = "develop"
  }
}


output "workspace_service_project_id" {
  value = scalr_workspace.service_project.id
}

output "workspace_service_project_name" {
  value = scalr_workspace.service_project.name
}

output "workspace_service_project_terraform_version" {
  value = scalr_workspace.service_project.terraform_version
}






