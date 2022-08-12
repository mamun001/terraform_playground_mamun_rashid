resource "aws_s3_bucket" "onebucket" {
   bucket = "foobar-6418719710"
   acl = "private"
   versioning {
      enabled = true
   }
   tags = {
     Name = "Bucket1"
     Environment = "Test"
   }
}
