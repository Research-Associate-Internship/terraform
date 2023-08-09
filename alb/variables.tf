variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"

}

variable "Vpc_id" {
  type        = string
  description = "List of availability zones"

}

variable "cerificate_arn" {
  type        = string
  description = "Certificte ARN for HTTPS"
  default     = "arn:aws:acm:us-east-1:853931821519:certificate/3d7723cf-2431-41a4-8fc5-a60dd3fa02fa"
}

variable "eks_node_ids" {
  type = list(string)
}
