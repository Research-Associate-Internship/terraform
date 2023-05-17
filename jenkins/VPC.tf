module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jenkins-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  # reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
  # external_nat_ip_ids = "3.229.85.151"   # <= IPs specified here as input to the module

  tags = {
    Department = "DevSecOps Associate"
    Creation   = "terraform"
    project    = "interns"
  }
}

# resource "aws_nat_gateway" "NAT" {
#   allocation_id = "eipalloc-0853977d139cc4377"
#   subnet_id     = "${element(module.vpc.public_subnets, 0)}"

#   tags = {
#     Name = "MYNAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [module.vpc]
# }

