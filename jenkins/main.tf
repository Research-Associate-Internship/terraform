resource "aws_instance" "bastion" {
  ami = "ami-007855ac798b5175e"

  instance_type          = "t2.micro"
  key_name               = "ec2"
  vpc_security_group_ids = [aws_security_group.MYSG.id]
  subnet_id              = element(module.vpc.public_subnets, 0)

  tags = {
    Name       = "bastion-host"
    Creation   = "terraform"
    Department = "DevSecOps Associate"
    project    = "interns"
  }
}

#Associate EIP with EC2 Instance
resource "aws_eip_association" "demo-eip-association" {
  instance_id   = aws_instance.bastion.id
  allocation_id = "eipalloc-00a0c7dea8b9bacfc"
}

resource "aws_instance" "jenkins" {
  ami = "ami-007855ac798b5175e"

  instance_type          = "t2.medium"
  key_name               = "bastion"
  vpc_security_group_ids = [aws_security_group.JSG.id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = {
    Name       = "jenkins-master"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}

resource "aws_instance" "builder" {
  ami = "ami-007855ac798b5175e"

  instance_type          = "t2.medium"
  key_name               = "bastion"
  vpc_security_group_ids = [aws_security_group.JSG.id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = {
    Name       = "jenkins-builder"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}

# resource "aws_instance" "builder2" {
#   ami = "ami-007855ac798b5175e"

#   instance_type = "t2.medium"
#   key_name = "bastion"
#   vpc_security_group_ids = [aws_security_group.JSG.id]
#   subnet_id = "${element(module.vpc.private_subnets, 0)}"

#   tags = {
#     Name = "jenkins-builder2"
#     Department = "DevSecOps Associate" 
#     Creation = "terraform"
#     project = "interns"
#   }
# }

resource "aws_instance" "vault" {
  ami = "ami-007855ac798b5175e"

  instance_type          = "t2.medium"
  key_name               = "bastion"
  vpc_security_group_ids = [aws_security_group.vault-SG.id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = {
    Name       = "vault"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}








