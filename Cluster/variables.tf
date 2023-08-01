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