##creating the ec2-instance
resource "aws_instance" "application-alb" {
  count         = 2
  ami           = var.ami_image_id.redhat
  instance_type = var.instance_type[0]
  key_name               = var.key_pair
  associate_public_ip_address  = true
  availability_zone            = var.availability_zone.AZ1
  #instance_state               = "running"
  vpc_security_group_ids = ["${aws_security_group.ec2-security-group.id}"]
  subnet_id = aws_subnet.Public-Subnet-A.id
  user_data = "${file("httpd.sh")}"
  tags = {
    Name = "var.tags-${count.index}"
  }
}

##command for creating##
# terraform init 
# terraform plan 
# terraform apply
# terraform apply --auto-approve
# terraform destroy --auto-approve
