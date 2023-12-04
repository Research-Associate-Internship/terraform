# provider "kubernetes" {
#   config_context_cluster   = "NextGenDS-rac3"
# }

# # ------------------------vote NextGenDS application ALB-----------------------------------

# resource "aws_lb_listener" "default" {
#   load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:loadbalancer/app/k8s-votingap-ingressa-c0ea729ab3/d6ac63d967162fb2"

#   protocol = "HTTPS"
#   port     = 443
#   certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/f0ac5327-5fc3-4cd9-b47c-05828e5dc265"
#   default_action {
#     type             = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       status_code  = "404"
#       message_body = "Response body"
#     }
#   }
# }
# resource "aws_lb_listener_rule" "vote" {
#   listener_arn = aws_lb_listener.default.arn
#   priority     = 1

#   action {
#     type = "forward"
#     target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:targetgroup/k8s-votingap-vote-fc048001fc/56462b07197cfef8"

     
#   }

#   condition {
#     path_pattern {
#       values = ["/*"]
#     }
#   }
#   condition {
#     host_header {
#       values = ["vote-nextgends-rac3.axle-interns.com"]
#     }
#   }
# }
# resource "aws_lb_listener" "default-http" {
#   load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:loadbalancer/app/k8s-votingap-ingressa-c0ea729ab3/d6ac63d967162fb2"

#   protocol = "HTTP"
#   port     = 80
#   default_action {
#     type             = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       status_code  = "404"
#       message_body = "Response body"
#     }
#   }
# }
# resource "aws_lb_listener_rule" "vote-http" {
#   listener_arn = aws_lb_listener.default-http.arn
#   priority     = 1

#   action {
#     type = "redirect"
#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
     
#   }
  

#   condition {
#     path_pattern {
#       values = ["/*"]
#     }
#   }
#   condition {
#     host_header {
#       values = ["vote-nextgends-rac3.axle-interns.com"]
#     }
#   }
# }

# # ----------------------- For result nextgends application----------------------------

# resource "aws_lb_listener" "default-result" {
#   load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:loadbalancer/app/k8s-votingap-ingressa-13f8d7a366/9c986a6d23f3a7e7"

#   protocol = "HTTPS"
#   port     = 443
#   certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/e6678212-15eb-4d1f-908a-adce5ec60bd3"
#   default_action {
#     type             = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       status_code  = "404"
#       message_body = "Response body"
#     }
#   }
# }
# resource "aws_lb_listener_rule" "https-result" {
#   listener_arn = aws_lb_listener.default-result.arn
#   priority     = 1

#   action {
#     type = "forward"
#     target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:targetgroup/k8s-votingap-result-09dd2b5084/0862ce0d20d1fe2e"
     
#   }

#   condition {
#     path_pattern {
#       values = ["/*"]
#     }
#   }
#   condition {
#     host_header {
#       values = ["result-nextgends-rac3.axle-interns.com"]
#     }
#   }
# }
# resource "aws_lb_listener" "default-result-http" {
#   load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:loadbalancer/app/k8s-votingap-ingressa-13f8d7a366/9c986a6d23f3a7e7"

#   protocol = "HTTP"
#   port     = 80
#   default_action {
#     type             = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       status_code  = "404"
#       message_body = "Response body"
#     }
#   }
# }
# resource "aws_lb_listener_rule" "result-http" {
#   listener_arn = aws_lb_listener.default-result-http.arn
#   priority     = 1

#   action {
#     type = "redirect"
#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
     
#   }
  

#   condition {
#     path_pattern {
#       values = ["/*"]
#     }
#   }
#   condition {
#     host_header {
#       values = ["result-nextgends-rac3.axle-interns.com"]
#     }
#   }
# }
# #--------------Kibana alb---------------------
# resource "aws_lb_listener" "default-kibana" {
#   load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:loadbalancer/app/k8s-votingap-ingressk-e24fe8242b/633fe3ffd2b728d2"

#   protocol = "HTTPS"
#   port     = 443
#   certificate_arn   = "arn:aws:acm:us-east-1:853931821519:certificate/9b5e3d4d-80ef-44af-996d-a3bf63d15ba6"
#   default_action {
#     type             = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       status_code  = "404"
#       message_body = "Response body"
#     }
#   }
# }
# resource "aws_lb_listener_rule" "https-kibana" {
#   listener_arn = aws_lb_listener.default-kibana.arn
#   priority     = 1

#   action {
#     type = "forward"
#     target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:targetgroup/k8s-votingap-kibananp-b4d0b7f4ed/b0d17879f3a7fff3"
     
#   }

#   condition {
#     path_pattern {
#       values = ["/*"]
#     }
#   }
#   condition {
#     host_header {
#       values = ["kibana-logs.axle-interns.com"]
#     }
#   }
# }
# resource "aws_lb_listener" "default-kibana-http" {
#   load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:853931821519:loadbalancer/app/k8s-votingap-ingressk-e24fe8242b/633fe3ffd2b728d2"

#   protocol = "HTTP"
#   port     = 80
#   default_action {
#     type             = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       status_code  = "404"
#       message_body = "Response body"
#     }
#   }
# }
# resource "aws_lb_listener_rule" "kibana-http" {
#   listener_arn = aws_lb_listener.default-kibana-http.arn
#   priority     = 1

#   action {
#     type = "redirect"
#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
     
#   }
  

#   condition {
#     path_pattern {
#       values = ["/*"]
#     }
#   }
#   condition {
#     host_header {
#       values = ["kibana-logs.axle-interns.com"]
#     }
#   }
# }