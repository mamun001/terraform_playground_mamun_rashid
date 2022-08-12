

provider "google-beta" {
}


locals {
  scans = {
    for x in var.modinput_scans :
    "${x.display_name}" => x
  }
}


/******************************************
        scans configuration
 *****************************************/

resource "google_security_scanner_scan_config" "scans" {
  for_each      = { for scan in local.scans : scan.display_name => scan }
  provider         = google-beta
  display_name     = each.value.display_name
  max_qps = 20
  project = each.value.project
  starting_urls    = split(",",each.value.starting_urls)
  target_platforms = ["COMPUTE"]
  schedule {
    interval_duration_days = 1
  }
}

