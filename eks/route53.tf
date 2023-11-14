 resource "aws_route53_record" "Vote-NextGenDS-rac3" {
   zone_id = "Z03309881PN2JZ6GGLOJ8"
   name    = "vote-nextgends-rac3.axle-interns.com"
   type    = "A"

   alias {
     name                   = "k8s-votingap-ingressa-c0ea729ab3-1109160181.us-east-1.elb.amazonaws.com"
     zone_id                = "Z35SXDOTRQ7X7K"
     evaluate_target_health = true
   }

 }
resource "aws_route53_record" "Result-NextGenDS-rac3" {
   zone_id = "Z03309881PN2JZ6GGLOJ8"
   name    = "result-nextgends-rac3.axle-interns.com"
   type    = "A"

   alias {
     name                   = "k8s-votingap-ingressa-13f8d7a366-569281114.us-east-1.elb.amazonaws.com"
     zone_id                = "Z35SXDOTRQ7X7K"
     evaluate_target_health = true
   }

 }

