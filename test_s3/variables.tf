variable "domain_name" {
  type = string
  description = "Name of the domain"
}

variable "bucket_name" {
  type = string
  description = "Name of the bucket."
}
variable "region" {
    type = string
    default = "ap-south-1"
}
