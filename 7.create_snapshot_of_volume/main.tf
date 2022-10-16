resource "aws_ebs_snapshot" "volume_snapshot" {
  volume_id = var.volume_id

  tags = {
    Name = "new_snapshot"
  }
}
