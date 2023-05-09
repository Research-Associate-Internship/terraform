resource "aws_security_group" "bastion-sg" {
  name = "eks-bastion-sg"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "71.163.48.190/32", "209.183.243.114/32", "73.213.124.24/32"
    ]
  }


   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-bastion-sg"
    Department = "DevSecOps Associate" 
    Creation = "terraform"
  }

}

resource "aws_security_group" "node-group-sg" {
  name = "node-group-sg"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [format("%s/32", aws_instance.eks-bastion.private_ip)]
  }


   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-bastion-sg"
    Department = "DevSecOps Associate" 
    Creation = "terraform"
  }

}