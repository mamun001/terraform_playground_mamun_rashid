
# creates a s3 bucket  -mamun

# 4 vars are defined in the tfvars file in this folder
# bucket (name)
# acl
# region
# versioning true/false


resource "aws_s3_bucket" "created_s3" {
 # dont forget the EXACT format : need curly brackets
  bucket = "${var.bucket}"
  acl  = "${var.acl}"
  region = "${var.region}"

  versioning {
   enabled = true   # always true for now
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        #kms_master_key_id = "${aws_kms_key.mykey.arn}"
        sse_algorithm     = "AES256"
      }
    }
  }
}

output "created_s3_bucket_name" {
  value = "${aws_s3_bucket.created_s3.bucket}"
}

# useful unused code
# THIS WORKS! sending value OUT of the module
# caller code should now be able to grab the value using created_vpc_id variable
#output "created_vpc_id" {
  #value = "${aws_vpc.foobar_vpc.id}"
#}




