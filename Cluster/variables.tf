variable "private_subnets" {
    type               = list(string)
    description        = "List of private subnets"
    default            =["10.0.0.128/26", "10.0.0.64/27,", "10.0.0.96/27", "10.0.0.192/26"]

}

variable "public_subnets" {
    type               = list(string)
    description        = "List of public subnets"
    default            =["10.0.0.0/27", "10.0.0.32/27"]

}

variable "azs"{
    type               = list(string)
    description        = "List of availability zones"
    default            =["us-east-1a", "us-east-1b"]
}

variable "Vpc_id"{
    type               = string
    description        = "List of availability zones"
    default            ="vpc-030c8bd0fbea06035"
}