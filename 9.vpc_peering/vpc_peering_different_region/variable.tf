variable "vpc_name" {
  description = "vpc_name"
  type        = string
  default     = "VPC-A"
}

variable "name" {
  description = "vpc_name"
  type        = list
  default     = ["A","B","C"]
}
#peer_owner_id(account_id)
variable "account_id" {
  description = "aws account id "
  type        = string
  default     = "857751058578"
}

#Different region 
variable "peer_region" {
  description = "The region of the accepter VPC of the VPC Peering Connection"
  type        = string
  default     = "us-west-1"
}

