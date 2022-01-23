resource "aws_s3_bucket" "onebucket" {
   bucket = "foobar-778386635"
   acl = "private"
   versioning {
      enabled = true
   }
   tags = {
     Name = "Bucket1"
     Environment = "Test"
   }
}
