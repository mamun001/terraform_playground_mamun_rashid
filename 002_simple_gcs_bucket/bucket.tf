resource "google_storage_bucket" "static" {
 name          = "haklhaklfajaty"
 location      = "US"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
}