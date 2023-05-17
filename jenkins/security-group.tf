#####Bastion Security Group#####
resource "aws_security_group" "MYSG" {
  name   = "Bastion-SG"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "71.163.48.190/32", "209.183.243.114/32", "73.213.124.24/32"
    ]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "bastionSG-DevSecOps"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
  }

}
#####Jenkins master and builder Security Group#####
resource "aws_security_group" "JSG" {
  name   = "Jenkins-SG"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.bastion.private_ip)]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    security_groups = [aws_security_group.ALB-SG.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "JSG-DevSecOps"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
  }

}
#####Application load balancer Security Group#####
resource "aws_security_group" "ALB-SG" {
  name   = "ALB-SG"
  vpc_id = module.vpc.vpc_id

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
    Name       = "ALBSG-DevSecOps"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }

}

#####Vault Security Group#####
resource "aws_security_group" "vault-SG" {
  name   = "Vault-SG"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.bastion.private_ip)]
  }

  ingress {
    from_port = 8200
    to_port   = 8200
    protocol  = "tcp"

    security_groups = [aws_security_group.ALB-SG.id]
  }

  ingress {
    from_port = 8200
    to_port   = 8200
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.builder.private_ip)]
  }

  ingress {
    from_port = 8200
    to_port   = 8200
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.jenkins.private_ip)]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "Vault-DevSecOps"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }

}
