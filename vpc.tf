# aws_nat_gateway.jenkins-NAT:
resource "aws_nat_gateway" "jenkins-NAT" {
    allocation_id        = "eipalloc-0967103550750f4d8"
    association_id       = "eipassoc-0601f6d46ca9b3a17"
    connectivity_type    = "public"
    id                   = "nat-0f31585dcb1004881"
    network_interface_id = "eni-0df7008d741da2ae8"
    private_ip           = "10.0.6.224"
    public_ip            = "35.171.54.47"
    subnet_id            = "subnet-0360cb0549b1c93e8"
    tags                 = {
        "Department" = "DevSecOps Associate"
        "Name"       = "jenkins-NAT"
    }
    tags_all             = {
        "Department" = "DevSecOps Associate"
        "Name"       = "jenkins-NAT"
    }
}


# aws_vpc.Jenkins-vpc:
resource "aws_vpc" "Jenkins-vpc" {
    arn                                  = "arn:aws:ec2:us-east-1:853931821519:vpc/vpc-0651fb5d5d1009dd8"
    assign_generated_ipv6_cidr_block     = false
    cidr_block                           = "10.0.0.0/16"
    default_network_acl_id               = "acl-021d469a29dfd791b"
    default_route_table_id               = "rtb-07eead6ad6339e66a"
    default_security_group_id            = "sg-01791e4811109637f"
    dhcp_options_id                      = "dopt-00b3709299e0f88f6"
    enable_classiclink                   = false
    enable_classiclink_dns_support       = false
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    id                                   = "vpc-0651fb5d5d1009dd8"
    instance_tenancy                     = "default"
    ipv6_netmask_length                  = 0
    main_route_table_id                  = "rtb-07eead6ad6339e66a"
    owner_id                             = "853931821519"
    tags                                 = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-vpc"
    }
    tags_all                             = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-vpc"
    }
}

# aws_subnet.public1a:
resource "aws_subnet" "public1a" {
    arn                                            = "arn:aws:ec2:us-east-1:853931821519:subnet/subnet-0360cb0549b1c93e8"
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1a"
    availability_zone_id                           = "use1-az6"
    cidr_block                                     = "10.0.0.0/20"
    enable_dns64                                   = false
    enable_lni_at_device_index                     = 0
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    id                                             = "subnet-0360cb0549b1c93e8"
    ipv6_native                                    = false
    map_customer_owned_ip_on_launch                = false
    map_public_ip_on_launch                        = false
    owner_id                                       = "853931821519"
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-subnet-public1-us-east-1a"
    }
    tags_all                                       = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-subnet-public1-us-east-1a"
    }
    vpc_id                                         = "vpc-0651fb5d5d1009dd8"
}

# aws_subnet.public1b:
resource "aws_subnet" "public1b" {
    arn                                            = "arn:aws:ec2:us-east-1:853931821519:subnet/subnet-0688affb9b95e3368"
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1b"
    availability_zone_id                           = "use1-az1"
    cidr_block                                     = "10.0.101.0/24"
    enable_dns64                                   = false
    enable_lni_at_device_index                     = 0
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    id                                             = "subnet-0688affb9b95e3368"
    ipv6_native                                    = false
    map_customer_owned_ip_on_launch                = false
    map_public_ip_on_launch                        = false
    owner_id                                       = "853931821519"
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-subnet-public1-us-east-1b"
    }
    tags_all                                       = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-subnet-public1-us-east-1b"
    }
    vpc_id                                         = "vpc-0651fb5d5d1009dd8"
}


# aws_subnet.private1a:
resource "aws_subnet" "private1a" {
    arn                                            = "arn:aws:ec2:us-east-1:853931821519:subnet/subnet-0beb38d9d80bc9ba5"
    assign_ipv6_address_on_creation                = false
    availability_zone                              = "us-east-1a"
    availability_zone_id                           = "use1-az6"
    cidr_block                                     = "10.0.128.0/20"
    enable_dns64                                   = false
    enable_lni_at_device_index                     = 0
    enable_resource_name_dns_a_record_on_launch    = false
    enable_resource_name_dns_aaaa_record_on_launch = false
    id                                             = "subnet-0beb38d9d80bc9ba5"
    ipv6_native                                    = false
    map_customer_owned_ip_on_launch                = false
    map_public_ip_on_launch                        = false
    owner_id                                       = "853931821519"
    private_dns_hostname_type_on_launch            = "ip-name"
    tags                                           = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-subnet-private1-us-east-1a"
    }
    tags_all                                       = {
        "Department" = "DevSecOps Associate"
        "Name"       = "Jenkins-subnet-private1-us-east-1a"
    }
    vpc_id                                         = "vpc-0651fb5d5d1009dd8"
}