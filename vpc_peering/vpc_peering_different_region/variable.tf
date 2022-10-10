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
  default     = "vpc-00b654b5f8f9af931"
}
#The ID of the requester VPC of different region 
variable "requester_vpc_id" {
  description = "The ID of the requester VPC"
  type        = string
  default     = "vpc-04c576762215f333f"
}
#Different region 
variable "peer_region" {
  description = "The region of the accepter VPC of the VPC Peering Connection"
  type        = string
  default     = "us-west-1"
}

