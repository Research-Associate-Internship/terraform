 resource "aws_route53_record" "NextGenDS-rac3" {
   zone_id = "Z03309881PN2JZ6GGLOJ8"
   name    = "NextGenDS-rac3.axle-interns.com"
   type    = "A"

   alias {
     name                   = "a974ca6fa09694380a82f1e11c1b3730-1473608677.us-east-1.elb.amazonaws.com"
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
