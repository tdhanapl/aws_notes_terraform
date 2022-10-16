#The following arguments are supported:
#peer_owner_id - (Optional) The AWS account ID of the owner of the peer VPC. Defaults to the account ID the AWS provider is currently connected to.
#peer_vpc_id - (Required) The ID of the VPC with which you are creating the VPC Peering Connection.
#vpc_id - (Required) The ID of the requester VPC.
#auto_accept - (Optional) Accept the peering (both VPCs need to be in the same AWS account and region).

provider "aws" {
  region     = "ap-south-1"
  }

resource "aws_vpc_peering_connection" "same_region" {
  peer_owner_id = var.account_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.requester_vpc_id
  auto_accept   = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = {
    Name =  "vpc_peering_same_region"
  }
}

#Note:-
#After creating the vpc peering connection this need update in the private  route table routes(both). 