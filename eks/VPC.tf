module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = "15.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["15.0.1.0/24", "15.0.2.0/24"]
  public_subnets  = ["15.0.101.0/24", "15.0.102.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Department = "DevSecOps Associate"
    project    = "interns"
    Creation   = "terraform"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/NextGenDS-cluster"  = "owned"
  }
}
