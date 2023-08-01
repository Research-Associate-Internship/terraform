variable "private_subnets" {
    type               = list(string)
    description        = "List of private subnets"

}

variable "public_subnets" {
    type               = list(string)
    description        = "List of public subnets"

}

variable "azs"{
    type               = list(string)
    description        = "List of availability zones"
    default            =["us-east-1a", "us-east-1b"]
}

variable "Vpc_id"{
    type               = string
    description        = "List of availability zones"
    
}

variable "cerificate_arn" {
  type               = string
  description = "Certificte ARN for HTTPS"
  default     = "arn:aws:acm:us-east-1:853931821519:certificate/3d7723cf-2431-41a4-8fc5-a60dd3fa02fa"
}

variable "target_id" {
  type               = string
  description = "target Id for ALB"
  default      = "aws_eks_node_group.RAC2-NextGenDS-node-group1.id"
}