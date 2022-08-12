

locals {
  csv_data = "${file("${var.csv_path}")}"
  buckets = csvdecode(local.csv_data)
}


resource "google_storage_bucket" "buckets" {
  for_each = { for bucket in local.buckets : bucket.tplinput_bucket_name => bucket }
  name = each.value.tplinput_bucket_name
  project = each.value.tplinput_bucket_project
}




