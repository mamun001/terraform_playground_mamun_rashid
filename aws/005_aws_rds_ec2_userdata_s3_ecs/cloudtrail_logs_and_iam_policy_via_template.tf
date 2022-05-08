

data "template_file" "cloud-trail-logs-s3-readonly" {
    template = "${file("./s3_bucket_readonly.json.tpl")}"
    vars {
        bucket_name = "${aws_s3_bucket.cloudtrail-logs.bucket}"
        key_prefix = "AWSLogs/*" 
    }
}
resource "aws_s3_bucket" "cloudtrail-logs" {
  bucket = "cloudtrail-logs-2018-06-08"
  acl = "private"
  lifecycle_rule {
    enabled = true
    noncurrent_version_expiration {
      days = 30
    }
  }
}
resource "aws_iam_policy" "cloudtrail-logs-readonly" {
    name = "prod-cloudtrail-logs-s3-readonly"
    path = "/production/"
    description = "Readonly access to cloudtrail-logs bucket"
    policy = "${data.template_file.cloud-trail-logs-s3-readonly.rendered}"
}
