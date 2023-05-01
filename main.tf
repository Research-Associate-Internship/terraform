resource "aws_instance" "bastion-host-jenkins" {
  # (resource arguments)
}

resource "aws_instance" "jenkins-master" {
  # (resource arguments)
}

resource "aws_nat_gateway" "NAT" {
  # (resource arguments)
}