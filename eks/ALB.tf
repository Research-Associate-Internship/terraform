resource "aws_lb" "kibana" {
  name               = "Kibana-ALB"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.kibana-sg.id]

  subnets = [
    module.vpc.public_subnets[0]
    ,
    module.vpc.public_subnets[1]
    ,
  ]

  tags = {
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    Project    = "intern"
  }

}

resource "aws_lb_target_group" "kibana" {
  name     = "kibana-TG"
  port     = 30000
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    path = "/login"
  }

  tags = {
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    Project    = "intern"
  }

}

#instance must be running to attach
resource "aws_lb_target_group_attachment" "vault-attach" {
  target_group_arn = aws_lb_target_group.kibana.arn
  target_id        = "i-0483044f043975c08"
  port             = 30000
}

resource "aws_lb_listener" "kibana-tg-443" {
  load_balancer_arn = aws_lb.kibana.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/7d3e3e0b-8306-43d5-9858-878fe484c8ca"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kibana.arn
  }
}

resource "aws_lb_listener" "kibana-tg" {
  load_balancer_arn = aws_lb.kibana.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}