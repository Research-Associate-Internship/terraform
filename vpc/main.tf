resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = local.tags
}

resource "aws_subnet" "subnet_1" {
    cidr_block = var.subnet_1_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_2" {
    cidr_block = var.subnet_2_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_3" {
    cidr_block = var.subnet_3_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_4" {
    cidr_block = var.subnet_4_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
}

resource "aws_subnet" "subnet_5" {
    cidr_block = var.subnet_5_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
}

resource "aws_subnet" "subnet_6" {
    cidr_block = var.subnet_6_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
}