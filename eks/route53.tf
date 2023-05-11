resource "aws_route53_record" "NextGenDS" {
  zone_id = "Z03309881PN2JZ6GGLOJ8"
  name    = "NextGenDS.axle-interns.com"
  type    = "A"

  alias {
    name                   = "a81a4607eefaf45e9bc1537c06e773ea-859854750.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }

}