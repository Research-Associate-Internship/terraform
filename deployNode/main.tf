
resource "aws_subnet" "ngds_subnet_deployNode" {
  vpc_id            = var.vpc_cidr
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_security_group" "ngds_deployNode_sg" {
  name_prefix = "ngds_deployNode_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.bastion_sg_id] ## Needed to be updated ##
  }

  ingress {
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    security_groups = [var.jenkins_sg_id] ## Needed to be updated ##
  }

   egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "rac2-root"
}

resource "aws_instance" "ngds-deployNode" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name
  subnet_id     = aws_subnet.ngds_subnet_deployNode.id
  security_groups = [
    aws_security_group.instance_sg.id
  ]

  root_block_device {
    volume_size = 100
  }

  tags = {
    "Name" = "ngds-deployNode"
    "Department" = "DevSecOps Associate"
    "project"    = "interns"
    "Creation"   = "terraform"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/NextGenDS-cluster"  = "owned"
  }
}