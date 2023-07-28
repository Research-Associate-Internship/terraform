provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "./vpc"
    vpc_cidr = "10.0.0.0/24"
    public_subnet_1_cidr = "10.0.0.0/27" 
    public_subnet_2_cidr = "10.0.0.32/27" 
    private_subnet_1_cidr = "10.0.0.64/27" 
    private_subnet_2_cidr = "10.0.0.96/27" 
    private_subnet_3_cidr = "10.0.0.128/26" 
    private_subnet_4_cidr = "10.0.0.192/26" 
}

output "vpc" {
    value = module.vpc
}