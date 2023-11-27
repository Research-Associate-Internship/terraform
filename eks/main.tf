resource "aws_instance" "test-server" {
  ami = "ami-0fc5d935ebf8bc3bc"

  instance_type          = "t2.micro"
  key_name               = "bastion"
  subnet_id            = "subnet-0a4c5ede768f52298"//private subnet

  tags = {
    Name       = "devops-rac3-test"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}