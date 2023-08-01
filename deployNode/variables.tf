# Variables
variable "region" {
  description = "AWS region"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "availability_zone" {
  description = "Availability Zone for the private subnet"
}

variable "vpc_id" {
  description = "ID for the VPC"
}

variable "subnet_id" {
  description = "ID for the private subnet"
}
