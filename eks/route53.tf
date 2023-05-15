resource "aws_route53_record" "NextGenDS" {
  zone_id = "Z03309881PN2JZ6GGLOJ8"
  name    = "NextGenDS.axle-interns.com"
  type    = "A"

  alias {
    name                   = "a10f91a8e70804e26883e824ebf21ab2-94164822.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }

}