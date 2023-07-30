variable "private_subnets" {
    type               = list(string)
    description        = "List of private subnets"
    default            =[module.vpc.private_subnet_1_cidr,module.vpc.private_subnet_2_cidr,module.vpc.private_subnet_3_cidr,module.vpc.private_subnet_4_cidr]

}

variable "public_subnets" {
    type               = list(string)
    description        = "List of public subnets"
    default            =["module.vpc.public_subnet_1_cidr", "module.vpc.public_subnet_2_cidr"]

}

variable "azs"{
    type               = list(string)
    description        = "List of availability zones"
    default            =["us-east-1a", "us-east-1b"]
}

variable "Vpc_id"{
    type               = string
    description        = "List of availability zones"
    default            = module.vpc.vpc_id
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
     bucket = "rac2-nextgends"
     key = "terraform.state"
     region = "us-east-1"
  }
}

variable "cerificate_arn" {
  type               = string
  description = "Certificte ARN for HTTPS"
  default     = data.terraform_remote_state.acm.cerificate_arn
}

variable "target_id" {
  type               = string
  description = "target Id for ALB"
  default     = data.terraform_remote_state.eks.worker_node_instance_ids[0]
}

variable "health_check" {
    type = map(string)
    default = {
        "timeout" = "10"
        "Interval" = "20"
        "path" ="/"
        "port"="80"
        "unhealthy_threshold" ="2"
        "healthy_threshold"  = "3"
    }
}