variable "private_subnets" {
    type               = list(string)
    description        = "List of private subnets"
    # default            =[module.vpc.private_subnet_1_id,module.vpc.private_subnet_2_id,module.vpc.private_subnet_3_id,module.vpc.private_subnet_4_id]

}

variable "public_subnets" {
    type               = list(string)
    description        = "List of public subnets"
    # default            =["module.vpc.public_subnet_1_id", "module.vpc.public_subnet_2_id"]

}

variable "azs"{
    type               = list(string)
    description        = "List of availability zones"
    default            =["us-east-1a", "us-east-1b"]
}

variable "Vpc_id"{
    type               = string
    description        = "List of availability zones"
    # default            = module.vpc.vpc_id
}