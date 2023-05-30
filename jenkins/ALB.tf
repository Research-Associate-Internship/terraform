resource "aws_lb" "jenkins" {
  name               = "Jenkins-ALB"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.ALB-SG.id]

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

resource "aws_lb" "vault" {
  name               = "Vault-ALB"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.ALB-SG.id]

  subnets = [
    module.vpc.public_subnets[0],

    module.vpc.public_subnets[1],

  ]

  tags = {
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    Project    = "intern"
  }

}

resource "aws_lb_target_group" "jenkins" {
  name     = "jenkins-TG"
  port     = 8080
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

resource "aws_lb_target_group" "vault" {
  name     = "vault-TG"
  port     = 8200
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
  target_group_arn = aws_lb_target_group.vault.arn
  target_id        = aws_instance.vault.id
  port             = 8200
}
#instance must be running to attach
resource "aws_lb_target_group_attachment" "jenkins-attach" {
  target_group_arn = aws_lb_target_group.jenkins.arn
  target_id        = aws_instance.jenkins.id
  port             = 8080
}

resource "aws_lb_listener" "jenkins-tg" {
  load_balancer_arn = aws_lb.jenkins.arn
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

resource "aws_lb_listener" "jenkins-tg-443" {
  load_balancer_arn = aws_lb.jenkins.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/8f526e3c-4f0d-479b-8491-9b0182949e64"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
  }
}

resource "aws_lb_listener" "vault-tg" {
  load_balancer_arn = aws_lb.vault.arn
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

resource "aws_lb_listener" "vault-tg-443" {
  load_balancer_arn = aws_lb.vault.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/a8cc6704-b644-42e2-a13c-38ca0dc7947f"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vault.arn
  }
}
