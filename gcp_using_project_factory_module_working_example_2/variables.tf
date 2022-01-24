
variable "credentials_path" {
  description = "Path to a Service Account credentials file with permissions documented in the readme"
  #default = "~/terraform-admin-prj-76f5fb555733.json"
  default = "/Users/mamun001/terraform-admin-prj-76f5fb555733.json"
}

variable "org_id" {
  description = "organization id"
  default = "264719799360" # fake value
}

variable "billing_account" {
  description = "billing account"
  default = "AAAAAA-BBBBBB-CCCCCC"  # fake value
}


variable "shared_vpc" {
  description = "The ID of the host project which hosts the shared VPC"
  default = "nonprod-shared"
}

variable "shared_vpc_subnets" {
  description = "List of subnets fully qualified subnet IDs (ie. projects/$PROJECT_ID/regions/$REGION/subnetworks/$SUBNET_ID)"
  type        = list(string)
  default     = ["projects/nonprod-shared/regions/us-central1/subnetworks/arc-qa-cluster-primary"]
}

