# aws_instance.bastion-host-jenkins:
resource "aws_instance" "bastion-host-jenkins" {
    ami                                  = "ami-007855ac798b5175e"
    arn                                  = "arn:aws:ec2:us-east-1:853931821519:instance/i-042ffbe6467dc08cc"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1a"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-042ffbe6467dc08cc"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "stopped"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    key_name                             = "ec2"
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-03840c9fd00305392"
    private_dns                          = "ip-10-0-6-24.ec2.internal"
    private_ip                           = "10.0.6.24"
    public_dns                           = "ec2-54-164-66-143.compute-1.amazonaws.com"
    public_ip                            = "54.164.66.143"
    secondary_private_ips                = []
    security_groups                      = []
    source_dest_check                    = true
    subnet_id                            = "subnet-0360cb0549b1c93e8"
    tags                                 = {
        "Department" = "DevSecOps Associate"
        "Name"       = "bastion-host-jenkins"
    }
    tags_all                             = {
        "Department" = "DevSecOps Associate"
        "Name"       = "bastion-host-jenkins"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-07e11b0fcfe97acde",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-0205fbcdd5b4941aa"
        volume_size           = 8
        volume_type           = "gp2"
    }
}

# aws_instance.jenkins-master:
resource "aws_instance" "jenkins-master" {
    ami                                  = "ami-007855ac798b5175e"
    arn                                  = "arn:aws:ec2:us-east-1:853931821519:instance/i-0f667ddcacab11aac"
    associate_public_ip_address          = false
    availability_zone                    = "us-east-1a"
    cpu_core_count                       = 2
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-0f667ddcacab11aac"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "stopped"
    instance_type                        = "t2.medium"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    key_name                             = "Bastion"
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-0adb9cd66e131ac85"
    private_dns                          = "ip-10-0-143-232.ec2.internal"
    private_ip                           = "10.0.143.232"
    secondary_private_ips                = []
    security_groups                      = []
    source_dest_check                    = true
    subnet_id                            = "subnet-0beb38d9d80bc9ba5"
    tags                                 = {
        "Department" = "DevSecOps Associate"
        "Name"       = "jenkins-master"
    }
    tags_all                             = {
        "Department" = "DevSecOps Associate"
        "Name"       = "jenkins-master"
    }
    tenancy                              = "default"
    user_data                            = "7dfafc19a2c25accee505d8056777f393749fcd9"
    vpc_security_group_ids               = [
        "sg-031d16547cf6d9d9a",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-0ae0cda0b3d73ee1a"
        volume_size           = 8
        volume_type           = "gp2"
    }
}

