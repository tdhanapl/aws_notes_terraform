#The following arguments are supported:
#peer_owner_id - (Optional) The AWS account ID of the owner of the peer VPC. Defaults to the account ID the AWS provider is currently connected to.
#peer_vpc_id - (Required) The ID of the VPC with which you are creating the VPC Peering Connection.
#vpc_id - (Required) The ID of the requester VPC.
#auto_accept - (Optional) Accept the peering (both VPCs need to be in the same AWS account and region).
#peer_region - (Optional) The region of the accepter VPC of the VPC Peering Connection. auto_accept must be false, and use the aws_vpc_peering_connection_accepter to manage the accepter side.

## requester region
provider "aws" {
  region     = "ap-south-1"
}

## accepter region
provider "aws" {
  alias = "accepter"
  region     = "us-east-1"
}

#1.creating the vpc  in requester region
#resource "<provider>_<resource_type>" "name" {
resource "aws_vpc" "requester_vpc_id" {
  cidr_block       = "10.50.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames    = true
  tags = {
    Name =  "Requester-${var.vpc_name}"
  }
}

#2.creating the vpc  accepter region
#resource "<provider>_<resource_type>" "name" {
resource "aws_vpc" "accepter_vpc_id" {
  provider = aws.accepter
  cidr_block       = "10.60.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames    = true
  tags = {
    Name =  "accepter-${var.vpc_name}"
  }
}
data "aws_caller_identity" "current" {
    provider = aws.accepter
}

#Requester's side of the connection.
resource "aws_vpc_peering_connection" "vpc_peer_requester" {
  #peer_owner_id = var.account_id
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = aws_vpc.requester_vpc_id.id   ##The ID of the requester VPC.
  vpc_id        = aws_vpc.accepter_vpc_id.id    ## The ID of the accepter VPC
  peer_region   = "us-east-1"                   ##The region of the accepter VPC.
  auto_accept   = false
  tags = {
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.accepter  ##accepter region
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_requester.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}

#Note:-
#After creating the vpc peering connection this need update in the private  route table routes(both).
