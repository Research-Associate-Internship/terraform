resource "aws_lb" "NextGenDS" {
  name               = "Rac2-NextGenDS-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.NextGenDS-sg.id]
  subnets            = [[var.private_subnets[0],var.private_subnets[1],var.private_subnets[2],var.private_subnets[3]]]

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

resource "aws_lb_listener" "NextGenDS-http-listener" {
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
  vpc_id             = module.vpc.vpc_id

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