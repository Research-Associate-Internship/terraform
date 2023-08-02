resource "aws_security_group" "ngds_deployNode_sg" {
  name_prefix = "ngds_deployNode_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_instance" "ngds-deployNode" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.instance_type
  key_name      = "rac2-root"
  subnet_id     = var.subnet_id
  security_groups = [
    aws_security_group.ngds_deployNode_sg.id
  ]

  root_block_device {
    volume_size = 100
  }
  lifecycle {
    ignore_changes = [disable_api_termination, ebs_optimized, hibernation, security_groups, credit_specification, network_interface, ephemeral_block_device]
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