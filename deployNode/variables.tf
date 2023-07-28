# Variables
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.xlarge"
}

variable "availability_zone" {
  description = "Availability Zone for the private subnet"
  default     = "us-east-1a" ## Needed to be updated ##
}

variable "jenkins_sg_id" {
  description = "ID of the Jenkins security group"
}

variable "bastion_sg_id" {
  description = "ID of the bastion host security group"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = module.vpc.vpc_cidr
}

variable "subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = module.vpc.private_subnet_1_cidr ## Needed to be updated ##
}
