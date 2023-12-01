provider "kubernetes" {
  config_context_cluster   = "NextGenDS-rac3"
}
resource "aws_lb_listener" "default" {
  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:loadbalancer/app/k8s-votingap-ingressa-c0ea729ab3/d6ac63d967162fb2"

  protocol = "HTTPS"
  port     = 443

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
      message_body = "Response body"
    }
  }
}
resource "aws_lb_listener_rule" "vote" {
  listener_arn = aws_lb_listener.default.arn
  priority     = 1

  action {
    type = "forward"
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:targetgroup/k8s-votingap-vote-fc048001fc/56462b07197cfef8"
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
  condition {
    host_header {
      values = ["vote-nextgends-rac3.axle-interns.com"]
    }
  }
}

# resource "aws_lb" "vote" {
#   name               = "k8s-votingap-ingressa-c0ea729ab3"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["sg-0750dc02e225c822d"]
#   subnets            = ["subnet-0a752048fb3caf902", "subnet-004729a17faf46257"]

#   tags = {
#     elbv2.k8s.aws/cluster =	"NextGenDS-rac3-cluster"
#     ingress.k8s.aws/resource =	"LoadBalancer"
#     ingress.k8s.aws/stack =	"voting-app/ingress-kibana"
#   }
# }
# resource "aws_lb_target_group" "kibana" {
#   name     = "k8s-votingap-kibananp-b4d0b7f4ed"
#   port     = 5601
#   protocol = "HTTP"
#   vpc_id   = "vpc-0945dd8c0e44991b0" 

#   health_check {
#     path = "/"
#   }

#   tags = {
#     elbv2.k8s.aws/cluster =	"NextGenDS-rac3-cluster"
#     ingress.k8s.aws/resource =	"voting-app/ingress-kibana-kibana-np:80"
#     ingress.k8s.aws/stack =	"voting-app/ingress-kibana"
#   }

# }
# resource "aws_lb_listener" "kibana-tg-443" {
#   load_balancer_arn = aws_lb.kibana.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/9b5e3d4d-80ef-44af-996d-a3bf63d15ba6"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.kibana.arn
#   }
# }
# resource "aws_lb_listener" "kibana-tg" {
#   load_balancer_arn = aws_lb.kibana.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }

