output "vpc_id" {
  #resource "<provider>_<resource_type>" "name" {
  #value = aws_vpc.<name of resource_type>.vpc_id
  value = aws_vpc.VPC-A.id
}
output "public_subnet_id" {
  value = "${aws_subnet.Public-Subnet-A.id}"
}
output "security_group_id" {
  value = ["${aws_security_group.security-group.id}"]
}
