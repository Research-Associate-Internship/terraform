resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = local.tags
}

resource "aws_subnet" "public_subnet_1" {
    cidr_block = var.public_subnet_1_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
    tags = {
        Name = "nextgends-vpc-pub-snet-1"
    }
}

resource "aws_subnet" "public_subnet_2" {
    cidr_block = var.public_subnet_2_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
    tags = {
        Name = "nextgends-vpc-pub-snet-2"
    }
}

resource "aws_subnet" "private_subnet_1" {
    cidr_block = var.private_subnet_1_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
    tags = {
        Name = "nextgends-vpc-pvt-snet-1"
    }
}

resource "aws_subnet" "private_subnet_2" {
    cidr_block = var.private_subnet_2_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
    tags = {
        Name = "nextgends-vpc-pvt-snet-2"
    }
}


resource "aws_subnet" "private_subnet_3" {
    cidr_block = var.private_subnet_3_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
    tags = {
        Name = "nextgends-vpc-pvt-snet-3"
    }
}

resource "aws_subnet" "private_subnet_4" {
    cidr_block = var.private_subnet_4_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
    tags = {
        Name = "nextgends-vpc-pvt-snet-4"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "igw"
    }
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "rtb-public"
    }
}

resource "aws_route" "public_route" {
    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_association_1" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_association_2" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_eip" "nat_eip" {
    vpc = true
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public_subnet_1.id
    tags = {
        Name = "nat-gw"
    }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "rtb-private"
    }
}

resource "aws_route" "private_route" {
    route_table_id = aws_route_table.private_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_association_1" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association_2" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association_3" {
    subnet_id = aws_subnet.private_subnet_3.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association_4" {
    subnet_id = aws_subnet.private_subnet_4.id
    route_table_id = aws_route_table.private_route_table.id
}