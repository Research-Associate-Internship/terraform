# aws_security_group.Bastion:
resource "aws_security_group" "Bastion" {
    arn         = "arn:aws:ec2:us-east-1:853931821519:security-group/sg-07e11b0fcfe97acde"
    description = "Ssh accestion to bastion"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    id          = "sg-07e11b0fcfe97acde"
    ingress     = [
        {
            cidr_blocks      = [
                "209.183.243.114/32",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "71.163.48.190/32",
            ]
            description      = "home-ip"
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    name        = "Bastion"
    owner_id    = "853931821519"
    tags        = {
        "Department" = "DevSecOps Associate"
        "Name"       = "bastion-SG"
    }
    tags_all    = {
        "Department" = "DevSecOps Associate"
        "Name"       = "bastion-SG"
    }
    vpc_id      = "vpc-0651fb5d5d1009dd8"
}
