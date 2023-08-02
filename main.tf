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

module "alb" {
    source = "./alb"
    public_subnets = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
    private_subnets = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id, module.vpc.private_subnet_3_id, module.vpc.private_subnet_4_id]
    Vpc_id = module.vpc.vpc_id
    eks_node_ids=module.eks.eks_node_ids
    cerificate_arn="arn:aws:acm:us-east-1:853931821519:certificate/3d7723cf-2431-41a4-8fc5-a60dd3fa02fa"

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

module "route53" {
    source = "./route53"
    alb_zone_id = module.alb.lb_zone_id
    alb_dns_name = module.alb.lb_dns_name
    ngds_name = "rac2-nextgends.axle-interns.com"
}

output "vpc" {
    value = module.vpc
}