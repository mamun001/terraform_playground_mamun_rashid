
locals {
  instances = {
    for x in var.modinput_cloudsqlinstances :
    "${x.instance-name}" => x
  }
}


/******************************************
	cloud sql instance configuration

         most common tier in arc-concert is:  db-n1-standard-2
           next popular: db-custom-8-30720
           others present:
             db-custom-16-61440
             db-custom-32-122880
             db-custom-32-128000
             db-custom-8-51200
             db-n1-standard-4

          Only custom machine instance type and shared-core instance type allowed for PostgreSQL
          MYSQL_5_7 (only mysql version used) uses:   db-n1-standard-2 db-n1-standard-4

 *****************************************/

resource "google_sql_database_instance" "cloud_sql_instance" {
  for_each      = { for instance in local.instances : instance.instance-name => instance }
  name          = each.value.instance-name
  database_version       = each.value.db-type
  project = each.value.project
  region = each.value.region
  settings {
    tier = each.value.tier
  }
}


