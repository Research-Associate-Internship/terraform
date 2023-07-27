provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "./vpc"
    vpc_cidr = "10.0.0.0/24"
    subnet_1_cidr = "10.0.0.0/27" 
    subnet_2_cidr = "10.0.0.32/27" 
    subnet_3_cidr = "10.0.0.64/27" 
    subnet_4_cidr = "10.0.0.96/27" 
    subnet_5_cidr = "10.0.0.128/26" 
    subnet_6_cidr = "10.0.0.192/26" 
}

output "vpc" {
    value = module.vpc
}