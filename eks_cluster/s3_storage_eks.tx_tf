resource "aws_s3_bucket" "state" {
  bucket = "dhanapal_eks_storage"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.state.id
  acl    = "private"
}
