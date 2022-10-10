resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  acl    = "public-read"
}
resource "aws_s3_bucket_acl" "bucket-acl-1" {
  bucket = data.aws_s3_bucket.selected-bucket-1.id
  acl    = "public-read"
}