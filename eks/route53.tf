 resource "aws_route53_record" "NextGenDS-rac3" {
   zone_id = "Z03309881PN2JZ6GGLOJ8"
   name    = "vote-nextgends-rac3.axle-interns.com"
   type    = "A"

   alias {
     name                   = "a883535d12a3f4ef79961d0ad5969e6c-1948833605.us-east-1.elb.amazonaws.com"
     zone_id                = "Z35SXDOTRQ7X7K"
     evaluate_target_health = true
   }

 }
resource "aws_route53_record" "NextGenDS-rac3" {
   zone_id = "Z03309881PN2JZ6GGLOJ8"
   name    = "result-nextgends-rac3.axle-interns.com"
   type    = "A"

   alias {
     name                   = "a883535d12a3f4ef79961d0ad5969e6c-1948833605.us-east-1.elb.amazonaws.com"
     zone_id                = "Z35SXDOTRQ7X7K"
     evaluate_target_health = true
   }

 }

