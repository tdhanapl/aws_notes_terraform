resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_versioning" "versioning_example-1" {
  bucket = data.aws_s3_bucket.selected-bucket-1.id
  versioning_configuration {
    status = "Enabled"
  }
}