

locals {
  buckets = {
    for x in var.modinput_buckets :
    "${x.name}" => x
  }
}


/******************************************
	bucket configuration
 *****************************************/

resource "google_storage_bucket" "buckets" {
  for_each      = { for bucket in local.buckets : bucket.name => bucket }
  name          = each.value.name
  project       = each.value.project
  storage_class = each.value.storage_class
  location      = each.value.location
  versioning {
    enabled = true
  }

}


