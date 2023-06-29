
variable "vpc_name" {
  description = "vpc_name"
  type        = string
  default     = "VPC-A"
}

variable "name" {
  description = "vpc_name"
  type        = list(any)
  default     = ["A", "B", "C"]
}
variable "vpc_cidr_block" {
  description = "vpc_cidr_block_ip"
  type        = string
  default     = "10.50.0.0/16"
}
variable "public_subnet_cidr_block" {
  description = "public_subnet_cidr_block_ip"
  type        = string
  default     = "10.50.1.0/24"
}
variable "public_subnet_availability_zone" {
  description = "public_subnet_availability_zone"
  type        = string
  default     = "ap-south-1a"
}

variable "private_subnet_cidr_block" {
  description = "private_subnet_cidr_block_ip"
  type        = string
  default     = "10.50.2.0/24"
}

variable "private_subnet_availability_zone" {
  description = "private_subnet_availability_zone"
  type        = string
  default     = "ap-south-1b"
}

## image ami_image_id
variable "ami_image_id" {
  description = "ami_name"
  type        = map(any)
  #default     = "ami-06a0b4e3b7eb7a300"
  default = {
    redhat = "ami-06a0b4e3b7eb7a300"
    amazon = "ami-079b5e5b3971bd10d"
    ubuntu = "ami-068257025f72f470d"
  }
}
# ec2 instance_type
variable "instance_type" {
  description = "ec2 instance_type"
  type        = list(any)
  #default    = t2.micro
  default = ["t2.micro", "t2.small", "t2.medium"]
}
##ec2 instance key-pair
variable "key_pair" {
  description = "ec2 instance key_pair"
  type        = string
  default     = "linux"
}
# ec2 availability_zone 
variable "availability_zone" {
  description = "ec2 availability_zone"
  type        = map(any)
  #default     = "ap-south-1a"
  default = {
    AZ1 = "ap-south-1a"
    AZ2 = "ap-south-1b"
    AZ2 = "ap-south-1c"
  }
}

##ec2 instance tags
variable "tags" {
  description = "ec2 instance tags"
  type        = string
  default     = "application-alb"
}



