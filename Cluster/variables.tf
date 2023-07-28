variable "private_subnets" {
    type               = list(string)
    description        = "List of private subnets"
    default            =["subnet-036334c85967c244c", "subnet-01ded683ede10c12f", "subnet-0b44842e06fffde10", "subnet-0208a5229440e1cfb"]

}

variable "public_subnets" {
    type               = list(string)
    description        = "List of public subnets"
    default            =["subnet-0d71d482d46a8de2c", "subnet-0d3bb4ed495617d63"]

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