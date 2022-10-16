variable "region_name" {
  description = "region name"
  type        = string
  default     = "ap-south-1"
}
variable "vpc_name" {
  description = "vpc_name"
  type        = string
  default     = "VPC-B"
}

variable "name" {
  description = "vpc_name"
  type        = list
  default     = ["A","B","C"]
}
variable "vpc_cidr_block" {
  description = "vpc_cidr_block_ip"
  type        = string
  default     = "10.60.0.0/16"
}
variable "public_subnet_cidr_block" {
  description = "public_subnet_cidr_block_ip"
  type        = string
  default     = "10.60.1.0/24"
}
variable "public_subnet_availability_zone" {
  description = "public_subnet_availability_zone"
  type        = string
  default     = "ap-south-1a"
}

variable "private_subnet_cidr_block" {
  description = "private_subnet_cidr_block_ip"
  type        = string
  default     = "10.60.2.0/24"
}

variable "private_subnet_availability_zone" {
  description = "private_subnet_availability_zone"
  type        = string
  default     = "ap-south-1b"
}
