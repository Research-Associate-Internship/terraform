resource "aws_instance" "rac2-bastion" {
  ami = "ami-053b0d53c279acc90"

  instance_type               = var.instance_type
  associate_public_ip_address = "true"
  key_name                    = "rac2-root"
  vpc_security_group_ids      = [var.bastion_sg_id]
  subnet_id                   = var.public_subnet_2_id
  root_block_device {
    volume_size = 100
  }
  tags = {
    Name       = "RAC2-bastion-host"
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}