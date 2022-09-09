

# Code in this folder reads json data from data.json file and
# for each set, it crates a role binding (project ==> account ==> role) in respective projects
#



locals {
  json_data = jsondecode(file("./data.json"))
}


resource "google_service_account" "service_accounts_for_each" {
  for_each = {for v in local.json_data.inputs: v.acct_id => v.display_name}
  account_id   = each.key
  display_name = each.value
}


resource "google_project_iam_member" "rolebinding" {
  for_each     = { for v in local.json_data.inputs: v.acct_id => v }
  project = each.value.project-role-pairs[0]
  role    = each.value.project-role-pairs[1]
  #member  = "johndoe@somedomain.com"   serviceaccount:email
  # member  = "serviceAccount:${each.value.email}"
  member  = "serviceAccount:${google_service_account.service_accounts_for_each[each.key].email}"
}


