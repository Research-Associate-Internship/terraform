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

module "eks" {
    source = "./Cluster"
    public_subnets = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
    private_subnets = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id, module.vpc.private_subnet_3_id, module.vpc.private_subnet_4_id]
    Vpc_id = module.vpc.vpc_id
}

module "deployNode" {
    source="./deployNode"
    availability_zone = "us-east-1a"
    instance_type = "t3.xlarge"
    region = "us-east-1"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.vpc.private_subnet_2_id
}

module "bastion" {
    source = "./Bastion"
    instance_type = "t3.xlarge"
    public_subnet_2_id = module.vpc.public_subnet_2_id
    bastion_sg_id = module.eks.bastion_sg_id
}

output "vpc" {
    value = module.vpc
}