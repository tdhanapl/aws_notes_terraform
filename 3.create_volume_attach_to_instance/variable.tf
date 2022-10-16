## subnet in private_subnet_availability_zone
variable "private_subnet_availability_zone" {
  description = "private_subnet_availability_zone"
  type        = string
  default     = "ap-south-1b"
}
##ec2 instance id
variable "instance_id" {
  description = "ec2 instance id"
  type        = string
  default     = "i-0dbb7b823abce0fa9"
}
# image ami_image_id
variable "ami_image_id" {
  description = "ami_name"
  type        = map
  #default     = "ami-06a0b4e3b7eb7a300"
  default     = {
    redhat = "ami-06a0b4e3b7eb7a300"
    amazon = "ami-079b5e5b3971bd10d"
    ubuntu = "ami-068257025f72f470d"
  }
}
##ec2 instance tags
variable "tags" {
  description = "ec2 instance tags"
  type        = string
  default     = "private-terraform"
}

