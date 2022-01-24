
variable "name" { default = "foobar2" }
variable "location" { default = "us-central1-a" }
variable "initial_node_count" { default = "2" }
variable "username" { default = "foo" }
variable "password" { default = "foobarfoobarfoobar" }
variable "issue_client_certificate" { default = "false" }
variable "disable-legacy-endpoints" { default = "true" }
variable "create" { default = "30m" }
variable "update" { default = "40m" }
variable "oauth_scopes" { default = [ "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", ] }



