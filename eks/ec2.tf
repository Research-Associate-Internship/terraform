resource "aws_instance" "eks-bastion" {
  ami = "ami-007855ac798b5175e"

  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "ec2"
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  subnet_id                   = module.vpc.public_subnets[0]

  tags = {
    Name       = "eks-bastion"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}
