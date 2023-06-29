data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_region" "current" {
  name = "ap-south-1"
}
