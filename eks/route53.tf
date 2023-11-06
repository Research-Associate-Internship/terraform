 resource "aws_route53_record" "NextGenDS-rac3" {
   zone_id = "Z03309881PN2JZ6GGLOJ8"
   name    = "nextgends-rac3.axle-interns.com"
   type    = "A"

   alias {
     name                   = "k8s-game2048-ingress2-46ee75eeb1-403890270.us-east-1.elb.amazonaws.com"
     zone_id                = "Z35SXDOTRQ7X7K"
     evaluate_target_health = true
   }

 }

# resource "aws_route53_record" "kibana" {
#   zone_id = "Z03309881PN2JZ6GGLOJ8"
#   name    = "Kibana.axle-interns.com"
#   type    = "A"

#   alias {
#     name                   = "Kibana-ALB-613920680.us-east-1.elb.amazonaws.com"
#     zone_id                = "Z35SXDOTRQ7X7K"
#     evaluate_target_health = true
#   }

# }
