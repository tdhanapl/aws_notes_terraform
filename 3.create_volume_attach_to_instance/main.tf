##create new volume 
resource "aws_ebs_volume" "new_volume" {
  availability_zone = var.private_subnet_availability_zone
  size              = 5
  tags = {
    Name = "Data_volume"
  }
}

data "aws_instance" "instance_id" {
  instance_id = var.instance_id

  filter {
    name   = "image-id"
    values = [var.ami_image_id.redhat]
  }

  filter {
    name   = "tag:Name"
    values = [var.tags]
  }
}

##attachment of new volume to ec2_instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.new_volume.id
  #instance_id = aws_instance.web.id
  instance_id = data.aws_instance.instance_id.id
}



