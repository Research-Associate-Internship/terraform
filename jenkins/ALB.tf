resource "aws_lb" "jenkins" {
    name               = "Jenkins-ALB"
    internal           = false
    load_balancer_type = "application"

    security_groups = [aws_security_group.ALB-SG.id]

    subnets                                     = [
        module.vpc.public_subnets[0]
,
        module.vpc.public_subnets[1]
,
    ]

    tags                                        = {
        Department = "DevSecOps Associate"
        Creation = "terraform"
        Project = "intern"
    }

}

resource "aws_lb" "vault" {
    name               = "Vault-ALB"
    internal           = false
    load_balancer_type = "application"

    security_groups = [aws_security_group.ALB-SG.id]

    subnets                                     = [ 
        module.vpc.public_subnets[0],

        module.vpc.public_subnets[1],

    ]

    tags                                        = {
        Department = "DevSecOps Associate"
        Creation = "terraform"
        Project = "intern"
    }

}

resource "aws_lb_target_group" "jenkins" {
  name     = "jenkins-TG"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  
  health_check {
    path     = "/login"
  }

  tags                                        = {
        Department = "DevSecOps Associate"
        Creation = "terraform"
        Project = "intern"
    }

}

resource "aws_lb_target_group" "vault" {
  name     = "vault-TG"
  port     = 8200
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  tags                                        = {
        Department = "DevSecOps Associate"
        Creation = "terraform"
        Project = "intern"
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
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
  }
}

resource "aws_lb_listener" "jenkins-tg-443" {
  load_balancer_arn = aws_lb.jenkins.arn
  port              = "443"
  protocol          = "HTTPS"

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
    type             = "forward"
    target_group_arn = aws_lb_target_group.vault.arn
  }
}

resource "aws_lb_listener" "vault-tg-443" {
  load_balancer_arn = aws_lb.vault.arn
  port              = "443"
  protocol          = "HTTPS"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.vault.arn
  }
}
