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
    default            =["us-east-1a"]
}

variable "Vpc_id"{
    type               = string
    description        = "List of availability zones"
}