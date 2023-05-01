resource "aws_lb" "ALB" {
    name               = "ALB-DevSecOps"
    internal           = false
    load_balancer_type = "application"

    security_groups = [aws_security_group.ALB-SG.id]

    subnets                                     = [
        "${element(module.vpc.public_subnets, 0)}"
,
        "${element(module.vpc.public_subnets, 1)}"
,
    ]

    tags                                        = {
        "Department" = "DevSecOps Associate"
    }

}

# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:targetgroup/jenkins-TG/4f738e491a3446aa"
#   target_id        = [aws_instance.jenkins.id]
#   port             = 8080
# }