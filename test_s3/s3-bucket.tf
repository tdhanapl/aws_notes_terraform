# S3 bucket for redirecting non-www to www.
resource "aws_s3_bucket" "root_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"
}
data "aws_s3_bucket" "selected-bucket" {
  bucket = aws_s3_bucket.root_bucket.bucket
}

data "aws_s3_bucket" "selected-bucket-1" {
  bucket = aws_s3_bucket.www_bucket.bucket
}

