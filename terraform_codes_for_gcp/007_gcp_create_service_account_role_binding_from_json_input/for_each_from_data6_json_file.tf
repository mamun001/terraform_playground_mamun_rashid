locals {
  json_data_6 = jsondecode(file("./data6.json"))
}


resource "google_service_account" "service_accounts_for_each_6" {
  for_each = {for v in local.json_data_6.inputs: v.acct_id => v.display_name}
  account_id   = each.key
  display_name = each.value
}


resource "google_project_iam_member" "rolebinding" {
  for_each     = { for v in local.json_data_6.inputs: v.acct_id => v }
  project = each.value.project-role-pairs[0]
  role    = each.value.project-role-pairs[1]
  #member  = "johndoe@somedomain.com"   serviceaccount:email
  # member  = "serviceAccount:${each.value.email}"
  member  = "serviceAccount:${google_service_account.service_accounts_for_each_6[each.key].email}"
}


