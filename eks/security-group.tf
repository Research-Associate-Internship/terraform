resource "aws_security_group" "bastion-rac3-sg" {
  name   = "eks-bastion-rac3-sg"
  vpc_id = "vpc-0945dd8c0e44991b0"

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
    Name       = "eks-bastion-rac3-sg"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
  }

}

# resource "aws_security_group" "kibana-sg" {
#   name   = "kibana-alb-sg"
#   vpc_id = module.vpc.vpc_id

#   ingress {
#     from_port = 80
#     to_port   = 80
#     protocol  = "tcp"

#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 443
#     to_port   = 443
#     protocol  = "tcp"

#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name       = "kibana-alb-sg"
#     Department = "DevSecOps Associate"
#     Creation   = "terraform"
#   }

#}
