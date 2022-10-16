#peer_owner_id(account_id)
variable "account_id" {
  description = "aws account id "
  type        = string
  default     = "857751058578"
}
#peer_vpc_id
variable "peer_vpc_id" {
  description = "he ID of the VPC with which you are creating the VPC Peering Connection"
  type        = string
  default     = "vpc-06b20404edfe7d9ce"
}
#The ID of the requester VPC 
variable "requester_vpc_id" {
  description = "The ID of the requester VPC"
  type        = string
  default     = "vpc-09ac466e02411e26a"
}