resource "aws_route53_record" "NextGenDS" {
  zone_id = "Z03309881PN2JZ6GGLOJ8"
  name    = "NextGenDS.axle-interns.com"
  type    = "A"

  alias {
    name                   = "ac4dee8cfa1124512b5d449e8790fe09-1851524569.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }

}
