resource "aws_lb" "NextGenDS" {
  name               = "Rac2-NextGenDS-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Rac2-NextGenDS-sg.id]
  subnets            = [[var.private_subnets[0],var.private_subnets[1],var.private_subnets[2],var.private_subnets[3]]]
  enable_cross_zone_load_balancing ="true"

  tags = {
    Department       = "DevOps RAC2"
    Creation         = "terraform"
    Project          = "intern"
    Envirornment     = "Production"
  }
}

resource "aws_lb_listener" "NextGenDS-http-listener" {
  load_balancer_arn  = aws_lb.NextGenDS.arn
  port               = "80"
  protocol           = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port           = "443"
      protocol       = "HTTPS"
      status_code    = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "NextGenDS-https-listener" {
  load_balancer_arn  = aws_lb.NextGenDS.arn
  port               = "443"
  protocol           = "HTTPS"
  ssl_policy         = "ELBSecurityPolicy -2016-08"
  certificate_arn    = var.cerificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.NextGenDS_target_group.arn
  }
}

resource "aws_lb_target_group" "NextGenDS_target_group" {
  name               = "NextGenDS_target_group"
  port               = 80
  protocol           = "HTTP"
  vpc_id             = var.Vpc_id
  health_check{
    healthy_threshold =var.health_check["health_threshold"]
    internal          =var.health_check["interval"]
    unhealthy_threshold = var. health_check["unhealthy_threshold"]
    timeout           =var.health_check["timeout"]
    path             =var.health_check["path"]
    port             =var.health_check["port"]
  }
  tags = {
    Department       = "DevOps RAC2"
    Creation         = "terraform"
    Project          = "intern"
    Envirornment     = "Production"
  }
}

resource "aws_lb_target_group_attachment" "NextGenDS_target_group-attach" {
  target_group_arn  = aws_lb_target_group.NextGenDS_target_group.arn
  target_id         = var.target_id
  port              = 80
}

resource "aws_security_group" "NextGenDS-sg" {
  name   = "Rac2-NextGenDS-alb-sg"
  vpc_id = var.Vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Department       = "DevOps RAC2"
    Creation         = "terraform"
    Project          = "intern"
    Envirornment     = "Production"
  }

}