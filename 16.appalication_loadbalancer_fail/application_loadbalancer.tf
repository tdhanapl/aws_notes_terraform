##creating the target group
resource "aws_lb_target_group" "my-target-group" {
  health_check {
    interval            = 10
    path                = "/index.html"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "my-test-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  #vpc_id     = "${var.vpc_id}"
  vpc_id      =  aws_vpc.VPC-A.id
}

##### adding instance to the target group 
resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment-1" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  #target_id       = "${var.instance1_id}"
  target_id        =  aws_instance.application-alb[0].id
  port             =  80
}
resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment-2" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  #target_id       = "${var.instance1_id}"
  target_id        =  aws_instance.application-alb[1].id
  port             = 80
}
##creating  application load 
resource "aws_lb" "my-aws-alb" {
  name     = "my-test-alb"
  internal = false

  security_groups = [
    "${aws_security_group.my-alb-sg.id}",
  ]
  ##Note:
  #Please note that one of either subnets or subnet_mapping is required.
  
  #subnets = ["aws_subnet.Public-Subnet-A.id"]
  
  subnet_mapping {
    subnet_id     = aws_subnet.Public-Subnet-A.id
    #allocation_id = aws_eip.example1.id
  }
  subnet_mapping {
    subnet_id     = aws_subnet.Private-Subnet-A.id
    #allocation_id = aws_eip.example1.id
  }

  tags = {
    Name = "my-test-alb"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}


resource "aws_lb_listener" "my-test-alb-listner" {
  load_balancer_arn = "${aws_lb.my-aws-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  }
}

## creating security group for application load balancer
resource "aws_security_group" "my-alb-sg" {
  name   = "my-alb-sg"
  vpc_id = aws_vpc.VPC-A.id
}

resource "aws_security_group_rule" "inbound_ssh" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.my-alb-sg.id}"
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_http" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.my-alb-sg.id}"
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_all" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.my-alb-sg.id}"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}